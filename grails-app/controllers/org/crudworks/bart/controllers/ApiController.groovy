package org.crudworks.bart.controllers

import org.crudworks.bart.services.FareLookupService
import org.crudworks.bart.services.StationNameLookupService

class ApiController {    
    def index = {
        // no code needed for now
    }
    
    def stations = {
        [ stations: grailsApplication.config?.bartStationLookup,
          stationDetails: grailsApplication.config?.bartStationDetails,
          fourSquareVenues: grailsApplication.config?.stationFourSquareMap,
          callback: params?.callback
        ]
    }
    
    def status = {
        [updatedTime: grailsApplication.config?.bartEtds.time,
         trainsInService: grailsApplication.config?.bartTrainsInService,
         advisories: grailsApplication.config?.bartAdvisories,
         callback: params?.callback
        ]
    }
    
    def tickets = {
        def fareDetails
        def fromStationName
        def toStationName
        def emissions

        if (params?.fromStation != null) {
            fareDetails = new FareLookupService().lookupFare(params.fromStation, params.toStation)
            fromStationName = new StationNameLookupService().lookupStationName(params.fromStation)
            toStationName = new StationNameLookupService().lookupStationName(params.toStation)
            emissions = new FareLookupService().getEmissions(fareDetails.message.co2_emissions.toString())
        }     
        
        [ stations: grailsApplication.config?.bartEtds.station,
          fareDetails: fareDetails,
          fromStationName: fromStationName,
          toStationName: toStationName,
          emissions: emissions,
          callback: params?.callback
        ]    
    }
    
    def station = {
        [ stationDetails: grailsApplication.config?.bartStationDetails."${params.station}",
          fourSquareVenues: grailsApplication.config?.stationFourSquareMap,
          callback: params?.callback
        ]
    }
    
    def departures = {
        [ stations: grailsApplication.config?.bartEtds.station,
          callback: params?.callback
        ]
    }
    
    def news = {
        render "<p>Not implemented yet: this would be the news</p>"
    }
}

