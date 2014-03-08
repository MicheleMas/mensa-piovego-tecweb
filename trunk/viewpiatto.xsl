<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="no" /> 
<xsl:template match="piatto">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="Descrizione di un singolo piatto comprensivo di immagine, descrizione e commenti" />
        <meta name="keywords" content="piatti, pasta, carne, contorno, RistorESU, menu, mensa" />
        <meta name="author" content="Claudio Guarisco, Gianluca Bariga Boscolo, Michele Massaro, Daniele Ronzani" />
        <meta name="language" content="italian it" />
		<link rel="stylesheet" type="text/css" href="../style.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="../small.css" media="handheld, screen and (max-width:39em), only screen and (max-device-width:30em)" />
		<link rel="stylesheet" type="text/css" href="../print.css" media="print" />
		<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
		<script type="text/javascript" src="../script.js"></script>
		<title><xsl:value-of select="nomeITA" /> - RistorESU Nord Piovego</title>
	</head>
	<body onload="openTab()">
		<div id="header">
			<a tabindex="1" href="#contenuto" class="hidden">Vai al contenuto</a>
			<span id="lang">
				<span id="lang_switch_selected">ITA</span> 
				<a href="viewpiatto.cgi?id={id}&amp;lang=en" id="lang_switch">ENG</a>
			</span>
			<h1>RistorESU Nord Piovego</h1>
		</div>
		<div id="path">
			Ti trovi in: <a href="../index.html"><span xml:lang="eng">Home</span></a> &gt; <a href="piatti.cgi">Piatti</a> &gt; <span id="clb"><xsl:value-of select="nomeITA" /></span>
		</div>
		<div id="nav">
			<h1><a name="menu">Menù</a></h1>
			<ul>
				<li>
					<a tabindex="2" href="../index.html"><span xml:lang="en">Home</span></a>
				</li>
				<li>
					<a tabindex="3" href="../news.html"><span xml:lang="en">News</span></a>
				</li>
				<li>
					<a tabindex="4" href="../where.html">Dove Siamo</a>
				</li>
				<li>
					<a tabindex="5" href="./piatti.cgi">Piatti</a>
				</li>
				<li>
					<a tabindex="6" href="../prices.html">Prezzi</a>
				</li>
				<li>
					<a tabindex="7" href="../info.html">Info e Contatti</a>
				</li>
			</ul>
		</div>
		<div id="section">
			<h1 id="meal_name"><a name="contenuto"><xsl:value-of select="nomeITA" /></a></h1>
			<div id="description">
				<img id="descr_image" src="../images/{img}" alt="{altITA}" />
				<p><xsl:value-of select="descrizioneITA" /></p>
			</div>
			
			<h2>Commenti:</h2>
			<div class="commenti_recenti" id="menu_section" >
				<dl>
					<xsl:for-each select="commenti/commento">
						<xsl:sort select="data" />
						<xsl:choose>
							<xsl:when test="@lingua='ENG'">
								<dt xml:lang="en">
									<xsl:value-of select="autore" /> - <xsl:value-of select="data" />
								</dt>
								<dd xml:lang="en">
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
			<h3>Commenta:</h3>
			<div id="form_container" class="dish_form">
			<form method="get" name="form" action="insertComment.cgi">
				<!-- <form class="commenti_submit" method="post">action="something.cgi">-->
				<fieldset class="form_field">
					<legend>
						I tuoi dati:
					</legend>
					<label for="nome">Nome: </label>
					<input type="text" name="nome" id="nome" tabindex="8" />

					<label for="email">Email: </label>
					<input type="text" name="email" id="email" tabindex="9" />

					<input type="text" name="comment_lang" readonly="readonly" id="comment_lang" value="ITA" />
				</fieldset>
				<fieldset class="form_field">
					<legend>
						Commenta:
					</legend>
					<label for="comment_text">Testo: </label>
					<textarea rows="15" cols="60" name="comment_text" id="comment_text" tabindex="10"> </textarea>
				</fieldset>
				<fieldset id="form_field_buttons">
					<legend>
						Conferma:
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
alt="CSS Valido!" />
    			</a>
			</span>
		</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>