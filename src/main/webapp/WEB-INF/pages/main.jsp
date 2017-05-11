<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<c:url value="/" var="resources" />
<c:url value="/" var="root" />

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>UM - ${titlePage}</title>

  <link href="${resources}css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      padding-top: 50px;
    }
    .starter-template {
      padding: 40px 15px;
      text-align: center;
    }
    .pad15 {padding: 15px;}
  </style>

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href=""><spring:message code="main.project" /></a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${root}"><spring:message code="main.home" /></a></li>
        <sec:authorize access="hasRole('ROLE_USER')">
          <li><a href="${root}users/add"><spring:message code="main.addNewUser" /></a></li>
        </sec:authorize>
        <li><a href="${root}users/"><spring:message code="main.showAllUsers" /></a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <spring:message code="main.lang" /> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="?lang=en">English</a></li>
            <li><a href="?lang=ru">Russian</a></li>
          </ul>
        </li>

          <sec:authorize access="isAuthenticated()">
            <li><p class="navbar-text">Welcome <sec:authentication property="principal.username" /></p></li>
            <li>
              <c:url var="logoutUrl" value="/logout"/>
              <form class="form-inline" action="${logoutUrl}" method="post">
                <input type="submit" class="btn btn-default navbar-btn" value="Log out" />
                <sec:csrfInput />
              </form>
              <!-- a href="<spring:url value="/j_spring_security_logout" />">logout</a -->
            </li>
          </sec:authorize>

          <sec:authorize access="isAnonymous()">
            <li><a href="/login"><spring:message code="main.login"/></a></li>
          </sec:authorize>

      </ul>
    </div>
  </div>
</nav>


<div class="container">

  <c:if test="${includeView == null}" >
    <div class="starter-template">
      <h1>User Manager Example</h1>
      <p class="lead">${titlePage}. This standard CRUD application. <br />Used technologies: Java, Spring, Hibernate, MySQL</p>

      <jsp:include page="includes/search-form.jsp" />
    </div>
  </c:if>

  <c:if test="${includeView != null}" >
    <jsp:include page="includes/${includeView}.jsp" />
  </c:if>

</div>

<script src="${resources}js/jquery.min.js"></script>
<script src="${resources}js/bootstrap.min.js"></script>
</body>
</html>