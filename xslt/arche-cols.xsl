<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:variable name="constants">
            <xsl:for-each select=".//node()[parent::acdh:RepoObject]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="TopColId">
            <xsl:value-of select="data(.//acdh:TopCollection/@rdf:about)"/>
        </xsl:variable>
        <rdf:RDF xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#">
            <acdh:TopCollection>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select=".//acdh:TopCollection/@rdf:about"/>
                </xsl:attribute>
                <xsl:copy-of select="$constants"/>
                <xsl:for-each select=".//node()[parent::acdh:TopCollection]">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </acdh:TopCollection>
            
            
            <xsl:for-each select=".//node()[parent::acdh:MetaAgents]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
            <xsl:for-each select=".//acdh:Collection">
                <acdh:Collection>
                    <xsl:attribute name="rdf:about"><xsl:value-of select="@rdf:about"/></xsl:attribute>
                    <xsl:copy-of select="$constants"/>
                    <xsl:for-each select=".//node()">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </acdh:Collection>
            </xsl:for-each>
            <xsl:for-each-group select="collection('../data/editions')//tei:TEI" group-by="substring(.//tei:title[@type='iso-date']/text(), 1, 4)">
                <xsl:variable name="colId">
                    <xsl:value-of select="concat($TopColId, '/editions/', current-grouping-key())"/>
                </xsl:variable>
                <acdh:Collection rdf:about="{$colId}">
                    <acdh:hasTitle xml:lang="de">Einträge des Jahres <xsl:value-of select="current-grouping-key()"/></acdh:hasTitle>
                    <acdh:isPartOf rdf:resource="{concat($TopColId, '/editions')}"/>
                    <acdh:hasExtent xml:lang="de"><xsl:value-of select="count(current-group())"/> Tagebucheinträge</acdh:hasExtent>
                    <xsl:copy-of select="$constants"/>
                    <acdh:hasCoverageStartDate rdf:datatype="http://www.w3.org/2001/XMLSchema#date"><xsl:value-of select="current-grouping-key()"/>-01-01</acdh:hasCoverageStartDate>
                    <acdh:hasCoverageEndDate rdf:datatype="http://www.w3.org/2001/XMLSchema#date"><xsl:value-of select="current-grouping-key()"/>-01-01</acdh:hasCoverageEndDate>
                </acdh:Collection>
            </xsl:for-each-group>
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>