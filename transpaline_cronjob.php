<?php

// Transpaline-Update

add_action('update_transpaline_source', 'update_transpaline');

function activate_transpaline_update()
{
	if ( !wp_next_scheduled( 'update_transpaline_source' ) ) {
		wp_schedule_event(time(), 'hourly', 'update_transpaline_source');
	}
}

add_action('wp', 'activate_transpaline_update');

function update_transpaline()
{
	$sourcePage =  file_get_contents('http://wiki.piratenpartei.de/BW:Kreisverband_Konstanz/IT/Transparenz');

	if ($sourcePage != false)
	{
		$config = array('output-xhtml' => true, 'output-xml' => true);

		$tidy = new tidy();

		$xml = new DomDocument();
		$xml->loadXML( $tidy->repairString($sourcePage, $config, 'UTF8') );

		$xsl = new DomDocument();

		$xsl->load('wp-content/tool/transpaline/makexml_kvkn.xsl');
		$xslt = new XsltProcessor();
		$xslt->importStylesheet($xsl);

		set_transient( 'transpaline_source', $xslt->transformToXML($xml), 2592000 );
	}
}
	
?>
