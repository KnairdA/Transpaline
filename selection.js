$(document).ready(function() {

	$('#stammtischCheck').click(function() {
  		checked = $(this);

  		if ( checked.is(':checked') ) {
  			$('.stammtisch').fadeIn('slow');
  		}
  		else {
  			$('.stammtisch').fadeOut('slow');
  		}
	});

	$('#presseCheck').click(function() {
  		checked = $(this);

  		if ( checked.is(':checked') ) {
  			$('.pm').fadeIn('slow');
  		}
  		else {
  			$('.pm').fadeOut('slow');
  		}
	});

	$('#vorstandCheck').click(function() {
  		checked = $(this);

  		if ( checked.is(':checked') ) {
  			$('.vorstand').fadeIn('slow');
  		}
  		else {
  			$('.vorstand').fadeOut('slow');
  		}
	});

	$('#sonstigesCheck').click(function() {
  		checked = $(this);

  		if ( checked.is(':checked') ) {
  			$('.sonstiges').fadeIn('slow');

  		}
  		else {
  			$('.sonstiges').fadeOut('slow');
  		}
	});

	$('#versammlungCheck').click(function() {
  		checked = $(this);

  		if ( checked.is(':checked') ) {
  			$('.mitglieder_versammlung').fadeIn('slow');
  			
  		}
  		else {
  			$('.mitglieder_versammlung').fadeOut('slow');
  		}
	});

});