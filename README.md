# LECTAUREP - Page2tei 

This repository stores an XSLT for transforming a PAGE XML file into XML-TEI, created for the LECTAUREP (INRIA - Archives nationales), and xml files resulting from the transformation. The XSLT was modified from a [first version](https://github.com/inoblivionem/xslt-playground/blob/main/xmlpage_to_tei/xmlpage_to_tei.xsl), created by Manon Ovide ([inoblivionem](https://github.com/inoblivionem/xslt-playground)).

For each annotation region, `<TextRegion>` in a PAGE XML file, a `<surface>` element is created in the TEI file.

## Repository tree

```
├── pagexml
├── tei
└── xmlpage_to_tei.xsl
```

* The XSLT 
* A directory named `pagexml`, in which are stored PAGE XML files.
* The directory named `tei` stores the TEI files resulting from the transformed PAGE XML.

## Cite this repository

`Chagué, A., & Scheithauer, H., Page2tei - Lectaurep, 2021, https://github.com/lectaurep/page2tei.
