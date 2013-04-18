<!DOCTYPE html>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <script src="js/bart.js"></script>
    <title>BART<g:if test="${!params.tab}">: Home</g:if><g:if test="${params?.tab == 'news'}">: News</g:if><g:if test="${params?.tab == 'tickets'}">: Tickets</g:if></title>
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
          <div id="closeststation">
            <ul data-role="listview" data-inset="true" id="closeststationlist">
            </ul>
          </div>
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
    <g:render template="/shared/gps" model="[stations:stations]"/>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>