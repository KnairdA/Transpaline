<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:include href="http://piraten-konstanz.de/wp-content/tool/transpaline/date-time.xsl" />

<xsl:template match="transpaline">
	<ul id="timeline">

		<li class="item first">
			<h1>Zeitleiste des KV Konstanz</h1>
			<div id="selectionBox">
				<h2>Anzeige:</h2>
				<input type="checkbox" id="versammlungCheck" checked="checked"/> Mitgliederversammlungen<br/>
				<input type="checkbox" id="vorstandCheck" checked="checked"/> Vorstandssitzungen<br/>
				<input type="checkbox" id="stammtischCheck" checked="checked"/> Stammtische<br/>
				<input type="checkbox" id="presseCheck" checked="checked"/> Pressemitteilungen<br/>
				<input type="checkbox" id="sonstigesCheck" checked="checked"/> Wahlen<br/>
			</div>
		</li>

		<xsl:for-each select="item">
			<xsl:sort select="./date" order="descending"/>

			<xsl:call-template name="item">
				<xsl:with-param name="item" select="."/>
			</xsl:call-template>
		</xsl:for-each>

		<li class="item first last">
			<h1>00.00.0000</h1>
		</li>

	</ul>
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

	<li class="item left vorstand">
		<a href="{./link}">
			Vorstandssitzung am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template>
		</a>
	</li>
</xsl:template>

<xsl:template name="presse_mitteilung">
	<xsl:param name="item"/>

	<li class="item left pm">
		<a href="{./link}">
			»<xsl:value-of select="description"/>«
		</a>
		<p>Pressemitteilung vom <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template></p>
	</li>
</xsl:template>

<xsl:template name="mitglieder_versammlung">
	<xsl:param name="item"/>

	<li class="item full mitglieder_versammlung">
		<p class="title">
			<a href="{./link}">
			<xsl:value-of select="./description"/> am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template>
			</a>
		</p>
		<a href="{./link}">Orga-Seite</a>
		<xsl:for-each select="./info/link">, <a href="{@href}"><xsl:value-of select="."/></a></xsl:for-each>
	</li>
</xsl:template>

<xsl:template name="sonstiges">
	<xsl:param name="item"/>

	<li class="item full sonstiges">
		<p class="title">
			<a href="{./link}">
			<xsl:value-of select="./description"/> am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template>
			</a>
		</p>
		<a href="{./link}">Orga-Seite</a>
		<xsl:for-each select="./info/link">, <a href="{@href}"><xsl:value-of select="."/></a></xsl:for-each>
	</li>
</xsl:template>

<xsl:template name="protokoll_konstanz">
	<xsl:param name="item"/>

	<li class="item right stammtisch">
		<a href="{./link}">
			Stammtisch in Konstanz am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template>
		</a>
	</li>
</xsl:template>

<xsl:template name="protokoll_singen">
	<xsl:param name="item"/>

	<li class="item right stammtisch">
		<a href="{./link}">
			Stammtisch in Singen am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template>
		</a>
	</li>
</xsl:template>

<xsl:template name="protokoll_radolfzell">
	<xsl:param name="item"/>

	<li class="item right stammtisch">
		<a href="{./link}">
			Stammtisch in Radolfzell am <xsl:call-template name="date"><xsl:with-param name="iso" select="./date"/></xsl:call-template>
		</a>
	</li>
</xsl:template>

<xsl:template name="date">
	<xsl:param name="iso"/>

	<xsl:call-template name="format-date">
		<xsl:with-param name="date" select="$iso"/>
		<xsl:with-param name="format" select="'d. M Y'"/>
	</xsl:call-template>
</xsl:template>

</xsl:stylesheet>


