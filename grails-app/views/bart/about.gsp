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
        <h2>About</h2>
        <p>This web application allows users to view the status of the San Francisco BART train system, find stations and read news from BART.</p>
        <p>It was built using JQuery Mobile, with a Groovy on Grails server backend hosted on Amazon EC2.</p>
        <p>This application was developed by Simon Prickett, mobile device strategy and implementation specialist - tweet me using the link in the footer, I'd love to hear from you.</p>
        <p>I plan to update this application with new functionality, my next priority is a GPS local station finder.</p>
      </div>
      <g:render template="/shared/footer"/>
    </div>
    <g:render template="/shared/googleanalytics"/>
  </body>
</html>
