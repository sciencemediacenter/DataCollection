# Dataset: BNetzA gas data

## About <a name = "about"></a>

The data set contains one table that contains the installed power according to [Energy Charts](https://energy-charts.info/charts/installed_power/chart.htm?l=en&c=DE). `charts_installierte_leistung` contains monthly figures of installed capacity for different energy sources in Germany.

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** installierte_leistung

```JSON
{
    "data_energy_charts_installierte_leistung": []
  }
```

## Example Query

```GraphQL
query MyQuery {
  data_energy_charts_installierte_leistung{
    source
    date
    capacity
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

energy_charts_installierte_leistung <-
  GraphQL_get_table_vec(
    tabellenname = "data_energy_charts_installierte_leistung",
    variablen = c(
      "source",
      "date",
      "capacity"
    )
  )

```

## Licence

The data obtained via [Energy-Charts API](https://api.energy-charts.info/) are licensed under Creative Commons license [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).