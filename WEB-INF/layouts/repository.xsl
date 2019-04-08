<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:url="http://www.jclark.com/xt/java/java.net.URLEncoder"
  xmlns:str="http://www.jclark.com/xt/java/java.lang.String"
  exclude-result-prefixes="url">
  <xsl:output method="html" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>
  <xsl:param name="repository"/>
  
<xsl:template match="term">
    <xsl:if test="$repository = @code">
        <xsl:value-of select="text()"/>
   </xsl:if>  
</xsl:template>
</xsl:stylesheet>