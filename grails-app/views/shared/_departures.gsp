<g:each in="${station.etd}" var="etd">
  <p><a href="departures?station=${etd.abbreviation}&tab=info">${etd.destination}</a></p>
  <ol>
    <g:each in="${etd.estimate}" var="train">
      <g:if test="${train.minutes.equals('Leaving')}">
        <g:set var="mins" value="Now Boarding"/>
      </g:if>
      <g:else>
        <g:set var="mins" value="${train.minutes} mins"/>
      </g:else>
      <li><img src="images/${train.color}.png" alt="${train.color}"/> ${mins} platform ${train.platform} (${train.length} cars)</li>
    </g:each>
  </ol>
</g:each>