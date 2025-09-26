<div id="header" align="center">
  <img src="https://media.sciencemediacenter.de/static/img/logos/smc/smc-logo-typo-bw-big.png" width="300"/>

  <div id="badges" style="padding-top: 20px">
    <a href="https://www.sciencemediacenter.de">
      <img src="https://img.shields.io/badge/Website-orange?style=plastic" alt="Website Science Media Center"/>
    </a>
    <a href="https://lab.sciencemediacenter.de">
      <img src="https://img.shields.io/badge/Website (SMC Lab)-grey?style=plastic" alt="Website Science Media Center Lab"/>
    </a>
    <a href="https://twitter.com/smc_germany_lab">
      <img src="https://img.shields.io/badge/Twitter-blue?style=plastic&logo=twitter&logoColor=white" alt="Twitter SMC Lab"/>
    </a>
  </div>
</div>



<h1>
  Science Media Center - Data Collection
</h1>

## Table of Contents
- [About](#about)
- [Access](#access)
- [Current Datasets](#datasets)
- [Contact](#contact)
- [Licence](#licence)

## About <a name = "about"></a>

The Science Media Center Lab is committed to the technological advancement of science journalism in the sense of _Augmented Science Journalism_.

In this repository you will find in the future all datasets that were either collected and created by the Science Media Center itself, as well as curated datasets that were selected by the SMC Lab.

The goal is to enable further use of these data by third parties as well as to create transparency for (data) products of the Science Media Center.

The Science Media Center Lab is part of the [Science Media Center Germany](https://sciencemediacenter.de). 

## Access <a name = "access"></a>

Access to all our datasets is via a [GraphQL](https://graphql.org/) (powered by [Hasura](https://hasura.io/)) endpoint and corresponding queries.

The endpoint is located here: 

```bash
  https://data.smclab.io/v1/graphql
```

You can query this endpoint with all typical tools for GraphQL. For exploration, we initially recommend the following online or offline solutions:

- [GraphQL Playground](https://github.com/graphql/graphql-playground) (GraphQL IDE)
- [Hasura Playground](https://cloud.hasura.io/public/graphiql) (Online Hasura / GraphQL Explorer)

Or just simply search for a "graphql playground" in your favorite search engine. 

> Attention! Although Hasura provides a GraphQL endpoint, it does not support all the features that GraphQL provides out of the box. This includes the creation of fragments or aliases.
> An overview how Hasura queries work can be found [here](https://hasura.io/docs/latest/queries/postgres/simple-object-queries/)


## Current Datasets  <a name = "datasets"></a>

* [SMC Story Data](datasets/smc_story_metadata.md)
* [Aggregated Gas Storage Inventory](datasets/AGSI_gasspeicher_metadata.md)
* [BNetzA gas data](datasets/BNetzA_gas_metadata.md)
* [Energy charts data](datasets/Energy_charts_metadata.md)
* [NRW hospital planning](datasets/NRW_krankenhausreform_metadata.md)
* [Population forecasts](datasets/Bevoelkerungsprognosen_metadata.md)
* [Marktstammdaten](datasets/Marktstammdaten_metadata.md)
* [World Bank Development Indicators](datasets/world_development_indicators_metadata.md)
* [ENTSO-E Stromdaten](datasets/ENTSOE_stromdaten_metadata.md)
* [Preprint Recommender](datasets/Preprint_recommender_metadata.md)

## Contact <a name = "contact"></a>

You want to contact us ? Great! The best way to reach us is via e-mail. 

```bash
lab@sciencemediacenter.de
```

## Licence <a name = "licence"></a>

The datasets in this repository may be subject to different licenses. Please refer to the "Licence" section in the respective dataset overview page.
