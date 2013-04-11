<script type="text/javascript">  
  function initialize() {
    var latLng = new google.maps.LatLng(${stationDetails.stations.station.gtfs_latitude}, ${stationDetails.stations.station.gtfs_longitude});
    var myOptions = {
      zoom: 15,
      center: latLng,
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_${params?.station}"), myOptions);
    google.maps.event.trigger(map, 'resize');
  }
  
  $("div:jqmData(role='page'):last").bind('pageinit', function() {
    initialize();
  });

  google.maps.event.addDomListener(window, 'load', initialize);
  
</script>
<div id="map_${params?.station}" style="width:100%; height:150px;">
</div>
<div data-role="collapsible" data-theme="b">
  <h4>About this Station</h4>
  <div>
    <ul data-role="listview">
      <li>${stationDetails.stations.station.address}, ${stationDetails.stations.station.city} ${stationDetails.stations.station.state}, ${stationDetails.stations.station.zipcode}
    </li>
      <li>${stationDetails.stations.station.intro}</li>
    </ul>
  </div>
</div>
<div data-role="collapsible" data-theme="b">
    <h5>FourSquare Tips</h5>
    <g:set var="tipCount" value="${0}" />
    <div>
    <ul data-role="listview">
      <g:each in="${stationTips.response.tips.items}" var="tip">
        <g:if test="${tipCount < 3}">
            <li><img src="${tip.user.photo}" alt="Photo" /> <div>${tip.text}</div><br/><p>${tip.user.firstName} ${tip.user.lastName} (${tip.user.homeCity})</p></li>
        </g:if>
        <% tipCount++; %>
      </g:each> 
    </ul>
    </div>
</div>
<ul data-role="listview" data-inset="true">
  <li data-role="list-divider">Ticket Info</li>
  <li><a href="home?tab=tickets&to=${params.station}">Tickets to this station</a></li>
  <li><a href="home?tab=tickets&from=${params.station}">Tickets from this station</a></li>
</ul>