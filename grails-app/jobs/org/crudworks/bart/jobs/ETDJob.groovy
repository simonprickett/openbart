package org.crudworks.bart.jobs

import org.codehaus.groovy.grails.commons.*

class ETDJob {
    static triggers = {
        simple name:'bartEtd', startDelay: 0, repeatInterval: 60000, repeatCount: -1
    }

    def execute() {
        def feedXmlStr = "http://api.bart.gov/api/etd.aspx?cmd=etd&orig=ALL&key=${ConfigurationHolder.config.bartKey}".toURL().text
        def feedXml = new XmlSlurper().parseText(feedXmlStr)
        ConfigurationHolder.config.bartEtds = feedXml
        //println "ETD Job Completed"
    }
}

