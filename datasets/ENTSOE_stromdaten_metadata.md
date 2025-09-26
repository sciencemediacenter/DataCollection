# Dataset: ENTSO-E Transpacancy Platform

## About <a name = "about"></a>

The dataset contains two derived tables from the [ENTSO-E Transparency Platform](https://transparency.entsoe.eu/) for generation and load data in Germany. In `generation` the generation and the consumption of all different generation types are recorded for every quarter hour since 2015-01-01. The table `load` contains the load values for the German power grid for every quarter hour since 2015-01-01. Note that the timestamps are UTC timestamps in both tables. These records are updated daily, but only data from the last 14 days are updated. Changes made further back in time are not applied by default and are only updated sporadically. 

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** load

```JSON
      {
        "load": 62086,
        "timestamp": "2015-12-17T20:15:00"
      }
```

**Field ID:** generation

```JSON
      {
        "consumption": 0,
        "generation": 15859,
        "generation_type": "Fossil Brown coal/Lignite",
        "timestamp": "2014-12-31T23:00:00"
      }
```



## Example Query

```GraphQL
query MyQuery {
  data_entsoe_stromdaten_load(limit: 10, order_by: {timestamp: desc}) {
    load
    timestamp
  }
}
```

```GraphQL
query MyQuery {
  data_entsoe_stromdaten_generation {
    consumption
    generation
    generation_type
    timestamp
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

load_data <-
  GraphQL_get_table_vec(
    tabellenname = "data_entsoe_stromdaten_load",
    variablen = c("timestamps", "load"),
    datenserver = "https://data.smclab.io/v1/graphql"
    )

generation_data <-
    GraphQL_get_table_vec(
    tabellenname = "data_entsoe_stromdaten_generation",
    variablen = c("timestamps", "generation_type", "generation", "consumption"),
    datenserver = "https://data.smclab.io/v1/graphql"
    )

```

## Licence

It is not mandatory but best practice to credit or mention to ENTSO-E (European Network of Transmission System Operators for Electricity) as data source when using or repackaging this data.
