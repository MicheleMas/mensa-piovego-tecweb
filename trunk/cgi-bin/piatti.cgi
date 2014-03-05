#!/usr/bin/perl -w

#Libraries
use XML::LibXSLT;
use XML::LibXML;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

#Read GET parameters
my $oCGI = CGI->new();
$lang = $oCGI->param('lang');

#Files location
my $fileXML = "../public_html/piatti.xml";

#Check the language
if($lang eq "en") {
	$fileXSL = "../public_html/piatti_en.xsl";
}
else {
	$fileXSL = "../public_html/piatti.xsl";
}

#Create objects for parsing and transformation
my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();

#Parsing
my $data = $parser->parse_file($fileXML);
my $xslParsed = $parser->parse_file($fileXSL);
my $xslRules = $xslt->parse_stylesheet($xslParsed);

#Apply the trasformation to the XML
my $result = $xslRules->transform($data);

#Trasform the output in HTML
my $page = $result->toString;

#Print the result page
print "Content-Type: text/html\n\n";
$page =~ s/standalone=\"yes\"/standalone=\"no\"/; 
print $page;