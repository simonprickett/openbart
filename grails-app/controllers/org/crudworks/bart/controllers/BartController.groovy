package org.crudworks.bart.controllers

import org.crudworks.bart.services.FareLookupService
import org.crudworks.bart.services.StationNameLookupService

class BartController {

    def index = {       
        [ stations : grailsApplication.config?.bartEtds.station,
          updatedTime: grailsApplication.config?.bartEtds.time,
          trainsInService: grailsApplication.config?.bartTrainsInService,
          advisories: grailsApplication.config?.bartAdvisories
        ]
    }
    
    def departures = {
        [ stations: grailsApplication.config?.bartEtds.station,
          stationDetails: grailsApplication.config?.bartStationDetails."${params.station}",
          updatedTime: grailsApplication.config?.bartEtds.time,
          trainsInService: grailsApplication.config?.bartTrainsInService,
          advisories: grailsApplication.config?.bartAdvisories
        ]
    }
    
    def news = {
       [ news: grailsApplication.config?.bartTweets ] 
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
          emissions: emissions
        ]
    }

    def station = {   
        [ stations: grailsApplication.config?.bartEtds.station,
          updatedTime: grailsApplication.config?.bartEtds.time,
          trainsInService: grailsApplication.config?.bartTrainsInService,
          advisories: grailsApplication.config?.bartAdvisories,
          stationDetails: grailsApplication.config?.bartStationDetails."${params.station}",
          stationTips: grailsApplication.config?.stationFourSquareTips.get(params.station.toString())
        ]
    }
  
    def about = {
        // no code needed for now
    }
}
