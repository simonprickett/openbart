<!DOCTYPE html>
<html>
  <head>
    <title>BART</title>
  </head>
  <body>
      <g:render template="/shared/header"/>
      <h1>BART</h1>
      <g:render template="/shared/systemStatus"/>
      <g:render template="/shared/globalnav"/>
      <g:if test="${params?.tab == 'tickets'}">
        <g:if test="${params?.fromStation != null}">
          <g:render template="/shared/ticketInfo" />
        </g:if>
        <g:else>
          <g:render template="/shared/selectStations" />
        </g:else>
      </g:if>
      <g:if test="${params?.tab == 'news'}">
        <g:render template="/shared/news" />
      </g:if>
      <g:if test="${!params.tab}">
        <g:render template="/shared/selectStation" />
      </g:if>
      <g:if test="${params?.tab == 'tickets'}">
        <p><a href="home?tab=tickets">Start over...</a>
      </g:if>
      <g:else>
        <p>&nbsp;</p>
      </g:else>
  </body>
</html>