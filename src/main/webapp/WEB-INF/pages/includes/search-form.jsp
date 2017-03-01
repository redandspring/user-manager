<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form class="form-inline" action="<c:url value="/users/search" />" method="post">
  <div class="form-group">
    <label for="searchQuery">Search by name: </label>
    <input type="text" name="query" class="form-control" id="searchQuery">
  </div>
  <button type="submit" class="btn btn-default">Submit Search</button>
</form>