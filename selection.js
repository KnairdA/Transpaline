$(document).ready(function() {

	$('#stammtischCheck').click(function() {
  		if ( $(this).is(':checked') ) {
  			$('.stammtisch').fadeIn('slow');
  		}
  		else {
  			$('.stammtisch').fadeOut('slow');
  		}
	});

	$('#presseCheck').click(function() {
  		if ( $(this).is(':checked') ) {
  			$('.pm').fadeIn('slow');
  		}
  		else {
  			$('.pm').fadeOut('slow');
  		}
	});

	$('#vorstandCheck').click(function() {
  		if ( $(this).is(':checked') ) {
  			$('.vorstand').fadeIn('slow');
  		}
  		else {
  			$('.vorstand').fadeOut('slow');
  		}
	});

	$('#sonstigesCheck').click(function() {
  		if ( $(this).is(':checked') ) {
  			$('.sonstiges').fadeIn('slow');

  		}
  		else {
  			$('.sonstiges').fadeOut('slow');
  		}
	});

	$('#versammlungCheck').click(function() {
  		if ( $(this).is(':checked') ) {
  			$('.mitglieder_versammlung').fadeIn('slow');
  			
  		}
  		else {
  			$('.mitglieder_versammlung').fadeOut('slow');
  		}
	});

});