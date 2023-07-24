# Dataset: Windkraft an Land


## About <a name = "about"></a>
Der Datensatz dient unter anderem als Grundlage für diesen Data Report. Er besteht zum einen Teil aus Daten des [Marktstammdatenregisters](https://www.marktstammdatenregister.de/MaStR){target="_blank"} und zum anderen Teil aus
den [Ausschreibungsergebnissen](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Ausschreibungen/Wind_Onshore/BeendeteAusschreibungen/start.html){target="_blank"} der Bundesnetzagentur. 
Das Marktstammdatenregister ist eine von der Bundesnetzagentur geführte Datenbank zur Erfassung und Verwaltung von Informationen über alle Akteure und Anlagen im deutschen Strom- und Gasmarkt. Die Einträge erfolgen dabei von den Akteuren und Anlagenbetreibern in Eigenverantwortung selbst. Der Zugriff auf die Daten des Marktstammdatenregisters erfolgt über das [open MaStR Paket](https://github.com/OpenEnergyPlatform/open-MaStR){target="_blank"} des Rainer Lemoine Instituts. Unsere Abbild wird wöchentlich aktualisiert. Die Daten zu den Ausschreibungsergebnissen werden aus den von der Bundesnetzargentur veröffentlichten [.csv Dateien](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Ausschreibungen/Wind_Onshore/BeendeteAusschreibungen/start.html){target="_blank"} extrahiert. Die Daten werden immer nach bekanntgabe der Zuschläge aktualisiert.


## Access <a name = "access"></a>
For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables
Folgende Tabellen sind relevant:
- data_marktstammdaten_wind_extended
- data_marktstammdaten_permits_units
- data_marktstammdaten_tenders_bnetza
- data_marktstammdaten_tenders_eeg

Sie können alle über die MastrNummer miteinander verknüpft werden.

### data_marktstammdaten_wind_extended
Dies ist eine Kopie der Tabelle `wind_extended` aus dem Marktstammdatenregister. Hier sind alle Grundinformationen zu den Windkraftanlagen enthalten. Die Daten werden wöchentlich aktualisiert.

```GraphQL
query MyQuery {
  data_marktstammdaten_wind_extended {
      MastrNummer,
      Nettonennleistung,
      Bundesland,
      EinheitBetriebsstatus,
      Inbetriebnahmedatum,
      Lage,
      DatumEndgueltigeStilllegung,
      DatumBeginnVoruebergehendeStilllegung
  }
}
```

```JSON
      {
        "MastrNummer": "SEE940146675093",
        "Nettonennleistung": 3000,
        "Bundesland": "Hessen",
        "EinheitBetriebsstatus": "In Betrieb",
        "Inbetriebnahmedatum": "2017-09-01",
        "Lage": "Windkraft an Land",
        "DatumEndgueltigeStilllegung": null,
        "DatumBeginnVoruebergehendeStilllegung": null
      },
```
### data_marktstammdaten_permits_units
Diese Tabelle basiert auf der Tabelle `permits_units` aus dem Marktstammdatenregister. In der Originaltabelle sind Genehmigungen für mehrere Einheiten zusammengefasst sind. In dieser Version entspricht jede Zeile einer Einheit. Die Daten werden wöchentlich aktualisiert.

```GraphQL
query MyQuery {
  data_marktstammdaten_permits_units {
    ArtGenehmigung
    DatumGenehmigung
    FristGenehmigung
    MastrNummer
  }
}
```


```JSON
      {
        "ArtGenehmigung": "nach BImSchG i.V.m 4. BImSchV",
        "DatumGenehmigung": "2016-07-06",
        "FristGenehmigung": "2019-07-06",
        "MastrNummer": "SEE940146675093"
      },
```

### data_marktstammdaten_tenders_bnetza
Diese Tabelle sind die Daten zu den Ausschreibungen der Bundesnetzagentur enthalten. Diese werden aus den von der Bundesnetzargentur veröffentlichten [.csv Dateien](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Ausschreibungen/Wind_Onshore/BeendeteAusschreibungen/start.html){target="_blank"} extrahiert. Die Daten werden immer nach bekanntgabe der Zuschläge aktualisiert.

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

### data_marktstammdaten_tenders_eeg
Diese Tabelle ist ein Abbild der Tabelle `tenders_eeg` aus dem Marktstammdatenregister. Hier sind die Ausschreibungsdaten von bereits gebauten Anlagen enthalten. Diese Daten werden wöchentlich aktualisiert.

```GraphQL
query MyQuery {
  ds_marktstammdaten_tenders_eeg {
    MastrNummer
    Ausschreibungsdatum_EEG
    Ausschreibungsnummer_EEG
  }
}
```


```JSON
      {
        "MastrNummer": "SEE989035871376",
        "Ausschreibungsdatum_EEG": "2018-08-01",
        "Ausschreibungsnummer_EEG": "WIN18-3"
      },
```


## Example: R Code
```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

wind_extended <-
  GraphQL_get_table_vec(
    variablen = c(
      "MastrNummer",
      "Nettonennleistung",
      "Bundesland",
      "EinheitBetriebsstatus",
      "Inbetriebnahmedatum",
      "Lage",
      "DatumEndgueltigeStilllegung",
      "DatumBeginnVoruebergehendeStilllegung"
    ),
    tabellenname = "data_marktstammdaten_wind_extended",
    datenserver = "https://data.smclab.io/v1/graphql"
  ) |>
  left_join(
    GraphQL_get_table_vec(
      # permits_units
      tabellenname = "data_marktstammdaten_permits_units",
      variablen = c(
        "MastrNummer",
        "FristGenehmigung",
        "DatumGenehmigung",
        "ArtGenehmigung"
      ),
      datenserver = "https://data.smclab.io/v1/graphql"
    ),
    by = "MastrNummer"
  ) |>
  left_join(
    GraphQL_get_table_vec(
      # Ausschreibungen BNetzA
      tabellenname = "data_marktstammdaten_tenders_bnetza",
      variablen = c(
        "Ausschreibungsdatum_BNetzA",
        "Ausschreibungsnummer_BNetzA",
        "MastrNummer"
      )#,
      datenserver = "https://data.smclab.io/v1/graphql"
    ),
    by = "MastrNummer"
  ) |>
  left_join(
    GraphQL_get_table_vec(
      # Meldedaten eeg
      variablen = c(
        "MastrNummer",
        "Ausschreibungsdatum_EEG",
        "Ausschreibungsnummer_EEG"
      ),
      tabellenname = "data_marktstammdaten_tenders_eeg",
      datenserver = "https://data.smclab.io/v1/graphql"
    ),
    by = "MastrNummer"
  )
```