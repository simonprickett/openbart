// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        bartKey = "MW9S-E7SL-26DU-VV8V"
        grails.serverURL = "http://bart.crudworks.org"
    }
    development {
        bartKey = "MW9S-E7SL-26DU-VV8V"
        grails.serverURL = "http://localhost:8080/${appName}"
    }
    test {
        bartKey = "MW9S-E7SL-26DU-VV8V"
        grails.serverURL = "http://localhost:8080/${appName}"
    }

}

stationFourSquareMap = [:]
stationFourSquareMap["12TH"] = "468eecfdf964a5208f481fe3"
stationFourSquareMap["16TH"] = "4abff08bf964a520219320e3"
stationFourSquareMap["19TH"] = "468eecd5f964a5208e481fe3"
stationFourSquareMap["24TH"] = "4813bd9cf964a520424f1fe3"		
stationFourSquareMap["ASHB"] = "4813c2d1f964a5204a4f1fe3"
stationFourSquareMap["BALB"] = "455f7a06f964a520933d1fe3"
stationFourSquareMap["BAYF"] = "4813c537f964a5204f4f1fe3"
stationFourSquareMap["CAST"] = "4813b6c2f964a520404f1fe3"
stationFourSquareMap["CIVC"] = "4813bc50f964a520414f1fe3"
stationFourSquareMap["COLS"] = "4813c3cbf964a5204d4f1fe3"
stationFourSquareMap["COLM"] = "4ab46555f964a5201c7120e3"
stationFourSquareMap["CONC"] = "468ee7baf964a5208b481fe3"
stationFourSquareMap["DALY"] = "47fe1d03f964a520e54e1fe3"
stationFourSquareMap["DBRK"] = "4813c27cf964a520494f1fe3"
stationFourSquareMap["DUBL"] = "4813b667f964a5203f4f1fe3"
stationFourSquareMap["DELN"] = "4813c125f964a520464f1fe3"
stationFourSquareMap["PLZA"] = "4813c1bcf964a520474f1fe3"
stationFourSquareMap["EMBR"] = "468eed97f964a52091481fe3"
stationFourSquareMap["FRMT"] = "4813c66bf964a520534f1fe3"
stationFourSquareMap["FTVL"] = "4813c378f964a5204c4f1fe3"
stationFourSquareMap["GLEN"] = "463b2d04f964a52021461fe3"
stationFourSquareMap["HAYW"] = "4813c5a2f964a520504f1fe3"
stationFourSquareMap["LAFY"] = "415f4100f964a5205a1d1fe3"
stationFourSquareMap["LAKE"] = "4813c340f964a5204b4f1fe3"
stationFourSquareMap["MCAR"] = "468eec84f964a5208d481fe3"
stationFourSquareMap["MLBR"] = "468ef104f964a52092481fe3"
stationFourSquareMap["MONT"] = "455f77abf964a520903d1fe3"
stationFourSquareMap["NBRK"] = "4813c23ff964a520484f1fe3"
stationFourSquareMap["NCON"] = "468ee77af964a5208a481fe3"
stationFourSquareMap["ORIN"] = "468ee5b5f964a52088481fe3"
stationFourSquareMap["PITT"] = "468ee656f964a52089481fe3"
stationFourSquareMap["PHIL"] = "4697972cf964a520e7481fe3"
stationFourSquareMap["POWL"] = "455f7871f964a520913d1fe3"
stationFourSquareMap["RICH"] = "4813c0d5f964a520454f1fe3"
stationFourSquareMap["ROCK"] = "46478dbbf964a52099461fe3"
stationFourSquareMap["SBRN"] = "4813c047f964a520444f1fe3"
stationFourSquareMap["SFIA"] = "468ef191f964a52093481fe3"
stationFourSquareMap["SANL"] = "4813c4f3f964a5204e4f1fe3"
stationFourSquareMap["SHAY"] = "4813c605f964a520514f1fe3"
stationFourSquareMap["SSAN"] = "4813bfb0f964a520434f1fe3"
stationFourSquareMap["UCTY"] = "4813c63ef964a520524f1fe3"
stationFourSquareMap["WCRK"] = "468eea22f964a5208c481fe3"
stationFourSquareMap["WDUB"] = "4d239f7dbda95941fde4bf7d"
stationFourSquareMap["WOAK"] = "468eed4bf964a52090481fe3"

stationFourSquareTips = [:]

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'

    warn   'org.mortbay.log'
}
