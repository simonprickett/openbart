<!DOCTYPE html>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <link rel="stylesheet" href="css/stylesheet.css" />
    <title>BART: Tickets</title>
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
          <g:if test="${params?.fromStation != null}">
            <g:render template="/shared/ticketInfo" />
          </g:if>
          <g:else>
            <h2>BART Tickets</h2>
            <g:render template="/shared/selectStations" />
            <br/>
          </g:else>
          <a href="tickets" data-role="button" data-icon="refresh" data-theme="b">Start Over</a>
      </div>
      <g:render template="/shared/footer"/>
      <g:render template="/shared/panelmenu"/>
    </div>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>