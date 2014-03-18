<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="no" /> 
<xsl:template match="piatti">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="Lista di tutti i piatti presenti nel menu del RistorESU Nord Piovego, con relativa immagine e descrizione" />
        <meta name="keywords" content="piatti, pasta, carne, contorno, RistorESU, menu, mensa" />
        <meta name="author" content="Claudio Guarisco, Gianluca Bariga Boscolo, Michele Massaro, Daniele Ronzani" />
        <meta name="language" content="italian it" />
		<link rel="stylesheet" type="text/css" href="../style.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="../small.css" media="handheld, screen and (max-width:39em), only screen and (max-device-width:30em)" />
		<link rel="stylesheet" type="text/css" href="../print.css" media="print" />
		<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
		<script type="text/javascript" src="../script.js"></script>
		<title>Piatti - RistorESU Nord Piovego</title>
	</head>
	<body onload="openTab()">
		<div id="header">
			
				<a tabindex="1" href="#contenuto" class="hidden">Vai al contenuto</a>
			<span id="lang">
				<span id="lang_switch_selected">ITA</span> 
				<a href="piatti.cgi?lang=en" id="lang_switch">ENG</a>
			</span>
			<h1><a name="titolo">RistorESU Nord Piovego</a></h1>
		</div>
		<div id="path">
			Ti trovi in: <a href="../index.html"><span xml:lang="eng">Home</span></a> &gt; <span id="clb">Piatti</span>
		</div>
		<div id="nav">
			<h1><a name="menu">Menù</a></h1>
			<ul>
				<li>
					<a href="../index.html"><span xml:lang="en">Home</span></a>
				</li>
				<li>
					<a href="../news.html"><span xml:lang="en">News</span></a>
				</li>
				<li>
					<a href="../where.html">Dove Siamo</a>
				</li>
				<li  id="current_page">
					Piatti
				</li>
				<li>
					<a href="../prices.html">Prezzi</a>
				</li>
				<li>
					<a href="../info.html">Info e Contatti</a>
				</li>
			</ul>
		</div>
		<div id="section">
			<div id="menu_section">
				<h1><a name="contenuto">Lista di Piatti</a></h1>
				<h2>Primi Piatti</h2>
				<dl>
					<xsl:for-each select="piatto[@categoria='primo']">
						<xsl:sort select="nomeITA" />
						<dt>
							<xsl:value-of select="nomeITA" />
						</dt>
						<dd>
							<a href="viewpiatto.cgi?id={@id}"><img src="../images/{img}" alt="{altITA}" /></a>
							<p><xsl:value-of select="descrizioneITA" /></p>
							<a class="stampano" href="viewpiatto.cgi?id={@id}">[continua e commenta il piatto <xsl:value-of select="nomeITA" />]</a>
						</dd>
					</xsl:for-each>
				</dl>
				<h2>Secondi Piatti</h2>
				<dl>
					<xsl:for-each select="piatto[@categoria='secondo']">
						<xsl:sort select="nomeITA" />
						<dt>
							<xsl:value-of select="nomeITA" />
						</dt>
						<dd>
							<a href="viewpiatto.cgi?id={@id}"><img src="../images/{img}" alt="{altITA}" /></a>
							<p><xsl:value-of select="descrizioneITA" /></p>
							<a class="stampano" href="viewpiatto.cgi?id={@id}">[continua e commenta il piatto <xsl:value-of select="nomeITA" />]</a>
						</dd>
					</xsl:for-each>
				</dl>
				<h2>Desserts</h2>
				<dl>
					<xsl:for-each select="piatto[@categoria='dessert']">
						<xsl:sort select="nomeITA" />
						<dt>
							<xsl:value-of select="nomeITA" />
						</dt>
						<dd>
							<a href="viewpiatto.cgi?id={@id}"><img src="../images/{img}" alt="{altITA}" /></a>
							<p><xsl:value-of select="descrizioneITA" /></p>
							<a class="stampano" href="viewpiatto.cgi?id={@id}">[continua e commenta il piatto <xsl:value-of select="nomeITA" />]</a>
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