# Dataset: Population forecasts


## About <a name = "about"></a>

The data set contain selected data from the population scenarios of the [Population Division of the UN](https://population.un.org/wpp/) (all scenarios with the prefix 'UN') and the [Wittgenstein Centre for Demography and Global Human Capital](https://dataexplorer.wittgensteincentre.org) (all scenarios with the prefix 'WCDE'), the scenarios of the Wittgenstein data refer directly to the Shared Socioeconomic Pathways (SSP).

The data set contains two tables. `data_bevoelkerung_bevoelkerungsprognosen` summarizes the population forecasts of the UN and the WCDE for countries and regions. It also contains old forecasts. The variable Revision indicates the version of the respective date. Other key variables are the fertility rate (TFR), net migration (NetMigration) and life expectancy (LEx). The table data_population_age_distribution contains the age distribution of different countries and regions for different scenarios of the UN data. A documentation of all data and further variables can be found on the pages of the data providers.

In the Wittgenstein data, absolute figures such as net migration are sometimes given as a total over five years. This must be taken into account when comparing the figures.

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** data_bevoelkerung_bevoelkerungsprognosen

```JSON
      {
        "Variant": "Low",
        "TimePeriod_TFR": null,
        "Time": 2071,
        "TPopulation1July": 367492.1,
        "TFR": null,
        "Szenario": "UN Low",
        "Revision": "2019",
        "Organisation": "UN World Population Prospects",
        "NetMigrations": null,
        "Location": "Northern Africa",
        "LocID": 912,
        "Land": "Nordafrika",
        "LEx": null,
        "ISO3_code": null,
        "ISO2_code": null
      }
```

**Field ID:** data_bevoelkerung_altersverteilung
```JSON
      {
        "AgeGrp": "0-4",
        "AgeGrpSpan": 5,
        "AgeGrpStart": 0,
        "ISO2_code": null,
        "ISO3_code": null,
        "Land": "Welt",
        "LocID": 900,
        "LocTypeID": 1,
        "LocTypeName": "World",
        "Location": "World",
        "MidPeriod": 1950,
        "Notes": null,
        "ParentID": 0,
        "PopFemale": 6.691,
        "PopMale": 6.988,
        "PopTotal": 13.679,
        "SDMX_code": 1,
        "SortOrder": 1,
        "Szenario": "UN Medium",
        "Time": 1950,
        "VarID": 2,
        "Variant": "Medium"
      }
```

## Example Query

```GraphQL
query MyQuery {
  data_bevoelkerung_bevoelkerungsprognosen {
    Variant
    TimePeriod_TFR
    Time
    TPopulation1July
    TFR
    Szenario
    Revision
    Organisation
    NetMigrations
    Location
    LocID
    Land
    LEx
    ISO3_code
    ISO2_code
  }
}
```

```GraphQL
query MyQuery {
  data_bevoelkerung_altersverteilung {
    AgeGrp
    AgeGrpSpan
    AgeGrpStart
    ISO2_code
    ISO3_code
    Land
    LocID
    LocTypeID
    LocTypeName
    Location
    MidPeriod
    Notes
    ParentID
    PopFemale
    PopMale
    PopTotal
    SDMX_code
    SortOrder
    Szenario
    Time
    VarID
    Variant
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

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

```

## Licence

Wittgenstein Centre for Demography and Global Human Capital, (2018). Wittgenstein Centre Data Explorer 
United Nations, made available under a Creative Commons license [CC BY 3.0 IGO](http://creativecommons.org/licenses/by/3.0/igo/)

