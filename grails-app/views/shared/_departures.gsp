<g:each in="${station.etd}" var="etd">
  <ol data-role="listview" data-inset="true">
    <li data-role="list-divider"><a href="../station/${etd.abbreviation}" rel="external">${etd.destination}</a></li>
    <g:each in="${etd.estimate}" var="train">
      <g:if test="${train.minutes.equals('Leaving')}">
        <g:set var="mins" value="Boarding"/>
      </g:if>
      <g:else>
        <g:set var="mins" value="${train.minutes} mins"/>
      </g:else>
      <li><img src="../images/${train.color}.png" alt="${train.color}" class="ui-li-icon"/> ${mins} ${train.length} car platform ${train.platform} <g:if test="${train.bikeflag == '0'}"></g:if></li>
    </g:each>
  </ol>
</g:each>
<a href="../station/${params.station}" data-role="button" data-icon="info" data-theme="b" rel="external">${station.name} Info</a</li></ul>