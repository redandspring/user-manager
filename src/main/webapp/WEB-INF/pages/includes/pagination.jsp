<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/" var="root" />
<nav>
  <ul class="pagination">

    <c:set value="${page}" var="pageCurrent" />
    <c:forEach begin="1" end="${countPages}" varStatus="loop">

      <c:if test="${loop.index == pageCurrent}" >
        <li class="active"><span>${loop.index}</span></li>
      </c:if>
      <c:if test="${loop.index != pageCurrent}" >
        <li><a href="${root}users?page=${loop.index}" >${loop.index}</a></li>
      </c:if>

    </c:forEach>

  </ul>
</nav>