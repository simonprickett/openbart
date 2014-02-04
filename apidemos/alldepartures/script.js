var myApp = {
	getDeparturesForStation: function(abbr) {
		var departuresDiv = document.getElementById(abbr + '-departures');
		departuresDiv.innerHTML = '';
		JSONP.get(
			'http://bart.crudworks.org/api/departures/' + abbr,
			{},
			function(departures) {
				var htmlStr = '';
				for (var dest in departures) {
					htmlStr += ('<h3>' + departures[dest].destination + ': Platform ' + departures[dest].departures[0].platform + '</h3><ul>');
					for (var n = 0; n < departures[dest].departures.length; n++) {
						var departure = departures[dest].departures[n];
						htmlStr += ('<li class="departure ' + departure.color.toLowerCase() + '">' + departure.estimate + ' (' + departure.cars + ' cars)' + '</li>');
					}

					htmlStr += '</ul>';
				}
				
				departuresDiv.innerHTML = htmlStr;
			}
		);
	},

	getStations: function() {
		JSONP.get(
			'http://bart.crudworks.org/api/stations/', 
			{}, 
			function(data) { 
				var stnsDiv = document.getElementById('stations');
				stnsDiv.innerHTML = '';
				for (var stn in data) {
					var stnDiv = document.createElement('div');
					stnDiv.innerHTML = '<h2>' + data[stn].name + '</h2>';
					stnDiv.setAttribute('class', 'station');
					stnDiv.setAttribute('id', data[stn].abbr);
					var departuresDiv = document.createElement('div');
					departuresDiv.setAttribute('class', 'departures');
					departuresDiv.setAttribute('id', data[stn].abbr + '-departures');
					stnDiv.appendChild(departuresDiv);
					stnsDiv.appendChild(stnDiv);
					myApp.getDeparturesForStation(data[stn].abbr);
				}
			}
		);		
	}
}

// The following is run automatically when the page loads
window.onload = function() {
	myApp.getStations();
	setInterval(myApp.getStations, 60000);
};

// Lightweight JSONP from nonobtrusive.com
// http://www.nonobtrusive.com/2010/05/20/lightweight-jsonp-without-any-3rd-party-libraries/

var JSONP = (function(){
	var counter = 0, head, query, key, window = this;
	function load(url) {
		var script = document.createElement('script'),
			done = false;
		script.src = url;
		script.async = true;
 
		script.onload = script.onreadystatechange = function() {
			if ( !done && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") ) {
				done = true;
				script.onload = script.onreadystatechange = null;
				if ( script && script.parentNode ) {
					script.parentNode.removeChild( script );
				}
			}
		};
		if ( !head ) {
			head = document.getElementsByTagName('head')[0];
		}
		head.appendChild( script );
	}
	function jsonp(url, params, callback) {
		query = "?";
		params = params || {};
		for ( key in params ) {
			if ( params.hasOwnProperty(key) ) {
				query += encodeURIComponent(key) + "=" + encodeURIComponent(params[key]) + "&";
			}
		}
		var jsonp = "json" + (++counter);
		window[ jsonp ] = function(data){
			callback(data);
			try {
				delete window[ jsonp ];
			} catch (e) {}
			window[ jsonp ] = null;
		};
 
		load(url + query + "callback=" + jsonp);
		return jsonp;
	}
	return {
		get:jsonp
	};
}());