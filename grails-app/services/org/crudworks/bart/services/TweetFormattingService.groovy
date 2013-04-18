package org.crudworks.bart.services

class TweetFormattingService {
    def formatTweet(String tweetToFormat) {
       // needs to account for https links
       int linkStartPos = tweetToFormat.indexOf("http://")
       if (linkStartPos != -1) {
           String linkText = ""
           int linkEndPos = tweetToFormat.indexOf(" ", linkStartPos)
           if (linkEndPos != -1) {
               // needs to account for links ending in .
               linkText = tweetToFormat.substring(linkStartPos, linkEndPos)
           } else {
               // needs to account for links ending in .
               linkText = tweetToFormat.substring(linkStartPos)
           }
           
            String formattedTweet = "<a href=\"" + linkText + "\" rel=\"external\">" + tweetToFormat + "</a>"
            return formattedTweet
       } else {
           return tweetToFormat
       }
    }
    
    def getLinkFromTweet(String tweetToFormat) {
        // needs to account for https links
        int linkStartPos = tweetToFormat.indexOf("http://")
        if (linkStartPos != -1) {
            String linkText = ""
            int linkEndPos = tweetToFormat.indexOf(" ", linkStartPos)
            if (linkEndPos != -1) {
                // needs to account for links ending in .
                return tweetToFormat.substring(linkStartPos, linkEndPos)
            } else {
                // needs to account for links ending in .
                return tweetToFormat.substring(linkStartPos)
            }
        } else {
            return ""
        }
    }
}
