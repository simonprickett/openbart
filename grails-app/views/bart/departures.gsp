<!DOCTYPE html>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <link rel="stylesheet" href="../css/stylesheet.css" />
    <title>BART: ${stationDetails.stations.station.name}</title>
  </head>
  <body>
    <div data-role="page">
      <div data-role="header">
        <div width="100%" class="headerimg">
          <img width="100%" src="../images/header.png"/>
        </div>
      <g:each in="${stations}" var="station">
        <g:if test="${station.abbr == params.station}">    
          <a href="#left-panel" data-icon="bars" data-iconpos="notext">Menu</a>
          </div>
          <div data-role="content">
            <g:render template="/shared/systemStatus"/>
          <h2>${station.name}</h2>
            <g:render template="/shared/departures" model="[station:station]"/>
        </g:if>
      </g:each>
      <a href="home" data-role="button" data-icon="home" data-theme="b">Home</a>
      </div>
      <g:render template="/shared/footer"/>
      <g:render template="/shared/panelmenu"/>
    </div>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>