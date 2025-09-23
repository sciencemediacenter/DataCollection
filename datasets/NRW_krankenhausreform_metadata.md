# Dataset: NRW hospital planning


## About <a name = "about"></a>

The dataset contains data published by the [MAGS NRW](https://www.mags.nrw/startseite/gesundheit/krankenhausplanung-nrw/planungsergebnisse/planungsergebnisse-alle-0) related to the NRW hospital planning. In `data_kliniken_nrw_krankenhausplanung_feststellungsbescheide` the official notices contain the final assignment of service groups to hospital locations. In `data_kliniken_nrw_krankenhausplanung_anhoerung` the data retrieved from the preliminary consultation letters is contained. With `data_kliniken_standorte` (obtained from [InEK-Standortverzeichnis](https://krankenhausstandorte.de/login)) and `data_kliniken_nrw_kliniken_geodaten_manuell_ermittelt` the geolocations of hospital locations are linked to the hospital ID. Further, `data_kliniken_nrw_krankenhausplanung_fahrzeiten` contains the averaged, weighted driving times per municipality and service group as displayed [here](https://krankenhausplanung-nrw.smc.report/). These records are static and no updates are planned.

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** data_kliniken_nrw_krankenhausplanung_feststellungsbescheide

```JSON
    {
        "IK": "260511348",
        "Kreis": "Viersen",
        "Landesteil": null,
        "Leistungsgruppe": "Allgemeine Innere Medizin",
        "Leistungsgruppe_Id": "1.1",
        "Name_Krankenhaus": "Hospital Zum Heiligen Geist",
        "Planungsebene": "Kreis",
        "Regierungsbezirk": null,
        "Standortnummer": "773342000",
        "Versorgungsgebiet": null,
        "beantragender_Standort_Name": "Hospital zum Heiligen Geist Standort Kempen",
        "beantragte_Fallzahl": 3204,
        "genehmigte_Fallzahl": 3546,
        "genehmigte_Fallzahl_anhoerung_eins": 3546,
        "genehmigte_Fallzahl_anhoerung_zwei": null,
        "relationship_nrw_additional_geodaten": null,
        "relationship_standortnummer": {
          "Ort": "Kempen, Niederrhein",
          "Standortnummer": "773342000",
          "lat": 51.36301,
          "lon": 6.411148
        }
      },
```

**Field ID:** data_kliniken_nrw_krankenhausplanung_anhoerung

```JSON
    {
        "IK": "260570022",
        "Kreis": null,
        "Landesteil": null,
        "Leistungsgruppe": "Komplexe Endokrinologie und Diabetologie",
        "Leistungsgruppe_Id": "2.1",
        "Name_Krankenhaus": "Klinikum Bielefeld gem.GmbH",
        "Planungsebene": "Regierungsbezirk",
        "Regierungsbezirk": "Detmold",
        "Standortnummer": "772831000",
        "Versorgungsgebiet": null,
        "beantragender_Standort_Name": "Klinikum Bielefeld Mitte",
        "beantragte_Fallzahl": 0,
        "genehmigte_Fallzahl": 1,
        "relationship_nrw_additional_geodaten": null,
        "relationship_standortnummer": {
          "lon": 8.544199,
          "lat": 52.01435,
          "Standortnummer": "772831000",
          "Ort": "Bielefeld"
        }
      },
```

**Field ID:** data_kliniken_nrw_krankenhausplanung_fahrzeiten

```JSON
    {
        "Mittlere_Gewichtete_Fahrzeit": 26.512,
        "geometry": {
          "type": "MultiPolygon",
          "crs": {
            "type": "name",
            "properties": {
              "name": "urn:ogc:def:crs:EPSG::4326"
            }
          },
          "coordinates": [
            [
              [
                [
                  7.4622,
                  50.8787
                ], 
                ...
              ]
            ]
          ]
        },
        "label": "<strong>Ruppichteroth</strong><br/>Fahrzeit in min: 26,5<br/>Einwohner:innen:    10 825",
        "leistungsgruppe": "Komplexe Pneumologie",
        "Gemeindeschluessel": "05382052"
      },
```

## Example Query

```GraphQL
query MyQuery {
  data_kliniken_nrw_krankenhausplanung_feststellungsbescheide(limit: 1) {
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
    genehmigte_Fallzahl_anhoerung_eins
    genehmigte_Fallzahl_anhoerung_zwei
    relationship_nrw_additional_geodaten {
      Standortnummer
      lat
      lon
    }
    relationship_standortnummer {
      Ort
      Standortnummer
      lat
      lon
    }
  }
}

```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)
library(tidyverse)
library(htmltools)

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
```

## Licence

It is mandatory to credit or mention to GIE (Gas Infrastructure Europe) and AGSI as data source when using or repackaging this data. 
