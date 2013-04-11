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
/*    
    def formatTweet(String tweetToFormat) {
        int linkStartPos = tweetToFormat.indexOf("http://")
        if (linkStartPos != -1) {
            String linkText = ""
            int linkEndPos = tweetToFormat.indexOf(" ", linkStartPos)
            if (linkEndPos != -1) {
                linkText = tweetToFormat.substring(linkStartPos, linkEndPos)
            } else {
                linkText = tweetToFormat.substring(linkStartPos)
            }
            
            String formattedTweet = tweetToFormat.substring(0, linkStartPos) + "<a href=\"" + linkText + "\">" + linkText + "</a>"
            if (linkEndPos != -1) {
                formattedTweet = formattedTweet + tweetToFormat.substring(linkEndPos)
            }
            return formattedTweet
        } else {
            return tweetToFormat
        }
    }
*/
}
