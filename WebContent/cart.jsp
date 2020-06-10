<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cart</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<center>
		<nav class="navbar" style="background-color: #838a84;">

		<div class="container">

			<img src="img/logo.jpeg" style="height: 60px; width: 120px;">

			<ul class="nav">
				<li class="nav-item"><button class="btn btn-success"
						data-toggle="modal" data-target="#username">Welcome &nbsp;${name}</button></li>&nbsp;
				<li class="nav-item"><a href="logout.jsp" class="btn btn-primary">logout</a></li>
			</ul>
		</div>
		</nav>
	</center>
	<h1 style="text-align: center">Items In Cart Are :</h1>
	<br>
	<br>
	<br>
	<br>
	<table class="table">
		<tr>
			<th>Item-Id</th>
			<th>Image</th>
			<th>Name</th>
			<th>Unit-Price</th>
			<th>Quantity</th>
		</tr>
		<c:forEach var="obj" items="${selectedItemsList}" varStatus="st">
			<tr>
				<td>${obj.id}</td>
				<td><img src="img/${obj.getImage_url()}" alt="image notFound"
					height="100" width="100"></td>
				<td class="name">${obj.getName()}</td>
				<td>${obj.getPrice()}</td>
				<td>${qList.get(st.index)}</td>

			</tr>
		</c:forEach>


	</table>
	<br>
	<br>
	<br>
	<br>
	<center>
		<h3>Total Order price :${tp}</h3>
		<form action="Appservlet" method="post">
		<br> <br> <br> <br> <input type="submit" name="bt"
			value="Place Order" class="btn btn-success"> <br> <br>
		<br> <br> <a href="loginhome.jsp" class="btn btn-success">moreshoping</a>
		</form>
	</center>

</body>
</html>