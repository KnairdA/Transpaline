<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:x="http://www.w3.org/1999/xhtml"
 exclude-result-prefixes="x">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<transpaline>
		<xsl:apply-templates>
			<xsl:sort select="item/date"/>
		</xsl:apply-templates>
	</transpaline>
</xsl:template>

<xsl:template match="x:div[@id='protokolle_vorstand']/x:ul">
	<xsl:for-each select="x:li">
		<item type="protokoll_vorstand">
			<link><xsl:value-of select="x:a/@href"/></link>
			<date><xsl:value-of select="x:a"/></date>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="x:div[@id='mitglieder_versammlungen']/x:ul">
	<xsl:for-each select="x:li">
		<item type="mitglieder_versammlung">
			<link><xsl:value-of select="x:a/@href"/></link>
			<description><xsl:copy-of select="normalize-space(x:a)"/></description>
			<date><xsl:value-of select="substring(.,1,10)"/></date>
			<info>
				<xsl:for-each select="./x:ul/x:li">
					<link href="{x:a/@href}"><xsl:value-of select="x:a"/></link>
				</xsl:for-each>
			</info>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="x:div[@id='sonstiges']/x:ul">
	<xsl:for-each select="x:li">
		<item type="sonstiges">
			<link><xsl:value-of select="x:a/@href"/></link>
			<description><xsl:copy-of select="normalize-space(x:a)"/></description>
			<date><xsl:value-of select="substring(.,1,10)"/></date>
			<info>
				<xsl:for-each select="./x:ul/x:li">
					<link href="{x:a/@href}"><xsl:value-of select="x:a"/></link>
				</xsl:for-each>
			</info>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="x:div[@id='presse_mitteilungen']/x:ul">
	<xsl:for-each select="x:li">
		<item type="presse_mitteilung">
			<link><xsl:value-of select="x:a/@href"/></link>
			<description><xsl:copy-of select="normalize-space(x:a)"/></description>
			<date><xsl:value-of select="concat(substring(.,7,4), '-', substring(.,4,2), '-',substring(.,1,2))"/></date>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="x:div[@id='protokolle_konstanz']/x:ul">
	<xsl:for-each select="x:li">
		<item type="protokoll_konstanz">
			<link><xsl:value-of select="x:a/@href"/></link>
			<date><xsl:value-of select="normalize-space(x:a)"/></date>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="x:div[@id='protokolle_singen']/x:ul">
	<xsl:for-each select="x:li">
		<item type="protokoll_singen">
			<link><xsl:value-of select="x:a/@href"/></link>
			<date><xsl:value-of select="normalize-space(x:a)"/></date>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="x:div[@id='protokolle_radolfzell']/x:ul">
	<xsl:for-each select="x:li">
		<item type="protokoll_radolfzell">
			<link><xsl:value-of select="x:a/@href"/></link>
			<date><xsl:value-of select="normalize-space(x:a)"/></date>
		</item>
	</xsl:for-each>
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>
