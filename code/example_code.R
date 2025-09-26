# devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)
library(tidyverse)
library(htmltools)


# Aggregated Gas Storage Inventory
daily_country_data <-
  GraphQL_get_table_vec(
    tabellenname = "data_agsi_gasspeicher_gas_storage_by_country",
    variablen = c(
      "_id",
      "country",
      "country_code",
      "date",
      "gas_in_storage",
      "injection",
      "status",
      "withdrawal",
      "working_gas_volume",
      "withdrawal_capacity",
      "injection_capacity",
      "status"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

daily_facility_data <-
  GraphQL_get_table_vec(
    tabellenname = "data_agsi_gasspeicher_gas_storage_by_facility",
    variablen = c(
      "_id",
      "company_eic",
      "company_name",
      "country_code",
      "date",
      "facility_eic",
      "facility_name",
      "gas_in_storage",
      "injection",
      "status",
      "withdrawal",
      "working_gas_volume",
      "withdrawal_capacity",
      "injection_capacity",
      "status"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

# Population forecasts
bevoelkerungsprognosen <-
  GraphQL_get_table_vec(
    tabellenname = "data_bevoelkerung_bevoelkerungsprognosen",
    variablen = c(
      "Variant",
      "TPopulation1July",
      "TFR",
      "Szenario",
      "Revision",
      "Land"
    )
  )

altersverteilung <-
  GraphQL_get_table_vec(
    tabellenname = "data_bevoelkerung_altersverteilung",
    variablen = c(
      "AgeGrp",
      "Land",
      "PopTotal",
      "Szenario",
      "Time",
      "Variant"
    )
  )

# BNetzA gas data
BNetzA_gas_import_export <-
  GraphQL_get_table_vec(
    tabellenname = "data_bnetza_gas_import_export",
    variablen = c(
      "Datum",
      "Deutschland_Export",
      "Deutschland_Import",
      "Deutschland_Produktion"
    )
  )

BNetzA_gas_verbrauch <-
  GraphQL_get_table_vec(
    tabellenname = "data_bnetza_gas_verbrauch",
    variablen = c(
      "Datum",
      "Durchschnitt_2018_2021",
      "Gasverbrauch",
      "Jahr",
      "Kalenderwoche",
      "Verbraucher"
    )
  )

# Energy charts
energy_charts_installierte_leistung <-
  GraphQL_get_table_vec(
    tabellenname = "data_energy_charts_installierte_leistung",
    variablen = c(
      "source",
      "date",
      "capacity"
    )
  )

# ENTSO-E Transpacancy Platform
load_data <-
  GraphQL_get_table_vec(
    tabellenname = "data_entsoe_stromdaten_load",
    variablen = c("timestamp", "load"),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

generation_data <-
  GraphQL_get_table_vec(
    tabellenname = "data_entsoe_stromdaten_generation",
    variablen = c("timestamp", "generation_type", "generation", "consumption"),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

# NRW hospital planning
feststellungsbescheide <- GraphQL_get_table_string(
  datenserver = "https://data.smclab.io/v1/graphql",
  querystring = paste0(
    "query MyQuery {
    data_kliniken_nrw_krankenhausplanung_feststellungsbescheide {
      IK
      Kreis
      Landesteil
      Leistungsgruppe
      Leistungsgruppe_Id
      Name_Krankenhaus
      Planungsebene
      Regierungsbezirk
      Standortnummer
      Versorgungsgebiet
      beantragender_Standort_Name
      beantragte_Fallzahl
      genehmigte_Fallzahl
      relationship_standortnummer {
        Ort 
        lat
        lon
      }
      relationship_nrw_additional_geodaten {
        lat
        lon
      }
    }
  }"
  )
) |>
  unnest(relationship_standortnummer, names_sep = "_") |>
  rename(
    lat_inek = relationship_standortnummer_lat,
    lon_inek = relationship_standortnummer_lon
  ) |>
  rename(Ort = relationship_standortnummer_Ort) |>
  unnest(relationship_nrw_additional_geodaten, names_sep = "_") |>
  rename(
    lat_manuell = relationship_nrw_additional_geodaten_lat,
    lon_manuell = relationship_nrw_additional_geodaten_lon
  ) |>
  mutate(
    lat = if_else(is.na(lat_inek), lat_manuell, lat_inek),
    lon = if_else(is.na(lon_inek), lon_manuell, lon_inek)
  ) |>
  mutate(
    `Geokoordinaten vorhanden` = ifelse(
      is.na(lat) |
        is.na(lon),
      "Nein",
      "Ja"
    )
  ) |>
  select(-c("lat", "lon")) |>
  mutate(
    beantragte_Fallzahl = as.integer(beantragte_Fallzahl),
    genehmigte_Fallzahl = as.integer(genehmigte_Fallzahl)
  ) |>
  rename(
    Institutskennzeichen = IK,
    Leistungsgruppe = Leistungsgruppe,
    `Leistungsgruppe ID` = Leistungsgruppe_Id,
    `Name Krankenhaus` = Name_Krankenhaus,
    `beantragender Klinikstandort` = beantragender_Standort_Name,
    `beantragte Fallzahl` = beantragte_Fallzahl,
    `genehmigte Fallzahl` = genehmigte_Fallzahl
  ) |>
  arrange(Leistungsgruppe, desc(`genehmigte Fallzahl`)) |>
  mutate(across(
    c(
      Leistungsgruppe,
      `Leistungsgruppe ID`,
      Planungsebene,
      Kreis,
      Versorgungsgebiet,
      Regierungsbezirk,
      Landesteil,
      `Geokoordinaten vorhanden`
    ),
    as.factor
  )) |>
  rename(`genehmigte Fallzahl*` = `genehmigte Fallzahl`)

fahrzeiten_allgemeine_innere_medizin <- GraphQL_get_table_vec(
  variablen = c(
    "Gemeindeschluessel",
    "Mittlere_Gewichtete_Fahrzeit",
    "geometry",
    "label"
  ),
  tabellenname = "data_kliniken_nrw_krankenhausplanung_fahrzeiten",
  datenserver = "https://data.smclab.io/v1/graphql",
  where = 'leistungsgruppe: {_eq: "Allgemeine Innere Medizin"}'
) |>
  convert_geometry_column() |>
  rowwise() |>
  mutate(label = HTML(label)) |>
  ungroup()

# Preprint Recommender bioRxiv and medRxiv
biomedrxiv_earlyuserstats <-
  GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_earlyuserstats",
    variablen = c(
      "abstract",
      "altmetric",
      "date",
      "doi",
      "fulltext_html",
      "pdf"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

biomedrxiv_thresholds <-
  GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_thresholds",
    variablen = c(
      "_id",
      "alpha",
      "archiv",
      "date",
      "day",
      "metric",
      "threshold"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

biomedrxiv_versions <-
  GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_versions",
    variablen = c(
      "author_corresponding",
      "author_corresponding_institution",
      "authors",
      "category",
      "date",
      "doi",
      "license",
      "server",
      "title",
      "type",
      "version",
      "abstract"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

biomedrxiv_recommendations <-
  GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_recommendations",
    variablen = c("day", "doi", "metric", "preprint_date", "value"),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

# Martkstammdaten
server_url <- "https://data.smclab.io/v1/graphql"
db_prefix <- "data_"

# EinheitenWind
wind_extended <-
  # marktstammdaten_einheiten_wind
  GraphQL_get_table_vec(
    variablen = c(
      "EinheitMastrNummer", # vorher nur MastrNummer?
      "Nettonennleistung",
      "Bundesland",
      "EinheitBetriebsstatus",
      "Inbetriebnahmedatum",
      "Lage",
      "DatumEndgueltigeStilllegung",
      "DatumBeginnVoruebergehendeStilllegung"
    ),
    tabellenname = paste0(db_prefix, "marktstammdaten_einheiten_wind"),
    datenserver = server_url
  ) |>
  rename(MastrNummer = EinheitMastrNummer) |>
  # marktstammdaten_einheiten_genehmigung
  left_join(
    GraphQL_get_table_vec(
      # permits_units
      tabellenname = paste0(db_prefix, "marktstammdaten_einheiten_genehmigung"),
      variablen = c(
        "VerknuepfteEinheitenMaStRNummer",
        "Frist",
        "Datum",
        "Art"
      ),
      datenserver = server_url
    ) |>
      rename(
        MastrNummer = VerknuepfteEinheitenMaStRNummer,
        FristGenehmigung = Frist,
        DatumGenehmigung = Datum,
        ArtGenehmigung = Art
      ),
    by = "MastrNummer"
  ) |>
  mutate(
    across(
      c(
        Inbetriebnahmedatum,
        DatumEndgueltigeStilllegung,
        DatumBeginnVoruebergehendeStilllegung,
        FristGenehmigung,
        DatumGenehmigung,
      ),
      as.Date
    ),
    `Nettonennleistung in MW` = Nettonennleistung / 1000
  ) |>
  filter(Lage == "Windkraft an Land")


# marktstammdaten_tenders_bnetza
BNetzA_Zuschlaege_raw <-
  GraphQL_get_table_vec(
    # Ausschreibungen BNetzA
    tabellenname = paste0(db_prefix, "marktstammdaten_tenders_bnetza"),
    variablen = c(
      "Ausschreibungsdatum_BNetzA",
      "Ausschreibungsnummer_BNetzA",
      "MastrNummer"
    ),
    datenserver = server_url
  )

BNetzA_Zuschlaege <-
  BNetzA_Zuschlaege_raw |>
  # Anlage nur mit dem neuesten Zuschlag zählen
  filter(
    Ausschreibungsdatum_BNetzA == max(Ausschreibungsdatum_BNetzA),
    .by = MastrNummer
  ) |>
  mutate(Ausschreibungsdatum_BNetzA = as.Date(Ausschreibungsdatum_BNetzA))

wind_extended <-
  wind_extended |>
  left_join(
    BNetzA_Zuschlaege,
    by = "MastrNummer"
  )


# SMC Story Data
smc_story_meta <-
  GraphQL_get_table_vec(
    tabellenname = "smc_story_meta",
    variablen = c(
      "story_no",
      "title",
      "type",
      "url",
      "ressort",
      "publication_date"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )

# World Bank World Development Indicators

wdi <-
  GraphQL_get_table_vec(
    tabellenname = "data_worldbank_world_development_indicators",
    variablen = c("population", "country_en", "year"),
    datenserver = "https://data.smclab.io/v1/graphql"
  )
