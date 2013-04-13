package org.crudworks.bart.services

import org.codehaus.groovy.grails.commons.*

class FareLookupService {

    static transactional = false

    def lookupFare(String fromStation, String toStation) {
        if (! fromStation.equals(toStation)) {
            def feedXmlStr = "http://api.bart.gov/api/sched.aspx?cmd=depart&orig=${fromStation}&dest=${toStation}&time=9:00am&b=0&a=1&key=${ConfigurationHolder.config.bartKey}".toURL().text
            new XmlSlurper().parseText(feedXmlStr)
        }
    }
    
    def getEmissions(String emissionsFromBart) {
        String emissions = emissionsFromBart.substring(emissionsFromBart.indexOf("<strong>") + 8).trim()
        emissions = emissions.substring(0, emissions.indexOf(" pounds"))
        return emissions
    }
}
