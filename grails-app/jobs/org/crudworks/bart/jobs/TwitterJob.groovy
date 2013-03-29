package org.crudworks.bart.jobs

import org.codehaus.groovy.grails.commons.*

class TwitterJob {
    static triggers = {
        simple name:'bartTwitter', startDelay: 0, repeatInterval: 1200000, repeatCount: -1
    }

    def execute() {
        def feedXmlStr = "http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=sfbart".toURL().text
        def feedXml = new XmlSlurper().parseText(feedXmlStr)
        ConfigurationHolder.config.bartTweets = feedXml
        //println "Twitter Feed updated."
    }
}

  