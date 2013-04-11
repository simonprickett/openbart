<%
    def stationNameLookupService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.StationNameLookupService').newInstance()
%>
<g:if test="${params.fromStation == params.toStation}">
  <p>Please try again. From and to stations must not be the same!</p>
  <g:render template="/shared/selectStations"/>
</g:if>
<g:else>
  <h2>Trip Information</h2>
  <p>${fromStationName} to ${toStationName}:</p>
  <ul data-role="listview" data-inset="true">
    <li data-role="list-divider">Ticket Price</li>
    <li>One way: &#36;${fareDetails.schedule.request.trip.@fare}.</li>  
  </ul>
  <ol data-role="listview" data-inset="true">
    <li data-role="list-divider">Trip Details</li>
    <g:each in="${fareDetails.schedule.request.trip.leg}" var="leg">
      <li>At ${stationNameLookupService.lookupStationName(leg.@origin.toString())} board train to ${stationNameLookupService.lookupStationName(leg.@trainHeadStation.toString())} <g:if test="${leg.@transfercode == ''}">alight</g:if><g:else>change</g:else> at ${stationNameLookupService.lookupStationName(leg.@destination.toString())}.</li>
    </g:each>
  </ol>
  <ul data-role="listview" data-inset="true">
    <li><a href="departures?station=${params.fromStation}&tab=info" rel="external">${fromStationName} Info</a</li>
    <li><a href="departures?station=${params.toStation}&tab=info" rel="external">${toStationName} Info</a></li>
  </ul>
</g:else>
