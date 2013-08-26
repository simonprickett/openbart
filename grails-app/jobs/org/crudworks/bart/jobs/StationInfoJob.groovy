package org.crudworks.bart.jobs

import org.codehaus.groovy.grails.commons.*
import groovy.json.JsonSlurper

class StationInfoJob {
    static triggers = {
        simple name:'bartStationInfo', startDelay: 0, repeatInterval: 600000, repeatCount: -1
    }

    def execute() {
        def stationListXmlStr = "http://api.bart.gov/api/stn.aspx?cmd=stns&key=${ConfigurationHolder.config.bartKey}".toURL().text
        def stationListXml = new XmlSlurper().parseText(stationListXmlStr)
        def stationLookupMap = [:]
        
        stationListXml.stations.station.each {
            def stationDetailXmlStr = "http://api.bart.gov/api/stn.aspx?cmd=stninfo&orig=${it.abbr}&key=${ConfigurationHolder.config.bartKey}".toURL().text
            def stationDetailXml = new XmlSlurper().parseText(stationDetailXmlStr)
            ConfigurationHolder.config.bartStationDetails."${it.abbr}" = stationDetailXml
            stationLookupMap["${it.abbr}"] = it.name
            def stationFourSquareTipsStr = "https://api.foursquare.com/v2/venues/${ConfigurationHolder.config.stationFourSquareMap.get(it.abbr.toString())}/tips?client_id=2KYIZBD1SVVOYP3DG4U4ATQ3JRESOU25M3L1NNDEKFZT5TCS&client_secret=KAZTDUDD4JJ5F430XXE5VVXOJG2L5LDQS5D11NTILU5DVB1R&limit=3".toURL().text
            def stationFourSquareTipsJSON = new JsonSlurper().parseText(stationFourSquareTipsStr)
            ConfigurationHolder.config.stationFourSquareTips["${it.abbr}"] = stationFourSquareTipsJSON
        }
        
        ConfigurationHolder.config.bartStationLookup = stationLookupMap
        //println "Station Info Job completed"
    }
}

