# LECTAUREP - Page2tei 

Ce repository héberge une feuille de transformation XSL pour passer d'un fichier PAGE XML à un fichier XML-TEI, et des exemples de transformations. La feuille XSL a été modifiée et adaptée d'après une [première version](https://github.com/inoblivionem/xslt-playground/blob/main/xmlpage_to_tei/xmlpage_to_tei.xsl) créée par Manon Ovide ([inoblivionem](https://github.com/inoblivionem/xslt-playground)).

Elle est fondée sur la création dans le TEI d'autant de `<surfaceGrp>` qu'il y a de régions d'annotation, `<TextRegion>` dans le PAGE XML.

## Organisation du repository

```
├── pagexml
├── tei
└── xmlpage_to_tei.xsl
```

* la feuille XSL
* Le dossier `pagexml` contient l'export de la transcription automatique d'une page d'un répertoire de notaire, exploitée par le projet LECTAUREP, ainsi que sa numérisation.
* Le dossier `tei` contient deux versions de la transformation.
    * La première version est le résultat brut de la feuille XSL
    * La seconde version est le résultat obtenu après exploitation du `<sourceDoc>` et reconstitution de la structure logique de la page d'après celui-ci, grâce à la chaîne de traitement [LEPIDEMO](https://github.com/lectaurep/lepidemo).


