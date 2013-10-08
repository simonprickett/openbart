<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BART JSON API Wrapper</title>
  </head>
  <body>
    <h1>BART JSON API Wrapper</h1>
    <h2>Purpose</h2>
    <p>This is a basic JSON wrapper around the XML BART API.</p>
    <p>I built this for my own purposes and data could change at any time.  If you find it useful, please let me know.</p>
    <p>There is no uptime or accuracy guarantee associated with this data, train departures should update every minute throughout the day.</p>
    <p>When the BART system isn't running you may see inaccurate or missing data.  This will be addressed in future.</p>
    <h2>Change Log</h2>
    <ul>
      <li>7 October 2013: Added Clipper card pricing to fare calculator.</li>
      <li>28 August 2013: Added pretty printing of code to this page.</li>
      <li>26 August 2013: Added JSONP support, example status with a system advisory.</li>
      <li>18 August 2013: Initial release.</li>
    </ul>
    <h2>Examples</h2>
    <p>The following illustrate the usage of the wrapper.</p>
    <h3>System Status</h3>
    <p>Gets basic data about the status of the BART system.</p>
    <h4>Request</h4>
    <pre class="prettyprint">

      http://bart.crudworks.org/api/status
    </pre>
    <h4>Response</h4>
    <pre class="prettyprint">

      {
        "updatedtime": "07:21:48 PM",
        "traincount": "48",
        "advisories": {}
      }
    </pre>
    <ul>
      <li>updatedtime is the time that the data was last refreshed from the BART API (updated every minute)</li>
      <li>traincount indicates the number of trains running on the system.</li>
      <li>advisories will be empty if there are no system status advisories and contains one text string for each advisory when there are one or more active system advisories.</li>
    </ul>
    <h4>Response with System Advisory</h4>
    <p>The following shows what the response looks like when BART has a system advisory in place.</p>
    <pre class="prettyprint">

      {
        "updatedtime": "08:02:21 AM",
        "traincount": "59",
        "advisories": {
          "advisory": "There is a delay developing at Fremont on the Fremont Line in the Fremont, 
                      Richmond and San Francisco directions due to an equipment problem on a train. "
        }
      } 
    </pre>
    <h3>Station Information (All Stations)</h3>
    <p>Gets name, address, location etc data about each station on the BART network.</p>
    <h4>Request</h4>
    <pre class="prettyprint">

      http://bart.crudworks.org/api/stations
    </pre>
    <h4>Response</h4>
    <pre class="prettyprint">

      {
        "12TH": {
          "abbr": "12TH",
          "name": "12th St. Oakland City Center",
          "foursquareid": "468eecfdf964a5208f481fe3",
          "latitude": "37.803664",
          "longitude": "-122.271604",
          "address": "1245 Broadway",
          "city": "Oakland",
          "state": "CA",
          "zipcode": "94612",
          "description": "12th St. Oakland City Center Station is in the heart of Downtown 
                          Oakland, near historic Old Oakland and Oakland's Chinatown."
        },
        "16TH": {
          "abbr": "16TH",
          "name": "16th St. Mission",
          "foursquareid": "4abff08bf964a520219320e3",
          "latitude": "37.765062",
          "longitude": "-122.419694",
          "address": "2000 Mission Street",
          "city": "San Francisco",
          "state": "CA",
          "zipcode": "94110",
          "description": "\"The Mission\" refers to the San Francisco de Asis Mission, 
                          also known as Mission Dolores, which was founded 1776. Today the 
                          neighborhood is host to an eclectic mix of restaurants, markets, 
                          performance spaces, shops, and nightspots."
        },
      ...
    </pre>
    <ul>
      <li>Most values returned should be self explanatory</li>
      <li>Use the abbr values to get further data on a given station e.g. ticket pricing or train depatures.</li>
      <li>Use the foursquareid to query Foursquare's API for information, the value returned here is a Foursquare venue ID.</li>
    </ul>
    <h3>Individual Station Information</h3>
    <h4>Request</h4>
    <pre class="prettyprint">

      http://bart.crudworks.org/api/station/&lt;STATIONCODE&gt;

      http://bart.crudworks.org/api/station/POWL
    </pre>
    <h4>Response</h4>
    <pre class="prettyprint">

      {
        "abbr": "POWL",
        "name": "Powell St.",
        "foursquareid": "455f7871f964a520913d1fe3",
        "latitude": "37.784991",
        "longitude": "-122.406857",
        "address": "899 Market Street",
        "city": "San Francisco",
        "state": "CA",
        "zipcode": "94102",
        "description": "Located at Powell and Market Streets, this station is centrally 
                        located near San Francisco's most popular attractions including 
                        the cable cars, Union Square, Yerba Buena Gardens, the Moscone 
                        Convention Center and the City's Theatre District."
      }
    </pre>
    <ul>
      <li>Same as the response from /api/stations but only contains data for the requested station.</li>
    </ul>
    <h3>Train Departures from an Individual Station</h3>
    <h4>Request</h4>
    <pre class="prettyprint">

      http://bart.crudworks.org/api/departures/&lt;STATIONCODE&gt;

      http://bart.crudworks.org/api/departures/POWL
    </pre>
    <h4>Response</h4>
    <pre class="prettyprint">

    {
      "DALY": {
        "destination": "Daly City",
        "departures": [
          {
            "color": "BLUE",
            "estimate": "15 mins",
            "cars": "8",
            "platform": "1",
            "bikeflag": "1"
          },
          {
            "color": "BLUE",
            "estimate": "35 mins",
            "cars": "8",
            "platform": "1",
            "bikeflag": "1"
          },
          {
            "color": "BLUE",
            "estimate": "59 mins",
            "cars": "8",
            "platform": "1",
            "bikeflag": "1"
          }
        ]
      },
      "DUBL": {
        "destination": "Dublin/Pleasanton",
        "departures": [
          {
            "color": "BLUE",
            "estimate": "15 mins",
            "cars": "9",
            "platform": "2",
            "bikeflag": "1"
          },
          {
            "color": "BLUE",
            "estimate": "35 mins",
            "cars": "8",
            "platform": "2",
            "bikeflag": "1"
          },
          {
            "color": "BLUE",
            "estimate": "55 mins",
            "cars": "8",
            "platform": "2",
            "bikeflag": "1"
          }
        ]
      }
    }
    </pre>
    <ul>
      <li>bikeflag will be set to 1 if bikes are allowed on board, 0 otherwise.</li>
      <li>color may be set to BLUE, GREEN, ORANGE, RED, YELLOW or WHITE where WHITE is reserved for trains that have not been allocated a real line yet.</li>
      <li>estimate will be set to "Boarding" if the train is in the station.</li>
      <li>Departure times are cached for up to 1 minute on the server.</li>
    </ul>
    <h3>Ticket Prices, Route Between Stations</h3>
    <p>Get the price of a one way ticket between two stations, details of how to navigate BART between those stations and an estimate of Carbon Dioxide savings for the journey.</p>
    <h4>Request</h4>
    <pre class="prettyprint">

      http://bart.crudworks.org/api/tickets/?fromStation=&lt;STATIONCODE&gt;&amp;toStation=&lt;STATIONCODE&gt;

      http://bart.crudworks.org/api/tickets/?fromStation=PITT&amp;toStation=DUBL
    </pre>
    <h4>Response</h4>
    <pre class="prettyprint">

    {
      "fromStation": "Pittsburg/Bay Point",
      "toStation": "Dublin/Pleasanton",
      "fare": "6.45",
      "clipper": "2.40",
      "emissions": "23.3",
      "legs": [
        "At Pittsburg/Bay Point board train to San Francisco Int'l Airport change at MacArthur.",
        "At MacArthur board train to Fremont change at Bay Fair.",
        "At Bay Fair board train to Dublin/Pleasanton alight at Dublin/Pleasanton."
      ]
    }
    </pre>
    <ul>
      <li>A trip between two BART stations may require 1, 2 or 3 separate legs.</li>
      <li>Fare prices are quoted in United States Dollars.</li>
      <li>The Clipper price is valid for those using the Clipper Card.</li>
      <li>Emissions saved are quoted in Pounds.</li>
      <li>Setting fromStation and toStation to the same STATIONCODE will currently cause an error.  This will be fixed in a later release.</li>
    </ul>
    <h2>JSONP Support</h2>
    <p>To use any of the API endpoints with JSONP, simply add a request parameter named callback to the URL and set the value to the name of the Javascript function you want returned.</p>
    <p>When called with the callback parameter, content will be returned as content type application/javascript rather than application/json.</p>
    <h4>Example Request</h4>
    <pre class="prettyprint">

      http://bart.crudworks.org/api/status?callback=myCallbackFunction
    </pre>
    <h4>Example Response</h4>
    <pre class="prettyprint">

      myCallbackFunction({"updatedtime": "07:31:35 AM","traincount": "60","advisories": {}});
    </pre>
    <h2>Roadmap</h2>
    <p>I would like to add more functionality to this wrapper, for example:</p>
    <ul>
      <li>Tidy up and pretty print this page some more.</li>
      <li>Make the list of stations and individual station calls still return valid data when BART is closed for the night.</li>
      <li>Add call to find nearest station to a provided latitude/longitude GPS position.</li>
      <li>Add calls for escalator status.</li>
      <li>Offer the ability to plan a journey at a specific date and time.</li>
      <li>Fix the error page that is generated if the from and to stations are the same station code when asking for ticket information.</li>
      <li>Tidy up the formatting of the raw JSON.</li>
      <li>Allow users to supply their own BART API keys and use those to call the underlying API.</li>
    </ul>
    <p>I can't guarantee whether I will do these enhancements within any given timeframe as this is very much a spare time project.</p>
    <h2>Contact Me</h2>
    <p>If you want to get in touch, find this useful, want to use it, or have any suggestions: please <a href="https://twitter.com/intent/tweet?text=@simon_prickett%20BART%20Feedback:">Tweet me @simon_prickett</a></p>
    <h2>Get the Code</h2>
    <p>You can get the code from <a href="https://github.com/simonprickett/openbart">Github</a>.  It is written in Groovy on Grails and also comes with a JQuery Mobile web front end.</p>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
  </body>
</html>
