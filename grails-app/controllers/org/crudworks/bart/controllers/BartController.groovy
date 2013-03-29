package org.crudworks.bart.controllers

import org.crudworks.bart.services.FareLookupService
import org.crudworks.bart.services.StationNameLookupService

class BartController {

    def index = {
        def fareDetails
        def fromStationName
        def toStationName

        if (params?.fromStation != null) {
            fareDetails = new FareLookupService().lookupFare(params.fromStation, params.toStation)
            fromStationName = new StationNameLookupService().lookupStationName(params.fromStation)
            toStationName = new StationNameLookupService().lookupStationName(params.toStation)
        }

        [ stations : grailsApplication.config?.bartEtds.station,
          updatedTime: grailsApplication.config?.bartEtds.time,
          trainsInService: grailsApplication.config?.bartTrainsInService,
          advisories: grailsApplication.config?.bartAdvisories,
          fareDetails: fareDetails,
          toStationName: toStationName,
          fromStationName: fromStationName,
          news: grailsApplication.config?.bartTweets
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
}
