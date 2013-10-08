<!DOCTYPE html>
<html lang="en-US">
  <head>
    <g:render template="/shared/metadata"/>
    <g:render template="/shared/cssjavascript"/>
    <link rel="stylesheet" href="css/stylesheet.css" />
    <title>BART: About</title>
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
        <h2>About</h2>
        <p>This web application allows users to view the status of the San Francisco BART train system, find stations and read news from BART.</p>
        <p>It was built using JQuery Mobile, with a Groovy on Grails server backend hosted on Amazon EC2.</p>
        <p>This application was developed by Simon Prickett, mobile device strategy and implementation specialist - tweet me using the link in the footer, I'd love to hear from you.</p>
        <p>I plan to update this application with new functionality, and display additional information as I have time.</p>
        <p>If you want to work with this application yourself, or just study how it works, you can <a href="https://github.com/simonprickett/openbart" rel="external">fork it from github</a>.</p>
        <ul data-role="listview" data-inset="true">
          <li data-role="list-divider">Updated 10/7/2013</li>
          <li>Added Clipper card fares as BART API now supports these</li>
          <li data-role="list-divider">Updates 10/2/2013</li>
          <li>Re-introduced news section as embedded Twitter timeline</li>
          <li data-role="list-divider">Updates 8/18/2013</li>
          <li>Migrated to Grails 2.2.4</li>
          <li>Added JSON API</li>
          <li data-role="list-divider">Updates 5/1/2013</li>
          <li>Cleaned up URL structure</li>
          <li>Replaced tab menu with open out panel menu</li>
          <li data-role="list-divider">Updates 4/18/2013</li>
          <li>Added GPS local station finder on home page</li>
          <li>Added meta data and page titles to pages</li>
          <li data-role="list-divider">Updates 4/12/2013</li>
          <li>Added no bikes allowed indicator on train departure times</li>
          <li>Added carbon emissions saved data to ticket pricing page</li>
          <li>Added updates information to about page</li>
        </ul>
      </div>
      <g:render template="/shared/footer"/>
      <g:render template="/shared/panelmenu"/>
    </div>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>
