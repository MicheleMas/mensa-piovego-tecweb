#!/usr/bin/perl -w

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use XML::LibXML;
use DateTime;
use Email::Valid;
use Fcntl ':flock';

#Read GET parameters
my $oCGI = CGI->new();

my $nome = $oCGI->param('nome');
$nome =~ s/[<>&]/*/g;
$nome = substr $nome, 0, 64;

my $email = $oCGI->param('email');
$email  =~ s/[<>&]//g;

my $lang = $oCGI->param('comment_lang');
my $id = $oCGI->param('element_id');

my $comment = $oCGI->param('comment_text');
$comment =~ s/[<>&]/*/g;
$comment = substr $comment, 0, 2048;

if ($lang eq 'ENG') {
	$language = 'en';
} elsif ($lang eq 'ITA') {
	$language = 'it';
} else { die("Lingua non valida"); }

if (!Email::Valid->address($email)) { die("Indirizzo email non valido!"); }
if(length($nome)<2){ die("Nome troppo corto!"); }
if(length($comment)<2){ die("Commento troppo corto!"); }

#otteniamo il lock
my $lockfile = "../data/lock";
open(my $fh, '>>', $lockfile) || die "Impossibile aprire file di lock.";
flock($fh, LOCK_EX) || die "Impossibile ottenere il lock!";

my $now = DateTime->now->ymd;
my $fileXML = "../public_html/piatti.xml";
my $parser = XML::LibXML->new();
my $data = $parser->parse_file($fileXML);

my $root = $data->getDocumentElement || die("Non accedo alla radice");
my $nsURI = $root->namespaceURI();
$root->setNamespace($nsURI, 'p');
my @piatti = $root->findnodes("//p:piatto[p:id='$id']");

$numero = @piatti;
if ($numero == 1) {
	$piatto = @piatti[0];
	$commentNode = $piatto->findnodes("p:commenti")->get_node(0);
	$newNode = "\n<commento lingua=\"$lang\">
	<autore>$nome</autore>
	<testo>$comment</testo>
	<data>$now</data>
	<email>$email</email>
	</commento>\n";
	$fragment = $parser->parse_balanced_chunk($newNode);
	$commentNode->appendChild($fragment);

	#serialize the three
	open (OUT, ">$fileXML");
	print OUT $data->toString;
	close (OUT);

	print "Content-Type: text/html\n\n";
	print "<meta http-equiv='refresh' content='0; url=./viewpiatto.cgi?id=$id&lang=$language' />";
} else {
	die("Id piatto non valido");
}

close($fh) || die "Impossibile liberare il lock!";

#Answer
#print "Content-Type: text/html\n\n";
#print "nome $nome\n
#email $email\n
#lang $lang\n
#id $id\n
#date $now\n
#comment $comment\n";
