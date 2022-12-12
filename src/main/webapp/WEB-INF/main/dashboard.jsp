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
		<div class="d-flex justify-content-between">
			<div>
				<h1>
					Welcome,
					<c:out value="${loggedInUser.userName}" />
				</h1>
				<p>Books from everyone's shelves:</p>
			</div>
			<div class="d-flex flex-column justify-content-center align-items-end">
				<a href="/logout">Log out</a> </br> <a href="/books/create">+ Add a
					book to my shelf</a>
			</div>
		</div>
		<table class="table table-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Title</th>
				<th scope="col">Author Name</th>
				<th scope="col">Posted By</th>
				<th scope="col">Actions</th>
			</tr>
			<c:forEach var="book" items="${allBooks}">
				<tr>
					<td><c:out value="${book.id}" /></td>
					<td><a href="books/view/${book.id}"><c:out
								value="${book.title}" /></a></td>
					<td><c:out value="${book.author}" /></td>
					<td><c:out value="${book.user.userName}" /></td>
					<td>
						<div class="d-flex justify-content-center">
							<form action="/books/edit/${book.id}" method="get">
								    <input type="hidden" name="_method" value="edit">
								    <input type="submit" value="Edit">
							</form>
							<form action="/books/delete/${book.id}" method="post">
								    <input type="hidden" name="_method" value="delete">
								    <input type="submit" value="Delete">
							</form>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>


	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>