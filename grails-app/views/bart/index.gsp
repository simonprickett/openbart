<!DOCTYPE html>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <link rel="stylesheet" href="css/stylesheet.css" />
    <script src="js/bart.js"></script>
    <title>BART: Home</title>
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
        <g:render template="/shared/systemStatus"/>
          <h2>BART Departures</h2>
          <div id="closeststation">
            <ul data-role="listview" data-inset="true" id="closeststationlist">
            </ul>
          </div>
          <g:render template="/shared/selectStation" />
          <p>&nbsp;</p>
        </div>
        <g:render template="/shared/footer"/>
        <g:render template="/shared/panelmenu"/>
    </div>
        <g:render template="/shared/gps" model="[stations:stations]"/>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>