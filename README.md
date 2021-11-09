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
* A directory named `pagexml`, in which there is a PAGE XML resulting from the automatic transcription of a 'répertoire de notaire,' and its image.
* The directory named `tei` stores a TEI file resulting from the transformation.

## Cite this repository

`Chagué, A., & Scheithauer, H. page2tei - LECTAUREP [Computer software]`
