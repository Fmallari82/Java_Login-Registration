<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
<div  class="container" >
<div  class="d-flex justify-content-between" >
	<h1>Add a Book </h1>
	<a href="/books">back to the shelves</a>
</div>
	<form:form action="/books/create" modelAttribute="book" method="post">
		<form:input type="hidden" value="${user_id}" path="user"/>
		<div>
			<label>Title: </label>
			<form:input type="text" path="title" class="form-control" />
			<form:errors  path="title"/>
		</div>
		<div>
			<label>Author: </label>
			<form:input type="text" path="author" class="form-control" />
			<form:errors  path="author"/>
		</div>
		<div>
			<label>My Thoughts: </label>
			<form:textarea type="text" path="thoughts" class="form-control" />
			<form:errors  path="thoughts"/>
		</div>

		<input type="submit" value="create book" class="btn btn-primary mt-3"/>
	</form:form>
</div>
</body>
</html>