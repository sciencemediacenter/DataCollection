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
  Dataset: SMC Story Data
</h1>

## About <a name = "about"></a>

This dataset contains the basic metadata and content for all stories of the Science Media Center.

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

The ressorts are: 

- Medicine and Life Sciences (Medizin und Lebenswissenschaften)
- Climate and environment (Klima und Umwelt)
- Energy and mobility (Energie und Mobilität)
- Digital and technology (Digitales und Technologie)

To use the ressorts within a query you need to use the german terms. 


Information on type (in german)

### Data & Facts

* **Data Report**
  Sind datenbasierte Hintergrundinformationen zu aktuellen Themen. Beispielsweise haben wir während der Corona-Pandemie regelmäßig einen Corona-Report veröffentlicht, in dem wir das aktuelle Corona-Geschehen anhand relevanter Kennzahlen zusammengefasst haben.

  
* **Fact Sheet**
  Hier versorgen wir Journalist:innen mit Hintergrundinformationen, Faktensammlungen und Spickzetteln: wertvolle Expertise bei unübersichtlichen oder komplexen Themen. Zu Themen, die in den Medien noch wenig beachtet werden oder plötzlich in die Schlagzeilen geraten, gibt es außerdem prägnante Übersichten, Zusammenfassungen und Link-Listen. Informationen in den Fact Sheets gehen bei Großlage-Themen in die Tiefe und geben bei übergreifenden Themen wie Klimaschutz oder Grüne Gentechnik relevantes Überblickswissen.

  
* **Living Fact Sheet**
  Diese Fact Sheets werden regelmäßig von unserer Redaktion kuratiert und aktualisiert. 

  Ein Living Fact Sheet zum Thema Plastik kannst du [hier](https://livingfactsheets.smc.page/problemfelder-plastik) aufrufen.

Fact Sheets und Data Reports findest du [hier auf unserer Website](https://www.sciencemediacenter.de/angebote?story_type=Data+%26+Facts).

### **Press Briefings**

Zu ausgesuchten Themen veranstaltet das SMC Press Briefings, die den Journalist:innen direkten Zugang zu Wissenschaftlern verschaffen. Seit der Pandemie finden unsere Press Briefings ausschließlich online statt, in einer 50-minütigen Konferenz können die Journalist:innen ihre Fragen an Forschende stellen.

Unsere Press Briefings findest du [hier auf unserer Website](https://www.sciencemediacenter.de/angebote?story_type=Press+Briefing).

### Statements

* **Rapid Reaction**

  Wenn Wissenschaft Schlagzeilen verspricht, müssen Journalist:innen in kürzester Zeit reagieren. Unsere Redaktion organisiert zeitnah Einschätzungen und Zitate ausgewiesener Experten und stellt dieses Wissen als journalistischen Rohstoff zur Verfügung. Die Rapid Reaction vermittelt Fakten und Argumente aus unterschiedlichen Blickwinkeln, ist Quelle verlässlicher Zitate und bildet die Basis weitergehender eigener Recherchen.

  
* **Research in Context**

  Wissenschaftliche Forschungsergebnisse stehen Wissenschaftsjournalist:innen gewöhnlich bereits vor der Veröffentlichung der Fachpublikation zur Verfügung – allerdings unter Sperrfrist. Diese Zeit nutzt auch das SMC, um von Expert:innen Einschätzungen darüber einzuholen, wie eine Studie fachlich und methodisch einzuordnen ist. Bei dieser Art von „Pre Publication Peer Review“ liefern die beteiligten Expert:innen noch vor Ablauf der Sperrfrist Kurzkommentare und Einschätzungen, die das SMC akkreditierten Journalist:innen wiederum in Form des Produkts „Research in Context“ liefert. Und zwar genau dann, wenn Redaktionen ihre Medienberichte anfertigen.
* **Science Reponse**

  Wissenschaft antwortet dem SMC auf proaktive Fragen zu Themen, die in der Luft liegen, aber noch keine Schlagzeilen machen: Expertise, die den Blick auf öffentliche Angelegenheiten weitet. Im Gegensatz zu unseren anderen Statement-Produkten (Rapid Reaction und Research in Context) werden Science Response-Aussendungen unsere Fragen an die Expert:innen mitausgespielt. 

  Ein Beispiel für eine Science Response kannst du [hier auf hier auf unserer Website](https://www.sciencemediacenter.de/angebote/diskurs-meta-analysen-zu-absetzsymptomen-von-antidepressiva-25131) nachlesen.

**Field ID:** smc_story_expert_statements

```JSON
      {
        "story_no": 22053
        "contact_id": "",
        "expert_name": "",
        "expert_affiliation": "",
        "question": "",
        "statement": "",
      },
```

| Field | Description |
| --- | --- |
| story_no | 5-digit unique story number; first 2 digits contain the year: 2023 -> 23xxx |
| contact_id | Unique Hash for every expert |
| expert_name | Full name with formal titles of an expert |
| expert_affliliation | Experts affiliation at the time of the story |
| question | Question to which the statement was refering to. This is mostly the case for Science Response and Press Briefing story types. If there is no question, this field is null. |
| statement | Actual statement of the expert  |

The allocation of statements to questions can be buggy in some cases, mostly for Press Briefings. If you are in need of the full context of a statement, please look for the story at the Science Media Center Webpage.

**Field ID:** smc_story_smc_content

```JSON
      {
        "story_no": 22053
        "teaser": ""
      },
```

| Field | Description |
| --- | --- |
| story_no | 5-digit unique story number; first 2 digits contain the year: 2023 -> 23xxx |
| teaser | Teaser for the story |

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

*Get all data for story 23002*

```GraphQL
query SearchQuery {
  smc_story_meta(where: {story_no: {_eq: 23002}}) {
    type
    title
    story_no
    expert_statements {
      statement
      question
      expert_name
      contact_id
      story_no
      expert_affiliation
    }
    smc_content {
      teaser
    }
  }
}
```


```R
devtools::install_github("sciencemediacenter/SMChelpR", ref = "master")
library(SMChelpR)

smc_story_meta <-
  GraphQL_get_table_vec(
    tabellenname = "smc_story_meta",
    variablen = c(
      "story_no",
      "title",
      "type",
      "url",
      "ressort",
      "publication_date"
    ),
    datenserver = "https://data.smclab.io/v1/graphql"
  )
```

## Licence

This dataset is licensed under GPL-3 and a copy of this license is included in the repository. 
