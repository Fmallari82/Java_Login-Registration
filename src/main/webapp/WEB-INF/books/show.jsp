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
	<div class="container mt-3">
		<div class='d-flex justify-content-between align-items-center'>
			<h1>
				<c:out value="${book.title}" />
			</h1>
			<a href='/books'>Back to the shelves:</a>
		</div>

		<div class="mt-3 pt-3">
		<c:if test="${user.getId() == book.getUser().getId()}">
			<h4>
				<span style="color: red;">You </span>read <span style="color: rebeccapurple;"><c:out value="${book.title}" /></span>
				by <span style="color: darkgreen;"><c:out value="${book.author}" /></span> and...
			</h4>
		</c:if>
		<c:if test="${user.getId() != book.getUser().getId()}">
			<h4>
				<span style="color: red;">
				<c:out value="${book.user.userName}" />
				</span> read <span style="color: rebeccapurple;"><c:out value="${book.title}" /></span>
				by <span style="color: darkgreen;"><c:out
						value="${book.author}" /></span>
			</h4>
		</c:if>

		</div>

		<div>
			<h4>Here are <span><c:out value="${book.user.userName}" />'s</span> thoughts:</h4>
			<hr />

			<p>
				<c:out value="${book.thoughts}" />
			</p>
			<hr />

		</div>
		<c:if test="${user.getId() == book.getUser().getId()}">
		<div class="d-flex justify-content-center">
			<form action="/books/edit/${book.id}" method="get">
				    <input type="hidden" name="_method" value="edit">     <input
					type="submit" value="Edit">
			</form>
			<form action="/books/delete/${book.id}" method="post">
				    <input type="hidden" name="_method" value="delete">     <input
					type="submit" value="Delete">
			</form>
		</div>
		</c:if>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>