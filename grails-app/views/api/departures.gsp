<g:if test="${callback != null}"><%@ page contentType="application/javascript" %></g:if><g:else><%@ page contentType="application/json" %></g:else>
<g:if test="${callback != null}">${callback}(</g:if>
<g:each in="${stations}" var="station">
  <g:if test="${station.abbr == params.station}">    
    {
    <g:each in="${station.etd}" var="etd" status="status">
        "${etd.abbreviation}" : {
          "destination": "${etd.destination}",
          "departures": [
          <g:each in="${etd.estimate}" var="train" status="dstatus">
            {
            <g:if test="${train.minutes.equals('Leaving')}">
              <g:set var="mins" value="Boarding"/>
            </g:if>
            <g:else>
              <g:set var="mins" value="${train.minutes} mins"/>
            </g:else>
              "color": "${train.color}",
              "estimate": "${mins}",
              "cars": "${train.length}",
              "platform": "${train.platform}",
              "bikeflag": "${train.bikeflag}"
            }<g:if test="${dstatus != etd.estimate.size() -1}">,</g:if>
          </g:each>
          ]
          }<g:if test="${status != station.etd.size() -1}">,</g:if>
    </g:each>
    }
  </g:if>
</g:each>
<g:if test="${callback != null}">);</g:if>