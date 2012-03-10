<?php
/*
Template Name: Transpaline
*/
?>

<?php get_header(); ?>

		<div id="mitte_transparenz">
			<div class="post">
				<div class="post-head">
					<p class="post-title"><a href="<?php the_permalink() ?>" rel="bookmark">Transparenz</a></p>
				</div>
				<div class="post-content">
					<?php
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

						$xmlSource = new DomDocument();
						$xmlSource->loadXML( $xslt->transformToXML($xml) );

						$xsl->load('wp-content/tool/transpaline/transpalineEmbed.xsl');
						$xslt = new XsltProcessor();
						$xslt->importStylesheet($xsl);
	
						$content = $xslt->transformToXML($xmlSource);
						echo $content;

						set_transient( 'transpaline', $content, 2592000 );
					}
					else {
						echo get_transient( 'transpaline' );
					}
					?>
				</div>
			</div>
		</div>

<?php get_footer(); ?>
