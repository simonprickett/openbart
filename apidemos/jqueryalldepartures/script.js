var myApp = {
	getDeparturesForStation: function(abbr) {
		$('#' + abbr + '-departures').html('');
		$.ajax({
			url: 'http://bart.crudworks.org/api/departures/' + abbr,
			dataType: 'jsonp',
			contentType: 'application/json',
			success: function(departures) {
				var htmlStr = '';
				for (var dest in departures) {
					htmlStr += ('<h3>' + departures[dest].destination + ': Platform ' + departures[dest].departures[0].platform + '</h3><ul>');
					for (var n = 0; n < departures[dest].departures.length; n++) {
						var departure = departures[dest].departures[n];
						htmlStr += ('<li class="departure ' + departure.color.toLowerCase() + '">' + departure.estimate + ' (' + departure.cars + ' cars)' + '</li>');
					}

					htmlStr += '</ul>';
				}
				
				$('#' + abbr + '-departures').html(htmlStr);
			}
		});
	},

	getStations: function() {
		$.ajax({
			url: 'http://bart.crudworks.org/api/stations/',
			dataType: 'jsonp',
			contentType: 'application/json',
			success: function(data) {
				$('#stations').html('');
				for (var stn in data) {
					$('#stations').append(
						$('<div/>')
							.attr('id', data[stn].abbr)
							.addClass('station')
							.html('<h2>' + data[stn].name + '</h2>')
							.append(
								$('<div/>')
									.attr('id', data[stn].abbr + '-departures')
									.addClass('departures')
							)
					);

					myApp.getDeparturesForStation(data[stn].abbr);
				}
			}
		});
	}
}

// The following is run automatically when the page loads
window.onload = function() {
	myApp.getStations();
	setInterval(myApp.getStations, 60000);
};