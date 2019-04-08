<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <!--<xsl:import href="/Users/jawalsh/development/tei2html/xslt/tei2html-conf.xsl"/>
        <xsl:import href="/Users/jawalsh/development/tei2html/xslt/tei2html-main.xsl"/>
        <xsl:import href="/Users/jawalsh/development/tei2html/xslt/tei2html-xtm.xsl"/>
        <xsl:import href="/Users/jawalsh/development/tei2html/xslt/tei2html-keywords.xsl"/>
        <xsl:import href="/Users/jawalsh/development/tei2html/xslt/tei2html-docinfo.xsl"/>
        <xsl:import href="/Users/jawalsh/development/tei2html/xslt/tei2html-notes.xsl"/>-->
    
    <!--  <xsl:param name="timeline-api-url" select="'http://localhost/~jawalsh/timeline/src/api/timeline-api.js'"/>-->
    <xsl:param name="timeline-api-url" select="'http://api.simile-widgets.org/timeline/2.3.1/timeline-api.js?bundle=true'"/>
    
    <xsl:template match="/">
        <xsl:call-template name="authorBand"/>
        <xsl:call-template name="publicationBand"/>
        <xsl:call-template name="historicalBand"/>
    </xsl:template>
    
    
    
    <xsl:template name="authorBand">
        <xsl:result-document encoding="utf-8"
            method="xml" href="author-events.xml">
            <data
                date-time-format="iso8601">
                <xsl:for-each select="//table[@xml:id = 'chronoTable']/row[@role = 'data']">
                    <xsl:if test="cell[2] != ''">
                        <xsl:for-each select="cell[2]/list/item">
                            <xsl:call-template name="event"/>
                        </xsl:for-each>
                        <xsl:for-each select="cell[2]/note[@type = 'chronoLetter']">
                            <xsl:call-template name="letter"/>
                        </xsl:for-each>
                        
                        <!--
                            <event>
                            <xsl:attribute name="start" select="cell[1]/date/@when"/>
                            <xsl:attribute name="title">
                            <xsl:attribute name="url">
                            <xsl:choose>
                            <xsl:when test="label">
                            </xsl:attribute>
                            </event>
                        -->
                    </xsl:if>
                </xsl:for-each>
            </data>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="publicationBand">
        <xsl:result-document encoding="utf-8"
            method="xml" href="publication-events.xml">
            <data
                date-time-format="iso8601">
                <xsl:for-each select="//table[@xml:id = 'chronoTable']/row[@role = 'data']">
                    <xsl:if test="cell[3] != ''">
                        <xsl:for-each select="cell[3]/list/item">
                            <xsl:call-template name="event"/>
                        </xsl:for-each>
                        <xsl:for-each select="cell[3]/note[@type = 'chronoLetter']">
                            <xsl:call-template name="letter"/>
                        </xsl:for-each>
                        <!--
                            <event>
                            <xsl:attribute name="start" select="cell[1]/date/@when"/>
                            <xsl:attribute name="title">
                            <xsl:choose>
                            <xsl:when test="label">
                            </xsl:attribute>
                            </event>
                        -->
                    </xsl:if>
                </xsl:for-each>
            </data>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="historicalBand">
        <xsl:result-document encoding="utf-8"
            method="xml" href="historical-events.xml">
            <data
                date-time-format="iso8601">
                <xsl:for-each select="//table[@xml:id = 'chronoTable']/row[@role = 'data']">
                    <xsl:if test="cell[4] != ''">
                        <xsl:for-each select="cell[4]/list/item">
                            <xsl:call-template name="event"/>
                        </xsl:for-each>
                        <xsl:for-each select="cell[4]/note[@type = 'chronoLetter']">
                            <xsl:call-template name="letter"/>
                        </xsl:for-each>
                        <!--
                            <event>
                            <xsl:attribute name="start" select="cell[1]/date/@when"/>
                            <xsl:attribute name="title">
                            <xsl:choose>
                            <xsl:when test="label">
                            </xsl:attribute>
                            </event>
                        -->
                    </xsl:if>
                </xsl:for-each>
            </data>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="works_cited">
        <xsl:result-document encoding="utf-8" method="xhtml" href="works_cited.html">
            <div class="works_cited">
                <xsl:apply-templates select="//div[@n = 'works cited']/listBibl"/>
            </div>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="event">
        <event>
            <xsl:choose>
                <xsl:when test="date">
                    <xsl:if test="date/@when">
                        <xsl:attribute name="start">
                            <xsl:value-of select="date/@when"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="date/@from">
                        <xsl:attribute name="start" select="date/@from"/>
                        <xsl:attribute name="isDuration" select="'true'"/>
                    </xsl:if>
                    <xsl:if test="date/@notBefore">
                        <xsl:attribute name="start" select="date/@notBefore"/>
                        <xsl:attribute name="isDuration" select="'true'"/>
                    </xsl:if>
                    <xsl:if test="date/@to">
                        <xsl:attribute name="end" select="date/@to"/>
                    </xsl:if>
                    <xsl:if test="date/@notAfter">
                        <xsl:attribute name="end" select="date/@notAfter"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="start" select="ancestor-or-self::row/cell[1]/date/@when"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="graphic">
                    <xsl:if test="graphic/@url">
                        <xsl:attribute name="image">
                            <xsl:value-of select="graphic/@url"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
            </xsl:choose>
            
            <xsl:attribute name="title">
                <xsl:choose>
                    <xsl:when test="label">
                        <xsl:value-of select="label"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select=".//text()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:if test="label or (.//ref) or (.//ptr)">
                <xsl:apply-templates/>
            </xsl:if>
        </event>    
    </xsl:template>
    
    <xsl:template name="letter">
        <xsl:variable name="contents">
            <xsl:apply-templates/>
        </xsl:variable>
        <event>
            <xsl:attribute name="start" select=".//cit/bibl/title/date/@when"/>
            <xsl:attribute name="title" select="concat('From a letter: ',cit/bibl/title[@level = 'a'])"/>
            <xsl:value-of select="normalize-space($contents)"/>
        </event>
    </xsl:template>
    
    <xsl:template match="lb">
        <xsl:text>&lt;lb/></xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match='lb'>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template name="graphic">
        <img src="{@url}"/>
    </xsl:template>
        
    <xsl:template match="cit|cit/quote">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="cell//text()" mode="attribute">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="title">
        <xsl:text>&lt;i></xsl:text><xsl:apply-templates/><xsl:text>&lt;/i></xsl:text>
    </xsl:template>
        
    <xsl:template match="title[@level = 'a']">
        <xsl:value-of select="'“'"/><xsl:apply-templates/><xsl:value-of select="'”'"/>
    </xsl:template>
    
    <xsl:template match="title[@level = 'a' and @rendition = '#sq']" priority="10">
        <xsl:value-of select="'‘'"/><xsl:apply-templates/><xsl:value-of select="'’'"/>
    </xsl:template>
    
    <xsl:template match="ref">
        <xsl:text>&lt;a href="</xsl:text><xsl:value-of select="@target"/><xsl:text>"></xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&lt;/a></xsl:text>
    </xsl:template>
    
    <xsl:template match="salute">
        <xsl:text>&lt;div></xsl:text><xsl:apply-templates/><xsl:text>&lt;/div></xsl:text>
    </xsl:template>
    
    <xsl:template match="cit/bibl">
        <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:value-of select="'&lt;p>'"/><xsl:apply-templates/><xsl:value-of select="'&lt;/p>'"/>
    </xsl:template>
    
    <xsl:template match="q[@rendition = '#sq']">
        <xsl:value-of select="'‘'"/><xsl:apply-templates/><xsl:value-of select="'’'"/>
    </xsl:template>
    
    <xsl:template match="q">
        <xsl:value-of select="'“'"/><xsl:apply-templates/><xsl:value-of select="'”'"/>
    </xsl:template>
    <xsl:template match="*[contains(@rendition,'#suppress')]"/>
</xsl:stylesheet>
