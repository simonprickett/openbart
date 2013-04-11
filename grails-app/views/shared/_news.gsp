<%
    def dateFormattingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.DateFormattingService').newInstance()
    def tweetFormattingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.TweetFormattingService').newInstance()
%>
<h2>BART News</h2>
<ul data-role="listview" data-inset="true">
  <li data-role="list-divider">Latest Tweets</li>
  <g:each in="${news.status}" var="tweet">
    <g:set var="tweetLink" value="${tweetFormattingService.getLinkFromTweet(tweet.text.toString())}"/>
    <li><g:if test="${tweetLink} != ''"><a href="${tweetLink}"></g:if><p class="ui-li-aside">${dateFormattingService.formatDate(tweet.created_at.toString())}</p><div style="white-space: normal">${tweet.text}</div><g:if test="${tweetlink} != ''"></a></g:if>
  </g:each>
</ul>
<a href="home" data-role="button" data-icon="home" data-theme="b">Home</a>
