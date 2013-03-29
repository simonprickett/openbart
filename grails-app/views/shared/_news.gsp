<%
    def dateFormattingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.DateFormattingService').newInstance()
    def tweetFormattingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.TweetFormattingService').newInstance()
%>
<g:each in="${news.status}" var="tweet">
  <p>${dateFormattingService.formatDate(tweet.created_at.toString())}:<br/>${tweetFormattingService.formatTweet(tweet.text.toString())}</p>
</g:each>
