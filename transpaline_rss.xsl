<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:include href="date-time.xsl" />

<xsl:template match="transpaline">
	<rss version="2.0">
		<channel>
			<title>Zeitleiste des KV Konstanz</title>
			<link>http://piraten-konstanz.de/transparenz/</link>
			<description>Zeitleiste des KV Konstanz</description>
			
			<xsl:for-each select="item">
				<xsl:sort select="./date" order="descending"/>

				<xsl:call-template name="item">
					<xsl:with-param name="item" select="."/>
				</xsl:call-template>
			</xsl:for-each>
		</channel>
	</rss>
</xsl:template>

<xsl:template name="item">
	<xsl:param name="item"/>

	<xsl:choose>
		<xsl:when test="$item[@type='protokoll_vorstand']">
			<xsl:call-template name="vorstandssitzung">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>

		<xsl:when test="$item[@type='presse_mitteilung']">
			<xsl:call-template name="presse_mitteilung">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>

		<xsl:when test="$item[@type='protokoll_konstanz']">
			<xsl:call-template name="protokoll_konstanz">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>

		<xsl:when test="$item[@type='protokoll_singen']">
			<xsl:call-template name="protokoll_singen">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>

		<xsl:when test="$item[@type='protokoll_radolfzell']">
			<xsl:call-template name="protokoll_radolfzell">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>

		<xsl:when test="$item[@type='mitglieder_versammlung']">
			<xsl:call-template name="mitglieder_versammlung">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>

		<xsl:when test="$item[@type='sonstiges']">
			<xsl:call-template name="sonstiges">
				<xsl:with-param name="item" select="$item"/>
			</xsl:call-template>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="vorstandssitzung">
	<xsl:param name="item"/>

	<item>
		<title>Vorstandssitzung am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="presse_mitteilung">
	<xsl:param name="item"/>

	<item>
		<title>»<xsl:value-of select="description"/>« am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="mitglieder_versammlung">
	<xsl:param name="item"/>

	<item>
		<title><xsl:value-of select="./description"/> am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="sonstiges">
	<xsl:param name="item"/>

	<item>
		<title><xsl:value-of select="./description"/> am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="protokoll_konstanz">
	<xsl:param name="item"/>

	<item>
		<title>Stammtisch in Konstanz am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="protokoll_singen">
	<xsl:param name="item"/>

	<item>
		<title>Stammtisch in Singen am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="protokoll_radolfzell">
	<xsl:param name="item"/>

	<item>
		<title>Stammisch in Radolfzell am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></title>
		<link><xsl:value-of select="./link"/></link>
	</item>
</xsl:template>

<xsl:template name="date">
	<xsl:param name="iso"/>

	<xsl:call-template name="format-date">
		<xsl:with-param name="date" select="$iso"/>
		<xsl:with-param name="format" select="'d.n.Y'"/>
	</xsl:call-template>
</xsl:template>

</xsl:stylesheet>


