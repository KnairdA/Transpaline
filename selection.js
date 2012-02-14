jQuery(function() {

	jQuery('#stammtischCheck').click(function() {
  		if ( jQuery(this).is(':checked') ) {
  			jQuery('.stammtisch').fadeIn('slow');
  		}
  		else {
  			jQuery('.stammtisch').fadeOut('slow');
  		}
	});

	jQuery('#presseCheck').click(function() {
  		if ( jQuery(this).is(':checked') ) {
  			jQuery('.pm').fadeIn('slow');
  		}
  		else {
  			jQuery('.pm').fadeOut('slow');
  		}
	});

	jQuery('#vorstandCheck').click(function() {
  		if ( jQuery(this).is(':checked') ) {
  			jQuery('.vorstand').fadeIn('slow');
  		}
  		else {
  			jQuery('.vorstand').fadeOut('slow');
  		}
	});

	jQuery('#sonstigesCheck').click(function() {
  		if ( jQuery(this).is(':checked') ) {
  			jQuery('.sonstiges').fadeIn('slow');

  		}
  		else {
  			jQuery('.sonstiges').fadeOut('slow');
  		}
	});

	jQuery('#versammlungCheck').click(function() {
  		if ( jQuery(this).is(':checked') ) {
  			jQuery('.mitglieder_versammlung').fadeIn('slow');
  			
  		}
  		else {
  			jQuery('.mitglieder_versammlung').fadeOut('slow');
  		}
	});

});