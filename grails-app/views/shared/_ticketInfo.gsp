<%
    def stationNameLookupService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.StationNameLookupService').newInstance()
%>
<g:if test="${params.fromStation == params.toStation}">
  <p>Please try again. From and to stations must not be the same!</p>
  <g:render template="/shared/selectStations"/>
</g:if>
<g:else>
  <p>${fromStationName} to ${toStationName}:</p>
  <p>One way ticket &#36;${fareDetails.schedule.request.trip.@fare}.</p>
  <ul>
    <g:each in="${fareDetails.schedule.request.trip.leg}" var="leg">
      <li>At ${stationNameLookupService.lookupStationName(leg.@origin.toString())} board train to ${stationNameLookupService.lookupStationName(leg.@trainHeadStation.toString())} <g:if test="${leg.@transfercode == ''}">alight</g:if><g:else>change</g:else> at ${stationNameLookupService.lookupStationName(leg.@destination.toString())}.</li>
    </g:each>
  </ul>
  <p><a href="departures?station=${params.fromStation}&tab=info">${fromStationName} Info</a></p>
  <p><a href="departures?station=${params.toStation}&tab=info">${toStationName} Info</a></p>
</g:else>
