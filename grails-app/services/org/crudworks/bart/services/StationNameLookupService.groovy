package org.crudworks.bart.services

import org.codehaus.groovy.grails.commons.*

class StationNameLookupService {

    static transactional = false

    /* TODO: Check if this is obsolete... */
    def lookupStationName(String abbr) {
        ConfigurationHolder.config.bartStationLookup.get(abbr)
    }
}
