package org.crudworks.bart.services

class JSONEncodingService {
    
    def encodeString(String stringToEncode) {
        stringToEncode.replaceAll("\"", "\\\\u0022").replaceAll("\n", "");
    }
}