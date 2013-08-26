package org.crudworks.bart.jobs

import org.codehaus.groovy.grails.commons.*

class AdvisoriesJob {
    static triggers = {
        simple name:'bartAdvisories', startDelay: 0, repeatInterval: 1200000, repeatCount: -1
    }

    def execute() {
        def feedXmlStr = "http://api.bart.gov/api/bsa.aspx?cmd=bsa&key=${ConfigurationHolder.config.bartKey}".toURL().text
        def feedXml = new XmlSlurper().parseText(feedXmlStr)
        ConfigurationHolder.config.bartAdvisories = feedXml
        //println "Advisories job completed"
    }
}



