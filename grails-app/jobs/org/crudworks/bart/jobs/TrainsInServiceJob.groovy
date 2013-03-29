package org.crudworks.bart.jobs

import org.codehaus.groovy.grails.commons.*

class TrainsInServiceJob {
    static triggers = {
        simple name:'bartTrainsInService', startDelay: 0, repeatInterval: 600000, repeatCount: -1
    }

    def execute() {
        def feedXmlStr = "http://api.bart.gov/api/bsa.aspx?cmd=count&key=${ConfigurationHolder.config.bartKey}".toURL().text
        def feedXml = new XmlSlurper().parseText(feedXmlStr)
        ConfigurationHolder.config.bartTrainsInService = feedXml.traincount
        //println "Trains in service feed updated."
    }
}

