#!/usr/bin/perl -w

#Carico le librerie
use XML::LibXSLT;
use XML::LibXML;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

#Imposto i path del file dati e della trasformata
my $fileData = "../public_html/piatti.xml";
my $trasformed = "../public_html/piatti.xsl";

#Creazione del parser
my $parser = XML::LibXML->new();

#Creazione dell'oggetto che effettuerà la trasformazione
my $xslt = XML::LibXSLT->new();

#Operazione di parsing dei due documenti
my $data = $parser->parse_file($fileData);
my $xsltRule = $parser->parse_file($trasformed);

#Creazione del foglio di trasformazione di stile
my $stylesheet = $xslt->parse_stylesheet($xsltRule);

#Applicazione della trasformata
my $result = $stylesheet->transform($data);

#Serializzazione della trasformata
my $page = $result->toString;

#Invio della pagina al browser
print "Content-Type: text/html\n";
print "Content-Enconding: utf8\n\n";
print $page;
