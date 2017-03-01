<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>
  <ul class="pagination">

    <c:set value="${page}" var="pageCurrent" />
    <c:forEach begin="1" end="${countPages}" varStatus="loop">

      <c:if test="${loop.index == pageCurrent}" >
        <li class="active"><span>${loop.index}</span></li>
      </c:if>
      <c:if test="${loop.index != pageCurrent}" >
        <li><a href="/users?page=${loop.index}" >${loop.index}</a></li>
      </c:if>

    </c:forEach>

  </ul>
</nav>