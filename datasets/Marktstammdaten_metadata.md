# Dataset: Marktstammdaten

## About <a name = "about"></a>

Der Datensatz dient unter anderem als Grundlage für den [Data Report "Das Wind-Ausbauziel für 2024"](https://www.sciencemediacenter.de/alle-angebote/data-report/details/news/das-wind-ausbauziel-fuer-2024/). Er besteht zum einen Teil aus Daten des [Marktstammdatenregisters](https://www.marktstammdatenregister.de/MaStR) und zum anderen Teil aus
den [Ausschreibungsergebnissen](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Ausschreibungen/Wind_Onshore/BeendeteAusschreibungen/start.html) der Bundesnetzagentur. 
Das Marktstammdatenregister ist eine von der Bundesnetzagentur geführte Datenbank zur Erfassung und Verwaltung von Informationen über alle Akteure und Anlagen im deutschen Strom- und Gasmarkt. Die Einträge erfolgen dabei von den Akteuren und Anlagenbetreibern in Eigenverantwortung selbst. Der Zugriff auf die Daten des Marktstammdatenregisters erfolgt über den Gesamtdatenexport, der täglich aktualisiert wird. Die Daten zu den Ausschreibungsergebnissen werden aus den von der Bundesnetzargentur veröffentlichten [.csv Dateien](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Ausschreibungen/Wind_Onshore/BeendeteAusschreibungen/start.html) extrahiert. Die Daten werden immer nach bekanntgabe der Zuschläge aktualisiert.


## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

Folgende Tabellen sind relevant:
- data_marktstammdaten_einheiten_wind
- data_marktstammdaten_einheiten_genehmigung
- data_marktstammdaten_tenders_bnetza
- data_marktstammdaten_wind_extended (deprecated, replaced by einheiten_wind)
- data_marktstammdaten_permits_units (deprecated, replaced by einheiten_genehmigung)
- data_marktstammdaten_tenders_eeg (deprecated, replaced by tenders_bnetza)

Sie können alle über die MastrNummer miteinander verknüpft werden.

### data_marktstammdaten_einheiten_wind

Diese Tabelle enthält die kompletten Daten aus der `EinheitenWind.xml` aus dem Marktstammdatenregister. Hier sind alle Grundinformationen zu den Windkraftanlagen enthalten.

```GraphQL
query MyQuery {
  data_marktstammdaten_einheiten_wind {
    Adresszusatz
    AnlagenbetreiberMastrNummer
    AnschlussAnHoechstOderHochSpannung
    AuflageAbschaltungLeistungsbegrenzung
    AuflagenAbschaltungEiswurf
    AuflagenAbschaltungSchallimmissionsschutzNachts
    AuflagenAbschaltungSchallimmissionsschutzTagsueber
    AuflagenAbschaltungSchattenwurf
    AuflagenAbschaltungSonstige
    AuflagenAbschaltungTierschutz
    Breitengrad
    Bruttoleistung
    Buergerenergie
    Bundesland
    ClusterNordsee
    ClusterOstsee
    DatumBeginnVoruebergehendeStilllegung
    DatumDesBetreiberwechsels
    DatumEndgueltigeStilllegung
    DatumLetzteAktualisierung
    DatumRegistrierungDesBetreiberwechsels
    DatumWiederaufnahmeBetrieb
    EegMaStRNummer
    EinheitBetriebsstatus
    EinheitMastrNummer
    EinheitSystemstatus
    Einsatzverantwortlicher
    Einspeisungsart
    Energietraeger
    FernsteuerbarkeitDv
    FernsteuerbarkeitNb
    FlurFlurstuecknummern
    Gemarkung
    Gemeinde
    Gemeindeschluessel
    GenMastrNummer
    GeplantesInbetriebnahmedatum
    Hausnummer
    HausnummerNichtGefunden
    Hausnummer_nv
    Hersteller
    Inbetriebnahmedatum
    Kraftwerksnummer
    Kraftwerksnummer_nv
    Kuestenentfernung
    Laengengrad
    Lage
    Land
    Landkreis
    LokationMaStRNummer
    Nabenhoehe
    Nachtkennzeichnung
    NameStromerzeugungseinheit
    NameWindpark
    Nettonennleistung
    NetzbetreiberpruefungDatum
    NetzbetreiberpruefungStatus
    NichtVorhandenInMigriertenEinheiten
    Ort
    Postleitzahl
    Registrierungsdatum
    Rotorblattenteisungssystem
    Rotordurchmesser
    Seelage
    Strasse
    StrasseNichtGefunden
    Technologie
    Typenbezeichnung
    Wassertiefe
    Weic
    WeicDisplayName
    Weic_nv
  }
}
```

```JSON
      {
        "Adresszusatz": null,
        "AnlagenbetreiberMastrNummer": "ABR930724592683",
        "AnschlussAnHoechstOderHochSpannung": null,
        "AuflageAbschaltungLeistungsbegrenzung": false,
        "AuflagenAbschaltungEiswurf": null,
        "AuflagenAbschaltungSchallimmissionsschutzNachts": null,
        "AuflagenAbschaltungSchallimmissionsschutzTagsueber": null,
        "AuflagenAbschaltungSchattenwurf": null,
        "AuflagenAbschaltungSonstige": null,
        "AuflagenAbschaltungTierschutz": null,
        "Breitengrad": 53.77246,
        "Bruttoleistung": 2000,
        "Buergerenergie": null,
        "Bundesland": "Niedersachsen",
        "ClusterNordsee": null,
        "ClusterOstsee": null,
        "DatumBeginnVoruebergehendeStilllegung": null,
        "DatumDesBetreiberwechsels": "2022-01-01",
        "DatumEndgueltigeStilllegung": null,
        "DatumLetzteAktualisierung": "2024-12-18T13:02:13",
        "DatumRegistrierungDesBetreiberwechsels": "2022-02-07",
        "DatumWiederaufnahmeBetrieb": null,
        "EegMaStRNummer": "EEG955202657340",
        "EinheitBetriebsstatus": "In Betrieb",
        "EinheitMastrNummer": "SEE959065500263",
        "EinheitSystemstatus": "Aktiviert",
        "Einsatzverantwortlicher": null,
        "Einspeisungsart": "Volleinspeisung",
        "Energietraeger": "Wind",
        "FernsteuerbarkeitDv": true,
        "FernsteuerbarkeitNb": true,
        "FlurFlurstuecknummern": null,
        "Gemarkung": null,
        "Gemeinde": "Bülkau",
        "Gemeindeschluessel": "03352008",
        "GenMastrNummer": null,
        "GeplantesInbetriebnahmedatum": null,
        "Hausnummer": "1",
        "HausnummerNichtGefunden": true,
        "Hausnummer_nv": false,
        "Hersteller": null,
        "Inbetriebnahmedatum": "2009-12-18",
        "Kraftwerksnummer": null,
        "Kraftwerksnummer_nv": false,
        "Kuestenentfernung": null,
        "Laengengrad": 8.96722,
        "Lage": "Windkraft an Land",
        "Land": "Deutschland",
        "Landkreis": "Cuxhaven",
        "LokationMaStRNummer": "SEL997961869244",
        "Nabenhoehe": 60,
        "Nachtkennzeichnung": false,
        "NameStromerzeugungseinheit": "Windpark Bülkau WEA01",
        "NameWindpark": "Windpark Bülkau WEA01",
        "Nettonennleistung": 2000,
        "NetzbetreiberpruefungDatum": null,
        "NetzbetreiberpruefungStatus": null,
        "NichtVorhandenInMigriertenEinheiten": false,
        "Ort": "Bülkau",
        "Postleitzahl": "21782",
        "Registrierungsdatum": "2019-07-04",
        "Rotorblattenteisungssystem": null,
        "Rotordurchmesser": 80,
        "Seelage": null,
        "Strasse": "Sprenge",
        "StrasseNichtGefunden": true,
        "Technologie": "Horizontalläufer",
        "Typenbezeichnung": null,
        "Wassertiefe": null,
        "Weic": null,
        "WeicDisplayName": null,
        "Weic_nv": false
      }
```
### data_marktstammdaten_permits_units
Diese Tabelle enthält die kompletten Daten aus der `EinheitenWind.xml` aus dem Marktstammdatenregister. Hier sind Genehmigungen für mehrere Einheiten zusammengefasst. In dieser Version entspricht jede Zeile einer Einheit.

```GraphQL
query MyQuery {
  data_marktstammdaten_einheiten_genehmigung {
    Aktenzeichen
    Art
    Behoerde
    Datum
    DatumLetzteAktualisierung
    Frist
    Frist_nv
    GenMastrNummer
    Registrierungsdatum
    VerknuepfteEinheitenMaStRNummer
    VerknuepfteEinheitenMaStRNummern
    WasserrechtAblaufdatum
    WasserrechtAblaufdatum_nv
    WasserrechtsNummer
  }
}

```


```JSON
      {
        "Aktenzeichen": "20.053.00/15/8.6.3.2V/RO",
        "Art": "nach BImSchG i.V.m 4. BImSchV",
        "Behoerde": "Landesamt für Umwelt Abt. Technischer Umweltschutz 1",
        "Datum": "2016-03-22",
        "DatumLetzteAktualisierung": "2019-04-16T08:26:21",
        "Frist": "2019-03-22",
        "Frist_nv": false,
        "GenMastrNummer": "SGE928942899189",
        "Registrierungsdatum": "2019-04-16",
        "VerknuepfteEinheitenMaStRNummer": "SEE984539762403",
        "VerknuepfteEinheitenMaStRNummern": "SEE932627216291, SEE984539762403",
        "WasserrechtAblaufdatum": null,
        "WasserrechtAblaufdatum_nv": false,
        "WasserrechtsNummer": null
      }
```

### data_marktstammdaten_tenders_bnetza
Diese Tabelle sind die Daten zu den Ausschreibungen der Bundesnetzagentur enthalten. Diese werden aus den von der Bundesnetzargentur veröffentlichten [.csv Dateien](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Ausschreibungen/Wind_Onshore/BeendeteAusschreibungen/start.html){target="_blank"} extrahiert.

```GraphQL
query MyQuery {
  ds_marktstammdaten_tenders_bnetza {
    Ausschreibungsdatum_BNetzA
    Ausschreibungsnummer_BNetzA
    MastrNummer
  }
}
```
```JSON
      {
        "Ausschreibungsdatum_BNetzA": "2023-05-01",
        "Ausschreibungsnummer_BNetzA": "WIN23-2",
        "MastrNummer": "SEE948195399038"
      },
```

## Example: R Code
```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

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
```