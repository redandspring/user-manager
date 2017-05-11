<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
<div class="col-md-3 col-md-offset-4">

<%-- <h2>${user.id > 0 ? 'Edit User' : 'Add User' }</h2> --%>
    <h1>${titlePage}</h1>

<form:form modelAttribute="user">

    <div class="has-error">
        <form:errors path="*" class="help-block"/>
    </div>

    <div class="form-group">
        <label for="formName">Name: </label>
        <form:input id="formName" path="name" class="form-control"  />
    </div>

    <div class="form-group">
        <label for="formAge">Age: </label>
        <form:input id="formAge" path="age" class="form-control" />
    </div>

    <div class="form-group">
        <label for="formIsAdmin">
        <form:checkbox id="formIsAdmin" path="admin" />
            Is it Admin? </label>
    </div>

    <div class="form-group">
        <c:if test="${user.id > 0}">
            <input type="submit" value="Submit Edit User" class="btn btn-primary"/>
            <form:hidden path="id"/>
        </c:if>
        <c:if test="${user.id == 0}">
            <input type="submit" value="Submit Add User" class="btn btn-primary"/>
        </c:if>
    </div>
</form:form>

</div>
</div>