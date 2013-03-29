<p>Longitude: ${stationDetails.stations.station.gtfs_longitude}</p>
<p>Latitude: ${stationDetails.stations.station.gtfs_latitude}</p>
<p>${stationDetails.stations.station.address}<br/>${stationDetails.stations.station.city} ${stationDetails.stations.station.state}, ${stationDetails.stations.station.zipcode}</p>
<p>${stationDetails.stations.station.intro}</p>
<ul>
  <li><a href="home?tab=tickets&to=${params.station}">Tickets to this station</a></li>
  <li><a href="home?tab=tickets&from=${params.station}">Tickets from this station</a></li>
</ul>
<h2>FourSquare Tips:</h2>
<g:set var="tipCount" value="${0}" />
<g:each in="${stationTips.response.tips.items}" var="tip">
  <g:if test="${tipCount < 3}">
      <img src="${tip.user.photo}" alt="Photo" />
      <p>${tip.text} - ${tip.user.firstName} ${tip.user.lastName} (${tip.user.homeCity})</p>
  </g:if>
  <% tipCount++; %>
</g:each> 