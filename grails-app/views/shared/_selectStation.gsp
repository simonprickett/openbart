<ul>
  <g:each in="${stations.list().sort{ it.name.toString().toLowerCase() } }" var="station">
    <li><a href="departures?station=${station.abbr}">${station.name}</a></richtext>
  </g:each>
</ul>