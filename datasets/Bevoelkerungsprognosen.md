# Dataset: Population forecasts

## About <a name = "about"></a>

The data set contain selected data from the population scenarios of the [Population Division of the UN](https://population.un.org/wpp/) (all scenarios with the prefix 'UN') and the [Wittgenstein Centre for Demography and Global Human Capital](https://dataexplorer.wittgensteincentre.org) (all scenarios with the prefix 'WCDE'), the scenarios of the Wittgenstein data refer directly to the Shared Socioeconomic Pathways (SSP).

The data set contains two tables. `data_bevoelkerung_bevoelkerungsprognosen` summarizes the population forecasts of the UN and the WCDE for countries and regions. It also contains old forecasts. The variable Revision indicates the version of the respective date. Other key variables are the fertility rate (TFR), net migration (NetMigration) and life expectancy (LEx). The table `data_bevoelkerung_altersverteilung` contains the age distribution of different countries and regions for different scenarios of the UN data. A documentation of all data and further variables can be found on the pages of the data providers.

In the Wittgenstein data, absolute figures such as net migration are sometimes given as a total over five years. This must be taken into account when comparing the figures.

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** data_bevoelkerung_bevoelkerungsprognosen

```JSON
      {
        "ISO2_code": null,
        "ISO3_code": null,
        "Kontinent": "Ozeanien",
        "LEx": null,
        "Land": "Australien",
        "LocID": 36,
        "Location": "Australia",
        "Location_Type": "Country/Area",
        "NetMigrations": null,
        "Organisation": "UN World Population Prospects",
        "Revision": "2019",
        "SDG_Region": "Australien/Neuseeland",
        "Subregion": "Australien/Neuseeland",
        "Szenario": "UN No change",
        "TFR": null,
        "TPopulation1July": 37848.1,
        "Time": 2079,
        "TimePeriod_TFR": null,
        "Variant": "No change"
      }
```

**Field ID:** data_bevoelkerung_altersverteilung

```JSON
      {
        "AgeGrp": "30-34",
        "AgeGrpSpan": null,
        "AgeGrpStart": null,
        "ISO2_code": "DE",
        "ISO3_code": "DEU",
        "Kontinent": "Europa",
        "Land": "Deutschland",
        "LocID": 276,
        "LocTypeID": 4,
        "LocTypeName": "Country/Area",
        "Location": "Germany",
        "MidPeriod": 1951,
        "Notes": null,
        "ParentID": 926,
        "PopFemale": 2252.444,
        "PopMale": 1522.8435,
        "PopTotal": 3775.2876,
        "SDG_Region": "Europa und Nordamerika",
        "SDMX_code": 276,
        "SortOrder": null,
        "Subregion": "Westeuropa",
        "Szenario": "UN Medium",
        "Time": 1951,
        "VarID": 2,
        "Variant": "Medium"
      }
```

## Example Query

```GraphQL
query MyQuery {
  data_bevoelkerung_bevoelkerungsprognosen {
    ISO2_code
    ISO3_code
    Kontinent
    LEx
    Land
    LocID
    Location
    Location_Type
    NetMigrations
    Organisation
    Revision
    SDG_Region
    Subregion
    Szenario
    TFR
    TPopulation1July
    Time
    TimePeriod_TFR
    Variant
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
    Kontinent
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
    SDG_Region
    SDMX_code
    SortOrder
    Subregion
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

- [Wittgenstein Centre Human Capital Data Explorer](https://dataexplorer.wittgensteincentre.org/wcde-v3/), made available under a Creative Commons license [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/#_blank)
- United Nations, made available under a Creative Commons license [CC BY 3.0 IGO](http://creativecommons.org/licenses/by/3.0/igo/)

