<%
    def dateFormattingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.DateFormattingService').newInstance()
    def tweetFormattingService = grailsApplication.classLoader.loadClass('org.crudworks.bart.services.TweetFormattingService').newInstance()
%>
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <link rel="stylesheet" href="css/stylesheet.css" />
    <script src="js/bart.js"></script>
    <title>BART: News</title>
  </head>
  <body>
    <div data-role="page">
      <div data-role="header">
        <div width="100%" class="headerimg">
          <img width="100%" src="images/header.png"/>
        </div>
        <a href="#left-panel" data-icon="bars" data-iconpos="notext">Menu</a>
      </div>
      <div data-role="content">
        <h2>BART News</h2>
        <p>Due to changes in the Twitter API this section is not currently available.</p>
        <p>It will return in a future release with added functionality.</p>
        <!--
        <ul data-role="listview" data-inset="true">
          <li data-role="list-divider">Latest Tweets</li>
          <g:each in="${news.status}" var="tweet">
            <g:set var="tweetLink" value="${tweetFormattingService.getLinkFromTweet(tweet.text.toString())}"/>
            <li><g:if test="${tweetLink} != ''"><a href="${tweetLink}"></g:if><p class="ui-li-aside">${dateFormattingService.formatDate(tweet.created_at.toString())}</p><div style="white-space: normal">${tweet.text}</div><g:if test="${tweetlink} != ''"></a></g:if>
          </g:each>
        </ul>
        -->
        <a href="home" data-role="button" data-icon="home" data-theme="b">Home</a>
      </div> <!-- content -->
      <g:render template="/shared/footer"/>
      <g:render template="/shared/panelmenu"/>
    </div> <!-- page -->
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>
