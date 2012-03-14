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
					$source = get_transient( 'transpaline_source' );

					if ($source != false)
					{
						$xmlSource = new DomDocument();
						$xmlSource->loadXML( $source );

						$xsl = new DomDocument();
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
