<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
<xsl:template match="*">
<table border="0" width="176" align="center">
<tr><td valign="top" align="left" width="176">
<a>
<b><font face="Verdana" size="1" color="#666666">
<xsl:attribute name="href">
<xsl:value-of select="*[local-name()='channel']/*[local-name()='link']"/>
</xsl:attribute>
<xsl:attribute name="target">
<xsl:text>top</xsl:text>
</xsl:attribute>
<xsl:value-of select="*[local-name()='channel']/*[local-name()='title']"/>
</font></b>
</a>
<xsl:text disable-output-escaping="yes"></xsl:text>
<xsl:value-of select="*[local-name()='channel']/*[local-name()='lastBuildDate']"/>
</td></tr><tr><td valign="left" width="176">
<font face="Verdana" size="1">
<xsl:for-each select="//*[local-name()='item']">
<a>
<xsl:attribute name="href">
<xsl:value-of select="*[local-name()='link']"/>
</xsl:attribute>
<xsl:attribute name="target">
<xsl:text>top</xsl:text>
</xsl:attribute>
<xsl:value-of select="*[local-name()='title']"/>
</a><br />
<img src="/skins/skin_PriceCompare_at/images/bg/bg_line__.gif"/><br />
<xsl:value-of select="*[local-name()='description']" disable-output-escaping="yes"/>
</xsl:for-each>
</font>
</td></tr>
</table>
</xsl:template>
<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>
</xsl:stylesheet>

