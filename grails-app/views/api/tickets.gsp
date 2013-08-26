<%@ page contentType="application/json" %>
<%
    def stationNameLookupService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.StationNameLookupService').newInstance()
%>
{"fromStation": "${fromStationName}", "toStation": "${toStationName}", "fare": "${fareDetails.schedule.request.trip.@fare}", "emissions": "${emissions}", "legs": [ <g:each in="${fareDetails.schedule.request.trip.leg}" status="status" var="leg">"At ${stationNameLookupService.lookupStationName(leg.@origin.toString())} board train to ${stationNameLookupService.lookupStationName(leg.@trainHeadStation.toString())} <g:if test="${leg.@transfercode == ''}">alight</g:if><g:else>change</g:else> at ${stationNameLookupService.lookupStationName(leg.@destination.toString())}."<g:if test="${status != fareDetails.schedule.request.trip.leg.size() -1}">,</g:if></g:each>]}
