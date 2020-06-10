<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkout</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.navbar-custom {
	background-color: grey;
}
</style>
</head>
<body>
	<nav class="navbar navbar-custom navbar-expand-sm">
		<div class="container-fluid">
			<img src="img/logo.jpeg" alt="logo" height="70px" width="150px"
				class="rounded ">

			<!-- comments -->

			<ul class="nav">

				<li class="nav-item">
					<button class="btn btn-success">Welcome&nbsp;${name}</button>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a href="logout.jsp" class="btn btn-primary">logout</a></li>
			</ul>

		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		Customer Name:&nbsp;${name}
	</div>
	<br>
	<br>
	<div class="container">
		<form action="Appservlet" method="post">
			<table border="1" class="table table-striped" class="container-fluid">
				<thead>
					<tr>
						<th>ProductId</th>
						<th>Image</th>
						<th>Name</th>
						<th>UnitPrice</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="obj" items="${selectedItemsList}" varStatus="st">
						<tr>
							<input type="hidden" name="id" value="${obj.id}" />
							<td>${obj.getId()}</td>
							<td><img src="img/${obj.getImage_url()}"
								alt="image notFound" height="100" width="100"></td>
							<td>${obj.getName()}</td>
							<td>${obj.getPrice()}</td>
							<td>${qList.get(st.index)}</td>
							<input type="hidden" name="ql" value="${qList.get(st.index)}" />
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<div class="container">
				<center>
					<h4>
						<b>Total Price:${tp}</b>
					</h4>
				</center>
			</div>
			<br> <br>
			<div class="container">
				<center>
					<input type="submit" name="bt" value="continue"
						class="btn btn-primary" />
				</center>
			</div>
			<br> <br>

		</form>
	</div>
</body>
</html>