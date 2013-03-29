<!DOCTYPE html>
<html>
  <head>
    <title>BART</title>
  </head>
  <body>
    <g:render template="/shared/header"/>
    <g:each in="${stations}" var="station">
      <g:if test="${station.abbr == params.station}">    
        <h1>${station.name}</h1>
        <g:render template="/shared/systemStatus"/>
        <g:render template="/shared/globalnav"/>
        <g:if test="${params?.tab == 'info'}">
          <g:render template="/shared/stationInfo"/>
        </g:if>
        <g:else>
          <g:render template="/shared/departures" model="[station:station]"/>
        </g:else>
      </g:if>
    </g:each>
    <p><a href="home">Home...</a></p>
  </body>
</html>
