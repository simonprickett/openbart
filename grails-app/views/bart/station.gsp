<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
    <title>BART</title>
  </head>
  <body>
    <div data-role="page" <g:if test="params?.tab == 'info'">id="station${params.station}"</g:if>>
      <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBhaV67nxP-g81aVR-D7Jw43PNI1KX4X8E&sensor=false">
      </script>
      <div data-role="header">
      <g:render template="/shared/header"/>
      <g:each in="${stations}" var="station">
        <g:if test="${station.abbr == params.station}">    
          <g:render template="/shared/globalnav"/>
          </div>
          <div data-role="content">
            <g:if test="${params?.tab != 'info'}">
              <g:render template="/shared/systemStatus"/>
            </g:if>
          <h2>${station.name}</h2>
          <g:if test="${params?.tab == 'info'}">
            <g:render template="/shared/stationInfo"/>
          </g:if>
          <g:else>
            <g:render template="/shared/departures" model="[station:station]"/>
          </g:else>
        </g:if>
      </g:each>
      <a href="home" data-role="button" data-icon="home" data-theme="b">Home</a>
      </div>
      <g:render template="/shared/footer"/>
    </div>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>
