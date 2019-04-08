<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:url="http://www.jclark.com/xt/java/java.net.URLEncoder"
  xmlns:str="http://www.jclark.com/xt/java/java.lang.String"
  exclude-result-prefixes="url">
  <xsl:output method="html" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>
  <xsl:param name="filter"/>
  <xsl:param name="url"/>
  <xsl:param name="field"/>
  <xsl:param name="sort"/>
  
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$field = 'genre'">
      <div style="padding: 10px 0px 10px 30px;">
        <ul id="genre">
        	<xsl:for-each select="//term">
        		<li value="{@size}" title="{.}">
        		<xsl:element name="a">
        			<xsl:attribute name="href">
<!--        				<xsl:value-of select="$url"/>;text1=*;field1=genre;f1-genre=<xsl:value-of select="."/>;browseText=<xsl:value-of select="."/>-->
        			  <xsl:value-of select="$url"/>;text1=<xsl:value-of select="url:encode(str:replaceAll(str:new(text()), '[^0-9A-Za-z]', ''), 'utf-8')"/>;field1=browse-genre;browseText=<xsl:value-of select="url:encode(text(), 'utf-8')"/>
        			</xsl:attribute>
        			<xsl:value-of select="." /><span class="auraltext"> (<xsl:value-of select="@size"/>)</span>
        		</xsl:element>
        		</li>
        	</xsl:for-each>
        </ul>
        </div>
      </xsl:when>
      <xsl:when test="$field = 'repository'">
        <xsl:apply-templates select="." mode="repository"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$filter != ''">
          <xsl:choose>
            <xsl:when test="$field = 'title'">
              <xsl:apply-templates mode="title"/>
            </xsl:when>
            <xsl:otherwise><xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:variable name="matchExists">
            <xsl:value-of select="count(//term[starts-with(., $filter)])"/>
          </xsl:variable>
          <xsl:if test="$matchExists = 0 and $filter != 'num'">
            <h3>No browse results for <xsl:value-of select="$filter"/></h3>
          </xsl:if>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="/" mode="repository">
    <xsl:for-each select="//term">
      <h3 class="normal">
        <a href="{$url}?repository={@key};sort=title"><xsl:value-of select="."/> (<xsl:value-of select="@size"/>)</a>     
      </h3>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="term">

    <xsl:variable name="actualTerm">
      <xsl:choose>
        <xsl:when test="./actualTerm/text() != ''">
          <xsl:value-of select="./actualTerm/text()"/>
        </xsl:when>
      </xsl:choose>
     </xsl:variable>
      
    
    <xsl:choose>
      <xsl:when test="$filter = 'num'">
        <xsl:if test="contains('0123456789', substring(., 1, 1)) or contains('Date Unknown',.)">
          <h3 class="browseList">
            <xsl:element name="a">
              <xsl:attribute name="href"><xsl:value-of select="$url"/>;field1=browse-<xsl:value-of select="$field"/>;text1=<xsl:value-of select="url:encode(str:replaceAll(str:new(text()), '[^0-9A-Za-z]', ''), 'utf-8')"/>;browseText=<xsl:value-of select="url:encode(text(), 'utf-8')"/>;sort=<xsl:value-of select="$sort"/></xsl:attribute>
              <xsl:value-of select="."/> (<xsl:value-of select="@size"/>)
            </xsl:element>
          </h3>        
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="starts-with(., $filter) or starts-with(., translate($filter, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))">
          <h3 class="browseList">
            <xsl:element name="a">
              <xsl:attribute name="href"><xsl:value-of select="$url"/>;field1=browse-<xsl:value-of select="$field"/>;text1=<xsl:value-of select="url:encode(str:replaceAll(str:new(text()), '[^0-9A-Za-z]', ''), 'utf-8')"/>;browseText=<xsl:value-of select="url:encode(text(), 'utf-8')"/>;sort=<xsl:value-of select="$sort"/></xsl:attribute>
              <xsl:value-of select="text()"/>
              <xsl:if test="$actualTerm != ''">
                [<xsl:value-of select="$actualTerm"/>]
              </xsl:if>
              (<xsl:value-of select="@size"/>)
            </xsl:element>
          </h3>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="term" mode="title">
    
    <xsl:variable name="actualTerm">
      <xsl:choose>
        <xsl:when test="./actualTerm/text() != ''">
          <xsl:value-of select="./actualTerm/text()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./text()"/>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$filter = 'num'">
        <xsl:if test="contains('0123456789', substring(., 1, 1))">
          <h3 class="browseList">
            <xsl:element name="a">
              <xsl:attribute name="href"><xsl:value-of select="$url"/>;field1=browse-<xsl:value-of select="$field"/>;text1=<xsl:value-of select="url:encode(str:replaceAll(str:new(text()), '[^0-9A-Za-z]', ''), 'utf-8')"/>;browseText=<xsl:value-of select="url:encode(text(), 'utf-8')"/>;sort=<xsl:value-of select="$sort"/></xsl:attribute>
              <xsl:value-of select="."/> (<xsl:value-of select="@size"/>)
            </xsl:element>
          </h3>        
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="starts-with(./text(), $filter) or starts-with(./text(), translate($filter, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))">
          <h3 class="browseList">
            <xsl:element name="a">
              <xsl:attribute name="href"><xsl:value-of select="$url"/>;field1=browse-<xsl:value-of select="$field"/>;text1=<xsl:value-of select="url:encode(str:replaceAll(str:new($actualTerm), '[^0-9A-Za-z]', ''), 'utf-8')"/>;browseText=<xsl:value-of select="url:encode($actualTerm, 'utf-8')"/>;sort=<xsl:value-of select="$sort"/></xsl:attribute>
              <xsl:value-of select="$actualTerm"/> 
            </xsl:element>
          </h3>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
