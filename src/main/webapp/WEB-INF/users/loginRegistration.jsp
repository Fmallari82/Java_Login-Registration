<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Register</h1>
				<form:form action="/login/registration" method="post" modelAttribute="newUser">
					<div class="form-group">
						<label>User Name</label>
						<form:input path="userName" class="form-control" />
						<form:errors path="userName" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Email</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password</label>
						<form:input path="password" type="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Confirm Password</label>
						<form:input path="confirm" type="password" class="form-control" />
						<form:errors path="confirm" class="text-danger" />
					</div>
					<input type="submit" value="Register User" class="btn btn-primary mt-3" />
				</form:form>
			</div>

			<div class="col">
				<h1>login</h1>
				<form:form action="/login" method="post" modelAttribute="loginUser">
					<div class="form-group">
						<label>Email</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password</label>
						<form:input path="password" type="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<input type="submit" value="Log in" class="btn btn-primary mt-3" />
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>