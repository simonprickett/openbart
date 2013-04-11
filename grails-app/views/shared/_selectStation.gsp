<ul data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Filter stations...">
  <g:each in="${stations.list().sort{ it.name.toString().toLowerCase() } }" var="station">
    <li><a href="departures?station=${station.abbr}">${station.name}</a>
  </g:each>
</ul>