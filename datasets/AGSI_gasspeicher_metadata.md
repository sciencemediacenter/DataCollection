# Dataset: Aggregated Gas Storage Inventory


## About <a name = "about"></a>

The dataset contains two derived tables from the [Aggregated Gas Storage Inventory (AGSI)](https://agsi.gie.eu/). In `gas_storage_by_country` the storage data is recorded by country, in `gas_storage_by_facility` by individual storage facility. Details can be found on the [GIE](https://agsi.gie.eu/) page. These records are updated daily, but only data from the last 14 days are updated. Changes made further back in time are not applied by default and are only updated sporadically.

## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** gas_storage_by_country

```JSON
      {
        "_id": "c03c919e26ac8d0ab46ddd2ec43aa7077acf54d29ffba73374a108df6ea2a6ad",
        "country": "Austria",
        "date": "2011-01-01",
        "gas_in_storage": 22.6524,
        "country_code": "AT",
        "injection": 5.27,
        "injection_capacity": 397.47,
        "status": "C",
        "withdrawal": 110.3,
        "withdrawal_capacity": 494.15,
        "working_gas_volume": 40.5749
      },
```

**Field ID:** gas_storage_by_facility

```JSON
      {
        "_id": "c35d7043992da3abe9400e9d2ba50cf067d532db2e06ce896dd6b00cb14c3f56",
        "date": "2011-05-06",
        "facility_name": "VGS Ukraine (all storage facilities)",
        "gas_in_storage": null,
        "company_eic": "21X0000000013279",
        "company_name": "Ukrtransgaz",
        "country_code": "UA",
        "facility_eic": "VGS--UGS-UKRAINE",
        "injection": null,
        "injection_capacity": null,
        "status": "N",
        "withdrawal": null,
        "withdrawal_capacity": null,
        "working_gas_volume": null
      },
```

## Example Query

```GraphQL
query MyQuery {
  ds_gasspeicher_agsi_gas_storage_by_country {
    working_gas_volume
    withdrawal_capacity
    withdrawal
    status
    injection_capacity
    injection
    gas_in_storage
    date
    country_code
    country
    _id
  }
}
```

```GraphQL
query MyQuery {
  data_agsi_gasspeicher_gas_storage_by_facility {
    _id
    company_eic
    company_name
    country_code
    date
    facility_eic
    facility_name
    gas_in_storage
    injection
    injection_capacity
    status
    withdrawal
    withdrawal_capacity
    working_gas_volume
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

daily_country_data <-
  GraphQL_get_table_vec(
    tabellenname = "data_agsi_gasspeicher_gas_storage_by_country",
    variablen = c("_id", "country", "country_code", "date", "gas_in_storage", 
                  "injection", "status", "withdrawal", "working_gas_volume", 
                  "withdrawal_capacity", "injection_capacity", "status"),
    datenserver = "https://data.smclab.io/v1/graphql"
    )

daily_facility_data <-
    GraphQL_get_table_vec(
    tabellenname = "data_agsi_gasspeicher_gas_storage_by_facility",
    variablen = c("_id", "company_eic", "company_name", "country_code", "date", 
                  "facility_eic", "facility_name", "gas_in_storage", "injection", 
                  "status", "withdrawal", "working_gas_volume", 
                  "withdrawal_capacity", "injection_capacity", "status"),
    datenserver = "https://data.smclab.io/v1/graphql"
    )

```

## Licence

It is mandatory to credit or mention to GIE (Gas Infrastructure Europe) and AGSI as data source when using or repackaging this data. 
