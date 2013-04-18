package org.crudworks.bart.services

import org.codehaus.groovy.grails.commons.*

class StationLatLongService {
    
    static transactional = false;

    def getStationLatLong(String abbr) {
        def stationDetails = ConfigurationHolder.config?.bartStationDetails."${abbr}"   
        return "{abbr: \"${stationDetails.stations.station.abbr}\", stnName: \"${stationDetails.stations.station.name}\", lat: ${stationDetails.stations.station.gtfs_latitude}, lon: ${stationDetails.stations.station.gtfs_longitude}}"
    }
}
