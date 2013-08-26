<%@ page contentType="application/json" %>
<%
    def jsonEncodingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.JSONEncodingService').newInstance()
%>
{"abbr": "${stationDetails.stations.station.abbr}","name": "${stationDetails.stations.station.name}","foursquareid": "${fourSquareVenues.get(stationDetails.stations.station.abbr.toString())}", "latitude": "${stationDetails.stations.station.gtfs_latitude}","longitude": "${stationDetails.stations.station.gtfs_longitude}","address": "${stationDetails.stations.station.address}","city": "${stationDetails.stations.station.city}","state": "${stationDetails.stations.station.state}","zipcode": "${stationDetails.stations.station.zipcode}","description": "${jsonEncodingService.encodeString(stationDetails.stations.station.intro.toString())}"}