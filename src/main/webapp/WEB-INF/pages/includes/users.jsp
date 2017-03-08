<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
  <div class="col-md-6 col-md-offset-3">

<c:if test="${empty(users)}" >
  <h1>List of users is empty</h1>
</c:if>
<c:if test="${!empty(users)}" >

  <h1>${titlePage}</h1>

  <table class="table table-hover table-bordered">
    <tr>
      <th>ID</th>
      <th><spring:message code="inc.users.name" /></th>
      <th><spring:message code="inc.users.age" /></th>
      <th><spring:message code="inc.users.admin" /></th>
      <th><spring:message code="inc.users.createdDate" /></th>
      <th><spring:message code="inc.users.action" /></th>
    </tr>
    <c:forEach items="${users}" var="user" >
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.admin ? "yes" : "no"}</td>
        <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${user.createdDate}" /></td>
        <td>
          <a href="<c:url value="/users/edit/${user.id}" />" >Edit</a>
          <a href="<c:url value="/users/remove/${user.id}" />" >Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>

  <jsp:include page="pagination.jsp" />
</c:if>

    <br />
    <hr />
    <br />
    <jsp:include page="search-form.jsp" />

  </div>
</div>
