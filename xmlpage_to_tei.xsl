<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<?xml-stylesheet type="text/xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xi xsi pc"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15 http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15/pagecontent.xsd"
    xmlns:pc="http://schema.primaresearch.org/PAGE/gts/pagecontent/2019-07-15">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">

        <!-- Creation of a variable for storing file's name -->
        <xsl:variable name="file_name">
            <xsl:value-of select="replace(/pc:PcGts/pc:Page/@imageFilename, '.jpg', '')"/>
        </xsl:variable>

        <!-- Creation of a variable for storing output file name -->
        <xsl:variable name="output_name">
            <xsl:value-of select="concat($file_name, '-tei.xml')"/>
        </xsl:variable>

        <xsl:result-document href="{$output_name}" exclude-result-prefixes="xi xsi pc">
            <!-- teiHeader elements -->
            <TEI>
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>
                                <xsl:value-of
                                    select="substring-before(substring-after(document-uri(), 'xmlpage_to_tei/'), '.xml')"
                                />
                            </title>
                            <respStmt>
                                <resp>Transcribed with</resp>
                                <name>
                                    <xsl:value-of select="pc:PcGts/pc:Metadata/pc:Creator"/>
                                </name>
                            </respStmt>
                        </titleStmt>
                        <publicationStmt>
                            <p/>
                        </publicationStmt>
                        <sourceDesc>
                            <p/>
                        </sourceDesc>
                    </fileDesc>
                    <revisionDesc>
                        <xsl:element name="change"><xsl:attribute name="when"><xsl:value-of
                                    select="pc:PcGts/pc:Metadata/pc:Created"
                            /></xsl:attribute>Creation</xsl:element>
                        <xsl:element name="change"><xsl:attribute name="when"><xsl:value-of
                                    select="pc:PcGts/pc:Metadata/pc:LastChange"
                            /></xsl:attribute>Last change</xsl:element>
                    </revisionDesc>
                </teiHeader>
                <sourceDoc>
                    <!-- A <graphic> TEI element is used for tagging attributes of the <Page> node in the PAGE XML -->
                    <graphic>
                        <xsl:attribute name="url">
                            <xsl:value-of select="$file_name"/>
                        </xsl:attribute>
                        <xsl:attribute name="width">
                            <xsl:value-of select="concat(//pc:Page/@imageWidth, 'px')"/>
                        </xsl:attribute>
                        <xsl:attribute name="height">
                            <xsl:value-of select="concat(//@imageHeight, 'px')"/>
                        </xsl:attribute>
                    </graphic>
                    <xsl:apply-templates select="//pc:Page"/>
                </sourceDoc>
            </TEI>
        </xsl:result-document>
        
    </xsl:template>
    <!-- A <TextRegion> node in the PAGE XML becomes a <surfaceGrp> node in the TEI -->
    <xsl:template match="//pc:TextRegion">
        <xsl:element name="surfaceGrp">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="@custom">
                        <xsl:value-of select="replace(@custom, ' ', '_')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of>no_value</xsl:value-of>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <!-- <surface> in the TEI represents all baselines associated with a <TextRegion> in the PAGE XML -->
            <surface>
                <xsl:attribute name="points">
                    <xsl:value-of select="pc:Coords/@points"/>
                </xsl:attribute>
                <!-- For each <TextLine> in the PAGE XML, a <zone> element is created in the TEI. -->
                <xsl:for-each select="pc:TextLine">
                    <!-- <zone> in the TEI represents baseline's mask in the PAGE XML -->
                    <xsl:element name="zone">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="type"><xsl:value-of>mask</xsl:value-of></xsl:attribute>
                        <xsl:attribute name="points">
                            <xsl:value-of select="pc:Coords/@points"/>
                        </xsl:attribute>
                        <!-- <path> in the TEI represents baseline's coordinates -->
                        <xsl:element name="path">
                            <xsl:attribute name="type"><xsl:value-of>baseline</xsl:value-of></xsl:attribute>
                            <xsl:attribute name="points">
                                <xsl:value-of select="pc:Baseline/@points"/>
                            </xsl:attribute>
                        </xsl:element>
                        <!-- <line> element in the TEI represents the transcription in the PAGE XML -->
                            <xsl:element name="line">
                                <xsl:value-of select="pc:TextEquiv/pc:Unicode"/>
                            </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </surface>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
