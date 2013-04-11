<form action="home" method="GET" name="tripSelect">
  <input type="hidden" name="tab" value="tickets"/>
  <select name="fromStation">
    <g:each in="${stations.list().sort{ it.name.toString().toLowerCase() } }" var="station">
      <g:if test="${station.abbr == params.from}">
        <option value="${station.abbr}" selected="selected">${station.name}</option>
      </g:if>
      <g:else>
        <option value="${station.abbr}">${station.name}</option>
      </g:else>
    </g:each>
  </select>
  <select name="toStation">
    <g:each in="${stations.list().sort{ it.name.toString().toLowerCase() } }" var="station">
      <g:if test="${station.abbr == params.to}">
        <option value="${station.abbr}" selected="selected">${station.name}</option>
      </g:if>
      <g:else>
        <option value="${station.abbr}">${station.name}</option>
      </g:else>
    </g:each>
  </select>
  <input type="submit" data-icon="check" data-theme="b" value="Get Details"/>
</form>