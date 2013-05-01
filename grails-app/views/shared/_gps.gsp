<%
    def stationLatLongService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.StationLatLongService').newInstance()
%>
<script type="text/javascript">
  <!-- this should be wrapped in a function and put somewhere sensible like with the analytics -->
  navigator.geolocation.getCurrentPosition(function (location) {
    $.mobile.showPageLoadingMsg();
    var nearest = getNearestStation(location.coords.latitude, location.coords.longitude);
    $('#closeststationlist').append('<li data-role="list-divider">Closest Station (' + nearest.distance.toFixed(1) + ' miles)</li>');
    $('#closeststationlist').append('<li data-theme="e"><a href="departures/' + nearest.station.abbr + '">' + nearest.station.stnName + '</a></li>');
    $('#closeststationlist').listview('refresh');
    $.mobile.hidePageLoadingMsg();
  });

  if (typeof(Number.prototype.toRad) === "undefined") {
    Number.prototype.toRad = function() {
      return this * Math.PI / 180;
    }
  }

  function getNearestStation(latUser, lonUser) {
    var closestStation = "";
    var closestDistance = 999999;
    var stations = {};

    <!-- this should not be generated each page inefficient make it happen once in a job and live in config -->
    <g:each in="${stations}" var="station">
      <g:set var="stationInfo" value="${grailsApplication.config?.bartStationDetails.'${station.abbr}'}"/>
      stations["${station.abbr}"] = ${stationLatLongService.getStationLatLong(station.abbr.toString())};
    </g:each>

    for (var stn in stations) {
        var thisDistance = getDistance(latUser, lonUser, stations[stn].lat, stations[stn].lon);
        if (thisDistance < closestDistance) {
          closestDistance = thisDistance;
          closestStation = stn;
        }
    }

    return({station: stations[closestStation], distance: closestDistance});
  }
</script>