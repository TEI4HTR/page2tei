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

## Cite this work

```
Chagué, A., & Scheithauer, H. (2021). page2tei, an XSL Transformation to transform PAGE XML into TEI XML (Version 1.0.0) [Computer software]
```