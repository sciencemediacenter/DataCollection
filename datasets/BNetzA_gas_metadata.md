# Dataset: BNetzA gas data

## About <a name = "about"></a>

The data set contains two tables that summarize selected data from the [Bundesnetzagentur daily situation reports](https://www.bundesnetzagentur.de/DE/Fachthemen/ElektrizitaetundGas/Versorgungssicherheit/aktuelle_gasversorgung/start.html). `gas_import_export` contains daily figures on import and export volumes as well as domestic gas production. `gas_verbrauch` contains weekly consumption data broken down into small and large consumers. Average values for the period 2018-2021 are also provided.

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** gas_import_export

```JSON
      {
        "Datum": "2022-01-01",
        "Deutschland_Export": 1750,
        "Deutschland_Import": 4647,
        "Deutschland_Produktion": 118
      },
```

**Field ID:** gas_verbrauch

```JSON
      {
        "Datum": "2021-01-04",
        "Durchschnitt_2018_2021": 2056,
        "Gasverbrauch": 2330,
        "Jahr": 2021,
        "Kalenderwoche": 1,
        "Verbraucher": "Haushalt und Gewerbe"
      },
```

## Example Query

```GraphQL
query MyQuery {
  data_bnetza_gas_import_export {
    Datum
    Deutschland_Export
    Deutschland_Import
    Deutschland_Produktion
  }
}
```

```GraphQL
query MyQuery {
  data_bnetza_gas_verbrauch {
    Datum
    Durchschnitt_2018_2021
    Gasverbrauch
    Jahr
    Kalenderwoche
    Verbraucher
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

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

```

## Licence

The Bundesnetzagentur has published the data under [CC BY-ND 4.0 Deed](https://creativecommons.org/licenses/by-nd/4.0/deed.de).
