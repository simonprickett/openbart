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
          <a class="twitter-timeline" href="https://twitter.com/SFBART" data-widget-id="380183077399437313">Tweets by @SFBART</a>
          <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        <a href="home" data-role="button" data-icon="home" data-theme="b">Home</a>
      </div> <!-- content -->
      <g:render template="/shared/footer"/>
      <g:render template="/shared/panelmenu"/>
    </div> <!-- page -->
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>
