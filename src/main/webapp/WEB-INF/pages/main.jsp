<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>UM - ${titlePage}</title>

  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      padding-top: 50px;
    }
    .starter-template {
      padding: 40px 15px;
      text-align: center;
    }
  </style>

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">User Manager</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>
        <li><a href="/users/add">Add new user</a></li>
        <li><a href="/users/">Show all users</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>


<div class="container">






        <c:if test="${includeView == null}" >
          <div class="starter-template">
          <h1>User Manager Example</h1>
          <p class="lead">This standard CRUD application. <br />Used technologies: Java, Spring, Hibernate, MySQL</p>

          <jsp:include page="includes/search-form.jsp" />
          </div>
        </c:if>



        <c:if test="${includeView != null}" >
          <jsp:include page="includes/${includeView}.jsp" />
        </c:if>
    </div>

  </div>
</div>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>