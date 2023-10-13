# Dataset: Preprint Recommender bioRxiv and medRxiv


## About <a name = "about"></a>

This data offering is intended to make it easier to find potentially relevant publications among the preprints published daily on [bioRxiv](https://www.biorxiv.org/) and [medRxiv](https://www.medrxiv.org/). To this end, the SMC monitors usage statistics published by the preprint servers for each preprint published on the two servers for the first seven days after initial publication. In addition, bi-monthly thresholds are calculated for all usage statistics and all days in the first week so that only 1% of published preprints per measure exceed these thresholds.

The dataset contains three tables. 

* **biomedrxiv_versions** contains the metadata of the preprints. After the observation period, this data is not updated and multiple versions of a preprint are not captured. For complete lists, it is recommended to use the API of bioRxiv and medRxiv.
* **biomedrxiv_earlyuserstats** contains usage statistics for the first seven days after the release of the first version. As a rule, many measurement figures are still missing on the preprint server page on the first two days after publication. Problems in retrieving the data may cause it to change the time of retrieval. Other missing data are not uncommon.
* **biomedrxiv_thresholds** contains the thresholds recalculated every two months for all retrieval statistics and the first seven days after initial publication. To identify noticeable preprints in the usage statistics, these thresholds can be compared with the values in biomedrxiv_earlyuserstats. The threshold calculation will be further optimized so that these values can also change subsequently.

The records are updated twice a day.

**High values in the usage statistics do not necessarily mean high quality. The quality of the preprints must be evaluated elsewhere.**



## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** data_preprint_recommender_biomedrxiv_earlyuserstats

```JSON
      {
        "abstract": 3300,
        "altmetric": 3,
        "date": "2019-10-01",
        "doi": "10.1101/006353",
        "fulltext_html": 64,
        "pdf": 1817
      },
```


**Field ID:** data_preprint_recommender_biomedrxiv_thresholds

```JSON
      {
        "_id": 901,
        "alpha": 0.01,
        "archiv": "biorxiv",
        "date": "2023-01-01",
        "day": 2,
        "metric": "pdf",
        "threshold": 275
      },
```

**Field ID:** data_preprint_recommender_biomedrxiv_versions

```JSON
      {
        "author_corresponding": "Leila Wehbe",
        "author_corresponding_institution": "Carnegie Mellon University",
        "authors": "Wu, S.; Ramdas, A.; Wehbe, L.",
        "category": "neuroscience",
        "date": "2021-03-07",
        "doi": "10.1101/2020.06.18.159913",
        "license": "cc_no",
        "server": "biorxiv",
        "title": "Brainprints: identifying individuals from magnetoencephalograms",
        "type": "new results",
        "version": 2
      },
```

## Example Query

```GraphQL
query MyQuery {
  data_preprint_recommender_biomedrxiv_earlyuserstats {
    abstract
    altmetric
    date
    doi
    fulltext_html
    pdf
  }
}
```

```GraphQL
query MyQuery {
  data_preprint_recommender_biomedrxiv_thresholds {
    _id
    alpha
    archiv
    date
    day
    metric
    threshold
  }
}
```

```GraphQL
query MyQuery {
  data_preprint_recommender_biomedrxiv_versions {
    author_corresponding
    author_corresponding_institution
    authors
    category
    date
    doi
    license
    server
    title
    type
    version
  }
}
```

```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

biomedrxiv_earlyuserstats <-
  GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_earlyuserstats",
    variablen = c("abstract", "altmetric", "date", "doi", "fulltext_html", "pdf"), 
    datenserver = "https://data.smclab.io/v1/graphql"
    )

biomedrxiv_thresholds <-
    GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_thresholds",
    variablen = c("_id", "alpha", "archiv", "date", "day", "metric", "threshold"), 
    datenserver = "https://data.smclab.io/v1/graphql"
    )

biomedrxiv_versions <-
    GraphQL_get_table_vec(
    tabellenname = "data_preprint_recommender_biomedrxiv_versions", 
    variablen = c("author_corresponding", "author_corresponding_institution", "authors", 
                  "category", "date", "doi", "license", "server", "title", "type", "version"), 
    datenserver = "https://data.smclab.io/v1/graphql"
    )

```

## Licence


biomedrxiv_thresholds and biomedrxiv_earlyuserstats are subject to GPL-3, biomedrxiv_versions contains a variable licence with license information

