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

* [SMC Story Metadata](datasets/smc_story_metadata.md)

## Contact <a name = "contact"></a>

You want to contact us ? Great! The best way to reach us is via e-mail. 

```bash
lab@sciencemediacenter.de
```

You can also follow us on [Twitter](https://twitter.com/smc_germany_lab?lang=de). There you will also get all updates and information about other projects of the SMC Lab.

## Licence <a name = "licence"></a>

The datasets in this repository may be subject to different licenses. Please refer to the "License" section in the respective dataset overview page.