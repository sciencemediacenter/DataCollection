# Dataset: World Bank World Development Indicators

## About <a name = "about"></a>

This dataset contains four World Bank World Development Indicators (WDI): [CO₂ emissions](https://data.worldbank.org/indicator/EN.ATM.CO2E.KT?view=chart), [GDP per capita](https://data.worldbank.org/indicator/NY.GDP.PCAP.PP.KD?view=chart), [energy intensity level of primary energy](https://data.worldbank.org/indicator/EG.EGY.PRIM.PP.KD?view=chart), and [total population](https://data.worldbank.org/indicator/SP.POP.TOTL?view=chart). Variable units were transformed and another indicator was calculated from the data: CO₂ intensity of energy.

Variables:

- `co2_emissions_kg`: CO₂ emissions in kg
- `co2_intensity_of_energy_kg_kwh`: CO₂ intensity of primary energy in kg/kWh
- `gdp_per_capita_ppp_2017`: GDP per capita in constant 2017 international dollars at purchasing power parity (PPP)
- `energy_intensity_kwh_gdp_ppp_2017`: energy intensity level of primary energy in kWh/GDP (PPP, 2017)
- `population`: total population
- `country_de` and `country_en`: country names in German and English
- `year`: year, ranges between 1960 and 2022 but data are not available for all years, countries and indicators

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** world_development_indicators

```JSON
      {
        "co2_emissions_kg": 8709470000,
        "co2_intensity_of_energy_kg_kwh": 0.15903969,
        "country_de": "Afghanistan",
        "country_en": "Afghanistan",
        "energy_intensity_kwh_gdp_ppp_2017": 0.7138889,
        "gdp_per_capita_ppp_2017": 1968.341,
        "population": 38972232,
        "year": 2020
      }
```

## Example Query

```GraphQL
query MyQuery {
  data_worldbank_world_development_indicators(where: {year: {_gte: 2020}, country_en: {_eq: "Germany"}}) {
    co2_emissions_kg
    co2_intensity_of_energy_kg_kwh
    energy_intensity_kwh_gdp_ppp_2017
    gdp_per_capita_ppp_2017
    population
    year
  }
}
```

```GraphQL
query MyQuery {
  data_worldbank_world_development_indicators(where: {country_en: {_eq: "Germany"}}, order_by: {year: desc}) {
    population
    year
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

wdi <-
  GraphQL_get_table_vec(
    tabellenname = "data_worldbank_world_development_indicators",
    variablen = c("population", "country_en", "year"),
    datenserver = "https://data.smclab.io/v1/graphql"
    )

```

## Licence

It is [mandatory](https://creativecommons.org/licenses/by-nc/4.0/) to credit the Worldbank as data source when using or repackaging this data.
