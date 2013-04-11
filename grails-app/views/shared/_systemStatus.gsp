<g:if test="${advisories.bsa[0].description == 'No delays reported.'}">
  <h5>${updatedTime.toString().replaceAll(" PDT", "").replaceAll(" PST", "")}: No delays, ${trainsInService} trains operating.</h5>
</g:if>
<g:else>
  <div data-role="collapsible" data-mini="true" data-theme="a" data-content-theme="d">
    <h4>${updatedTime.toString().replaceAll(" PDT", "").replaceAll(" PST", "")}: System Advisories!</h4>
    <ul data-role="listview">
      <g:each in="${advisories.bsa}" var="advisory">
        <li>${advisory.description}</li>
      </g:each>
    </ul>
  </div>
</g:else>