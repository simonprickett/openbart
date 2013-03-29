package org.crudworks.bart.services

class TweetFormattingService {

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
}
