<!DOCTYPE html>
<%
    def stationLatLongService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.StationLatLongService').newInstance()
%>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <title>BART<g:if test="${!params.tab}">: Home</g:if><g:if test="${params?.tab == 'news'}">: News</g:if><g:if test="${params?.tab == 'tickets'}">: Tickets</g:if></title>
  </head>
  <body>
    <div data-role="page">
      <div data-role="header">
        <g:render template="/shared/header"/>
        <g:render template="/shared/globalnav"/>
      </div>
      <div data-role="content">
        <g:if test="${params?.tab != 'info' && params?.tab != 'news' && params?.tab != 'tickets'}">
          <g:render template="/shared/systemStatus"/>
        </g:if>
        <g:if test="${params?.tab == 'tickets'}">
          <g:if test="${params?.fromStation != null}">
            <g:render template="/shared/ticketInfo" />
          </g:if>
          <g:else>
            <h2>BART Tickets</h2>
            <g:render template="/shared/selectStations" />
          </g:else>
        </g:if>
        <g:if test="${params?.tab == 'news'}">
          <g:render template="/shared/news" />
        </g:if>
        <g:if test="${!params.tab}">
          <h2>BART Departures</h2>
          <div id="closeststation">
            <ul data-role="listview" data-inset="true" id="closeststationlist">
            </ul>
          </div>
          <g:render template="/shared/selectStation" />
        </g:if>
        <g:if test="${params?.tab == 'tickets'}">
          <br/>
          <a href="home?tab=tickets" data-role="button" data-icon="refresh" data-theme="b">Start Over</a>
        </g:if>
        <g:else>
          <p>&nbsp;</p>
        </g:else>
        </div>
        <g:render template="/shared/footer"/>
    </div>
    <script type="text/javascript">
      navigator.geolocation.getCurrentPosition(function (location) {
        $.mobile.showPageLoadingMsg();
        var nearest = getNearestStation(location.coords.latitude, location.coords.longitude);
        $('#closeststationlist').append('<li data-role="list-divider">Closest Station (' + nearest.distance.toFixed(1) + ' miles)</li>');
        $('#closeststationlist').append('<li data-theme="e"><a href="departures?station=' + nearest.station.abbr + '">' + nearest.station.stnName + '</a></li>');
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
      
      function getDistance(latUser, lonUser, latStation, lonStation) {
        var R = 6371;
        var dLat = (latStation - latUser).toRad();
        var dLon = (lonStation - lonUser).toRad();
        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(latStation.toRad()) * Math.cos(latUser.toRad()) *
                Math.sin(dLon / 2) * Math.sin(dLon / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var d = R * c;
        return d;
      };
    </script>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>