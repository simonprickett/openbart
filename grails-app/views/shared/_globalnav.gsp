<div data-role="navbar">
  <ul>
    <li><a href="home" <g:if test="${!params.tab || params?.tab == 'info'}">class="ui-btn-active"</g:if>>Trains</a></li>
    <li><a href="tickets" <g:if test="${params?.tab == 'tickets'}">class="ui-btn-active"</g:if>>Tickets</a></li>
    <li><a href="news" <g:if test="${params?.tab == 'news'}">class="ui-btn-active"</g:if>>News</a></li>
    <li><a href="about" <g:if test="${params?.tab == 'about'}">class="ui-btn-active"</g:if>>About</a></li>
  </ul>
</div>