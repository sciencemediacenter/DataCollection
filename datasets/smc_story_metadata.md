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
  Dataset: SMC Story Metadata
</h1>

## About <a name = "about"></a>

This dataset contains the basic metadata for all stories of the Science Media Center.
## Access <a name = "access"></a>

For a general overview of how to query the data, you can find help [here](../README.md)

## Field and variables

**Field ID:** smc_story_meta

```JSON
      {
        "story_no": 23000,
        "title": "",
        "type": "",
        "publication_date": "2020-01-01", 
        "ressort": "",
        "url": "",
      },
```

| Field | Description |
| --- | --- |
| story_no | 5-digit unique story number; first 2 digits contain the year: 2023 -> 23xxx |
| title | Story title |
| type | Story type, e.g "Research In Context" |
| publication_date | Publication date in format YYYY-MM-DD |
| ressort | Ressort in which the story was listed |
| url | URL to the story on sciencemediacenter.de |

## Example Query

*Get all Storys for the Year 2023 in descending order*

```GraphQL
query SearchQuery {
  smc_story_meta(where: {story_no: {_gt: 23000}}, order_by: {story_no: desc}) {
    publication_date
    ressort
    story_no
    title
    type
    url
  }
}
```

## Licence

This dataset is licensed under GPL-3 and a copy of this license is included in the repository. 