<?php

header("Content-Type: text/html");

$sourcePage =  file_get_contents('http://wiki.piratenpartei.de/BW:Kreisverband_Konstanz/IT/Transparenz');

if ($sourcePage != false)
{
	$config = array('output-xhtml' => true, 'output-xml' => true);

	$tidy = new tidy();

	$xml = new DomDocument();
	$xml->loadXML( $tidy->repairString($sourcePage, $config, 'UTF8') );

	$xsl = new DomDocument();

	$xsl->load('makexml_kvkn.xsl');
	$xslt = new XsltProcessor();
	$xslt->importStylesheet($xsl);
	
	$xmlSource = new DomDocument();
	$xmlSource->loadXML( $xslt->transformToXML($xml) );

	$xsl->load('transpaline.xsl');
	$xslt = new XsltProcessor();
	$xslt->importStylesheet($xsl);
	
	echo $xslt->transformToXML($xmlSource);
}

?>
