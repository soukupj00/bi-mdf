<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ex="http://example.org/xsd">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Fitness Centra</title>
            </head>
            <body>
                <h1>Databaze fitness center</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ex:databazeFitnessCenter">
        <h1>Fitness centra</h1>
        <hr/>
        <xsl:for-each select="ex:fitnessCentrum">
            <xsl:call-template name="fitnessCentrum"/>
        </xsl:for-each>
        <h1>Členové fitness center</h1>
        <hr/>
        <xsl:for-each select="ex:clen">
            <xsl:call-template name="clen"/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="fitnessCentrum">
        <h2>
            <xsl:value-of select="ex:nazevFitnessCentrum"/>
        </h2>
        <dl>
            <dt>Identifier</dt>
            <dd>
                <xsl:value-of select="ex:iri"/>
            </dd>
            <dt>Kapacita</dt>
            <dd>
                <xsl:value-of select="ex:kapacitaFitnessCentrum"/>
            </dd>
            <dt>Do tohoto fitness jsou zapsaní tito lidé</dt>
            <xsl:for-each select="ex:maClena">
                <dd>
                    <xsl:value-of select="@clenUri"/>
                </dd>
            </xsl:for-each>
            <dt>Nachází se na adrese</dt>
            <dd>
                <xsl:call-template name="adresa">
                    <xsl:with-param name="celaAdresa" select="ex:adresa"/>
                </xsl:call-template>
                <!--<xsl:value-of select="ex:adresa/ex:mestoAdresa"/>-->
            </dd>
        </dl>
    </xsl:template>
    <xsl:template name="clen">
        <h2>
            <xsl:value-of select="ex:jmenoClen"/>
        </h2>
        <dl>
            <dt>Identifier</dt>
            <dd>
                <xsl:value-of select="ex:iri"/>
            </dd>
            <dt>Osobní číslo</dt>
            <dd>
                <xsl:value-of select="ex:osobniCisloClen"/>
            </dd>
            <xsl:if test="ex:email">
                <dt>Emaily</dt>
                <xsl:for-each select="ex:email">
                    <dd>
                        <xsl:value-of select="."/>
                    </dd>
                </xsl:for-each>
            </xsl:if>
        </dl>
    </xsl:template>
    <xsl:template name="adresa">
        <xsl:param name="celaAdresa"/>
        <dt>Město:</dt>
        <dd>
            <xsl:value-of select="$celaAdresa/ex:mestoAdresa"/>
        </dd>
        <dt>Ulice:</dt>
        <dd>
            <xsl:value-of select="$celaAdresa/ex:uliceAdresa"/>
        </dd>
        <dt>Popisné číslo domu:</dt>
        <dd>
            <xsl:value-of select="$celaAdresa/ex:cisloPopisneAdresa"/>
        </dd>
        <dt>PSČ:</dt>
        <dd>
            <xsl:value-of select="$celaAdresa/ex:pscAdresa"/>
        </dd>
    </xsl:template>
</xsl:stylesheet>