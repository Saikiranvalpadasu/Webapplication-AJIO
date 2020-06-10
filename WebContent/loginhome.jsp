<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login-home</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

			<img src="img/logo.jpeg"
				style="height: 60px; width: 120px;">

			<ul class="nav">
				<li class="nav-item"><button class="btn btn-success"
						data-toggle="modal" data-target="#username">Welcome &nbsp;${name}</button></li>&nbsp;
				<li class="nav-item"><button class="btn btn-success"
						data-toggle="modal" data-target="#logout">Logout</button></li>
			</ul>
		</div>
		</nav>
	</center>
	<br>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<div class="container">
		<form action="Appservlet" method="post">
			<table>
				<tr><td><b>Select Category :</b></td>
					<td><select name="select">
							<option>select</option>
							<c:forEach var="obj1" items="${clist}">
								<option>${obj1}</option>
							</c:forEach>
					</select></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="bt" value="go"
						class="btn btn-primary"></td>
						<td> 
	
				</tr>
			</table>
		</form>
	</div>
	<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="container">
		<form action="Appservlet" method="post">
			<table border="1" class="table table-striped" class="container-fluid">
				<thead>
					<tr>
						<th>Image</th>
						<th>Name</th>
						<th>UnitPrice</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="obj" items="${hlist}">
						<tr>
							<input type="hidden" name="id" value="${obj.id}" />
							<td><img src="img/${obj.getImage_url()}"
								alt="image notFound" height="100" width="100"></td>
							<td class="name">${obj.getName()}</td>
							<td>${obj.getPrice()}</td>
							<td><input type="number" value="0" min="0" max="50"
								name="quantity" /></td>

						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" align="right"><input type="submit"
							name="bt" value="AddToCart" class="btn btn-primary"></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<br>
	<br>
	<br>
	
	<br>
	<br>
	<br>
	<br>
	
</body>
</html>