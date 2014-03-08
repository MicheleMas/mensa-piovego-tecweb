<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="no" /> 
<xsl:template match="piatto">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="Description of a single meal with image, description and comments" />
        <meta name="keywords" content="catering, padova, RistorESU, menus, students, universities, Piovego, cafeteria" />
        <meta name="author" content="Claudio Guarisco, Gianluca Bariga Boscolo, Michele Massaro, Daniele Ronzani" />
        <meta name="language" content="english en" />
		<link rel="stylesheet" type="text/css" href="../style.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="../small.css" media="handheld, screen and (max-width:39em), only screen and (max-device-width:30em)" />
		<link rel="stylesheet" type="text/css" href="../print.css" media="print" />
		<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
		<script type="text/javascript" src="../script.js"></script>
		<title><xsl:value-of select="nomeENG" /> - RistorESU Nord Piovego</title>
	</head>
	<body onload="openTab()">
		<div id="header">
			<a tabindex="1" href="#contenuto" class="hidden">Skip to content</a>
			<span id="lang">
				<a href="viewpiatto.cgi?id={id}&amp;lang=it" id="lang_switch">ITA</a>
				<span id="lang_switch_selected">ENG</span> 
			</span>
			<h1 xml:lang="it">RistorESU Nord Piovego</h1>
		</div>
		<div id="path">
			You are in: <a href="../index.html">Home</a> &gt; <a href="piatti.cgi?lang=en">Meals</a> &gt; <span id="clb"><xsl:value-of select="nomeENG" /></span>
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
				<li>
					<a tabindex="5" href="piatti.cgi?lang=en">Meals</a>
				</li>
				<li>
					<a tabindex="6" href="../prices_en.html">Prices</a>
				</li>
				<li>
					<a tabindex="7" href="../info_en.html">Info and referral</a>
				</li>
			</ul>
		</div>
		<div id="section">
			<h1 id="meal_name"><a name="contenuto"><xsl:value-of select="nomeENG" /></a></h1>
			<div id="description">
				<img id="descr_image" src="../images/{img}" alt="{altENG}" />
				<p><xsl:value-of select="descrizioneENG" /></p>
			</div>
			
			<h2>Comments:</h2>
			<div class="commenti_recenti" id="menu_section" >
				<dl>
					<xsl:for-each select="commenti/commento">
						<xsl:sort select="data" />
						<xsl:choose>
							<xsl:when test="@lingua='ITA'">
								<dt xml:lang="it">
									<xsl:value-of select="autore" /> - <xsl:value-of select="data" />
								</dt>
								<dd xml:lang="it">
									<xsl:value-of select="testo" />
								</dd>
							</xsl:when>
							<xsl:otherwise>
								<dt>
									<xsl:value-of select="autore" /> - <xsl:value-of select="data" />
								</dt>
								<dd>
									<xsl:value-of select="testo" />
								</dd>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</dl>
			</div>
			<h3>Comment!:</h3>
			<div id="form_container" class="dish_form">
			<form method="get" name="form" action="insertComment.cgi">
				<!-- <form class="commenti_submit" method="post">action="something.cgi">-->
				<fieldset class="form_field">
					<legend>
						Your infos:
					</legend>
					<label for="nome">Name: </label>
					<input type="text" name="nome" id="nome" tabindex="8" />

					<label for="email">Email: </label>
					<input type="text" name="email" id="email" tabindex="9" />

					<input type="text" name="comment_lang" readonly="readonly" id="comment_lang" value="ENG" />
				</fieldset>
				<fieldset class="form_field">
					<legend>
						Comment!:
					</legend>
					<label for="comment_text">Text: </label>
					<textarea rows="15" cols="60" name="comment_text" id="comment_text" tabindex="10"> </textarea>
				</fieldset>
				<fieldset id="form_field_buttons">
					<legend>
						Confirm:
					</legend>
					<input type="submit" class="buttons" id="submit_button" onclick="validateForm()" value="Invia commento" tabindex="10" />
					<input type="reset" class="buttons" id="reset" value="Cancella tutto" tabindex="10" />
				</fieldset>
			</form>
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
				<a class="popup" href="http://validator.w3.org/check?uri=referer">
					<img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" /></a>
				<a class="popup" href="http://jigsaw.w3.org/css-validator/check/referer">
        		<img src="http://jigsaw.w3.org/css-validator/images/vcss"
alt="Valid CSS" />
    			</a>
			</span>
		</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>