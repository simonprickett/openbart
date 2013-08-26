<%@ page contentType="application/json" %>
{"updatedtime": "${updatedTime.toString().replaceAll(" PDT", "").replaceAll(" PST", "")}","traincount": "${trainsInService}",
"advisories": <g:if test="${advisories.bsa[0].description == 'No delays reported.'}">{}</g:if>
<g:else>
{
      <g:each in="${advisories.bsa}" var="advisory" status="status">
        "advisory": "${advisory.description}"<g:if test="${status != advisories.bsa.size() -1}">,</g:if>
      </g:each>
}
</g:else>
}