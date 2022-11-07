<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="'Schnitzler Tagebuch'"/>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="de">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"/>
            </xsl:call-template>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="wrapper" id="wrapper-hero">
                        <!-- ******************* The Hero Area ******************* -->
                        <div class="wrapper" id="wrapper-hero-content"
                            style="background-image:url(https://shared.acdh.oeaw.ac.at/schnitzler-tagebuch/hero-bg.jpg)">
                            <div class="container-fluid-empty hero-light" id="wrapper-hero-inner"
                                tabindex="-1">
                                <div>
                                    <h1 class="mb-0">Arthur Schnitzler</h1>
                                    <h1 class="display-3 mb-2">Tagebuch</h1>
                                    <h2>1879 – 1931</h2>
                                </div>
                                <p class="mt-3">16.407 Einträge notierte der Schriftsteller Arthur
                                    Schnitzler in sein Tagebuch. Sie geben Auskunft über das Leben
                                    des Wiener Schriftstellers, die Begegnungen, die er hatte, und
                                    die Gespräche, die er führte.</p>
                                <a href="entry__1879-03-03.html">
                                    <button class="btn btn-round mr-2">Lesen</button>
                                </a>
                                <a href="about.html">
                                    <button class="btn btn-round">Mehr erfahren</button>
                                </a>
                            </div>
                        </div>
                        <!-- #wrapper-hero-content -->
                    </div>
                    <div class="container" style="margin-top:1em;">
                        <div class="row">
                            <div class="col-md-4">
                                <a href="calendar.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-tagebuch/resources/img/post-bg-2.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-user-group"/> Kalender
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="listperson.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-tagebuch/resources/img/persons.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-user-group"/> Personenverzeichnis
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="listwork.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-briefe/img/werke.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-user-group"/> Werkregister
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="listplace.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-tagebuch/resources/img/places.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-user-group"/> Ortsregister
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="tei:p">
        <p id="{generate-id()}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:list">
        <ul id="{generate-id()}">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:item">
        <li id="{generate-id()}">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
