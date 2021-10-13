# LECTAUREP - Page2tei 

This repository stores an XSLT for transforming a PAGE XML file into XML-TEI, created for the LECTAUREP (INRIA - Archives nationales), and xml files resulting from the transformation. The XSLT was modified from a [first version](https://github.com/inoblivionem/xslt-playground/blob/main/xmlpage_to_tei/xmlpage_to_tei.xsl), created by Manon Ovide ([inoblivionem](https://github.com/inoblivionem/xslt-playground)).

For each annotation region, `<TextRegion>` in a PAGE XML file, a node `<surfaceGrp>` is created in the TEI file.

## Repository tree

```
├── pagexml
├── tei
└── xmlpage_to_tei.xsl
```

* The XSLT 
* A directory named `pagexml`, in which there is a PAGE XML resulting from the automatic transcription of a 'répertoire de notaire,' and its image.
* The directory named `tei` stores two version of the transformation obtained with the XSLT.
    * The first version is the raw transformation, without any modification to the `<body>` element.
    * The second version was obtained with the pipeline [LEPIDEMO](https://github.com/lectaurep/lepidemo) that uses the XSLT shown here, and in which the logical structure of the original document is reconstructed in the `<body>` element.

## Cite this repository

`Chagué, A., & Scheithauer, H., Page2tei - Lectaurep, 2021, https://github.com/lectaurep/page2tei.`
