<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
    <link rel="stylesheet" href="css/stylesheet.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
    <title>BART</title>
  </head>
  <body>
    <div data-role="page">
      <div data-role="header">
        <g:render template="/shared/header"/>
        <g:render template="/shared/globalnav"/>
      </div>
      <div data-role="content">
        <g:if test="${params?.tab != 'info' && params?.tab != 'news' && params?.tab != 'tickets'}">
          <g:render template="/shared/systemStatus"/>
        </g:if>
        <g:if test="${params?.tab == 'tickets'}">
          <g:if test="${params?.fromStation != null}">
            <g:render template="/shared/ticketInfo" />
          </g:if>
          <g:else>
            <h2>BART Tickets</h2>
            <g:render template="/shared/selectStations" />
          </g:else>
        </g:if>
        <g:if test="${params?.tab == 'news'}">
          <g:render template="/shared/news" />
        </g:if>
        <g:if test="${!params.tab}">
          <h2>BART Departures</h2>
          <g:render template="/shared/selectStation" />
        </g:if>
        <g:if test="${params?.tab == 'tickets'}">
          <br/>
          <a href="home?tab=tickets" data-role="button" data-icon="refresh" data-theme="b">Start Over</a>
        </g:if>
        <g:else>
          <p>&nbsp;</p>
        </g:else>
        </div>
        <g:render template="/shared/footer"/>
    </div>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>