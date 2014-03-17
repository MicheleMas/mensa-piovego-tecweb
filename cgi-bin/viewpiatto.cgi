#!/usr/bin/perl -w

#Libraries
use XML::LibXSLT;
use XML::LibXML;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

#Read GET parameters
my $oCGI = CGI->new();
$lang = $oCGI->param('lang');
$id = $oCGI->param('id');

#Files location
my $fileXML = "../public_html/piatti.xml";

#Check the language
if($lang eq "en") {
	$fileXSL = "../public_html/viewpiatto_en.xsl";
}
else {
	$fileXSL = "../public_html/viewpiatto.xsl";
}

#Create objects for parsing and transformation
my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();

#Parsing
my $data = $parser->parse_file($fileXML) || die("Operazione di parsificazione fallita");
my $xslParsed = $parser->parse_file($fileXSL) || die("Operazione di parsificazione fallita");
my $xslRules = $xslt->parse_stylesheet($xslParsed) || die("Operazione di parsificazione fallita");

#Select the correct node
my $radice= $data->getDocumentElement || die("Non accedo alla radice");
my @target = $radice->findnodes("//piatto[\@id='".$id."']");
my $size = @target;
print "Content-Type: text/html\n\n";
if ($size > 0) {
	#Apply the trasformation to the XML
	$result = $xslRules->transform(@target[0]) || die("Operazione di parsificazione fallita");

	#Trasform the output in HTML
	$page = $result->toString;
} else {
	$page = "<meta http-equiv='refresh' content='0; url=../page_not_found.html' />";
}

#Print the result page
#print "Content-Type: text/html\n\n";
$page =~ s/standalone=\"yes\"/standalone=\"no\"/; 
print $page;
#print @target[0]->toString;