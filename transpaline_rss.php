<?php

require_once( '../../../wp-blog-header.php' );

header("Content-Type: application/rss+xml");

$source = get_transient( 'transpaline_source' );

if ($source != false)
{
	$xmlSource = new DomDocument();
	$xmlSource->loadXML( $source );

	$xsl = new DomDocument();
	$xsl->load('transpaline_rss.xsl');
	$xslt = new XsltProcessor();
	$xslt->importStylesheet($xsl);
	
	$content = $xslt->transformToXML($xmlSource);
	echo $content;
	
	set_transient( 'transpaline_rss', $content, 2592000 );
}
else {
	echo get_transient( 'transpaline_rss' );
}

?>
