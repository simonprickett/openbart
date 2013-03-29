package org.crudworks.bart.services

import java.text.SimpleDateFormat;

class DateFormattingService {

    static transactional = false
    static String inputDateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
    static String outputDateFormat = "EEE MMM dd"
    
    def formatDate(String dateToFormat) {
        Date d = new SimpleDateFormat(inputDateFormat).parse(dateToFormat)
        new SimpleDateFormat(outputDateFormat).format(d)
    }
}
