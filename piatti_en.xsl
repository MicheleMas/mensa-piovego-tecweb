<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="no" /> 
<xsl:template match="piatti">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="List of all the dishes on the menu of the RistorESU Nord with its picture Piovego and description" />
        <meta name="keywords" content="meals, catering, padova, RistorESU, menus, students, universities, Piovego, cafeteria" />
        <meta name="author" content="Claudio Guarisco, Gianluca Bariga Boscolo, Michele Massaro, Daniele Ronzani" />
        <meta name="language" content="english en" />
		<link rel="stylesheet" type="text/css" href="../style.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="../small.css" media="handheld, screen and (max-width:39em), only screen and (max-device-width:30em)" />
		<link rel="stylesheet" type="text/css" href="../print.css" media="print" />
		<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
		<script type="text/javascript" src="../script.js"></script>
		<title>Meals - RistorESU Nord Piovego</title>
	</head>
	<body onload="openTab()">
		<div id="header">
			<a tabindex="1" href="#contenuto" class="hidden">Skip to content</a>
			<span id="lang">
				<a href="piatti.cgi" id="lang_switch">ITA</a> 
				<span id="lang_switch_selected">ENG</span>
			</span>
			<h1><a name="titolo" xml:lang="it">RistorESU Nord Piovego</a></h1>
		</div>
		<div id="path">
			You are in: <a href="../index_en.html">Home</a> &gt; <span id="clb">Meals</span>
		</div>
		<div id="nav">
			<h1><a name="menu">Menu</a></h1>
			<ul>
				<li>
					<a tabindex="2" href="../index_en.html">Home</a>
				</li>
				<li>
					<a tabindex="3" href="../news_en.html">News</a>
				</li>
				<li>
					<a tabindex="4" href="../where_en.html">How to find us</a>
				</li>
				<li id="current_page">
					<span>Meals</span>
				</li>
				<li>
					<a tabindex="5" href="../prices_en.html">Prices</a>
				</li>
				<li>
					<a tabindex="6" href="../info_en.html">Info and Referral</a>
				</li>
			</ul>
		</div>
		<div id="section">
			<div id="menu_section">
				<h1><a name="contenuto">List of Meals</a></h1>
				<h2>First Courses</h2>
				<dl>
					<xsl:for-each select="piatto[@categoria='primo']">
						<xsl:sort select="nomeENG" />
						<dt>
							<xsl:value-of select="nomeENG" />
						</dt>
						<dd>
							<a href="viewpiatto.cgi?id={@id}&amp;lang=en"><img src="../images/{img}" alt="{altENG}" /></a>
							<p><xsl:value-of select="descrizioneENG" /></p>
							<a class="stampano" href="viewpiatto.cgi?id={@id}&amp;lang=en">[continue and comment <xsl:value-of select="nomeENG" />]</a>
						</dd>
					</xsl:for-each>
				</dl>
				<h2>Second Courses</h2>
				<dl>
					<xsl:for-each select="piatto[@categoria='secondo']">
						<xsl:sort select="nomeENG" />
						<dt>
							<xsl:value-of select="nomeENG" />
						</dt>
						<dd>
							<a href="viewpiatto.cgi?id={@id}&amp;lang=en"><img src="../images/{img}" alt="{altENG}" /></a>
							<p><xsl:value-of select="descrizioneENG" /></p>
							<a  class="stampano" href="viewpiatto.cgi?id={@id}&amp;lang=en">[continue and comment <xsl:value-of select="nomeENG" />]</a>
						</dd>
					</xsl:for-each>
				</dl>
				<h2>Desserts</h2>
				<dl>
					<xsl:for-each select="piatto[@categoria='dessert']">
						<xsl:sort select="nomeENG" />
						<dt>
							<xsl:value-of select="nomeENG" />
						</dt>
						<dd>
							<a href="viewpiatto.cgi?id={@id}&amp;lang=en"><img src="../images/{img}" alt="{altENG}" /></a>
							<p><xsl:value-of select="descrizioneENG" /></p>
							<a  class="stampano" href="viewpiatto.cgi?id={@id}&amp;lang=en">[continue and comment <xsl:value-of select="nomeENG" />]</a>
						</dd>
					</xsl:for-each>
				</dl>
			</div>
		</div>
		<div id="footer">
			<span id="social_container">
				<a class="popup" href="http://www.facebook.com"><img src="../images/icon_fb.png" alt="Facebook" /></a>
				<a class="popup" href="http://www.foursquare.com"><img src="../images/icon_foursquare.png" alt="Foursquare" /></a>
				<a class="popup" href="http://www.instagram.com"><img src="../images/icon_instagram.png" alt="Instagram"/></a>
			</span>
			<span id="credits">Mensaddicted</span>
			<span id="w3c_container">
				<a class="popup" href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" /></a>
				
				<a class="popup" href="http://jigsaw.w3.org/css-validator/check/referer"><img src="http://jigsaw.w3.org/css-validator/images/vcss" alt="CSS Valido!"/></a>
    			
    			<a class="popup" href="http://www.w3.org/WAI/WCAG2AAA-Conformance" title="Explanation of WCAG 2.0 Level Triple-A Conformance"><img src="http://www.w3.org/WAI/wcag2AAA" alt="Level Triple-A conformance"/></a>
			</span>
		</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>