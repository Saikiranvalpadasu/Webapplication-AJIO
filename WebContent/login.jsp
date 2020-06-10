<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

			<img src=" img/logo.jpeg" style="height: 60px; width: 120px;">
			<h1>Welcome to AJIO</h1>

			<ul class="nav">
				<li class="nav-item"><button class="btn btn-success"
						data-toggle="modal" data-target="#login">Login</button></li>&nbsp;
				<li class="nav-item"><button class="btn btn-success"
						data-toggle="modal" data-target="#signup">SignUp</button></li>
			</ul>
		</div>
		</nav>
	</center>

	<div class="modal" id="signup">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enter User Details</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<form action="Appservlet" method="post">
						<div class="form-group">
							Name : <input type="text" name="t1" class="form-control">
						</div>

						<div class="form-group">
							Email-Id : <input type="email" name="t2" class="form-control">
						</div>
						<div class="form-group">
							Password : <input type="password" name="t3" class="form-control">
						</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">

					<input type="submit" value="Register" name="bt"
						class="btn btn-success" />
				</div>

				</form>

			</div>
		</div>
	</div>



	<div class="modal" id="login">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Welcome</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<form action="Appservlet" method="post">


						<div class="form-group">
							Email-Id : <input type="email" name="f1"
								class="form-control col-sm-6">
						</div>
						<div class="form-group">
							Password : <input type="password" name="f2"
								class="form-control col-sm-6">
						</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="Login" name="bt"
						class="btn btn-success" />
				</div>

				</form>

			</div>
		</div>
	</div>
	<br>
	<br>
	<h2 style="text-align: center">OUR SERVICES</h2>
	<br>
	<br>
	<center>
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
				<li data-target="#demo" data-slide-to="3"></li>
				<li data-target="#demo" data-slide-to="4"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="login/one.jpg" alt="Los Angeles" width="60%" height="250">
				</div>
				<div class="carousel-item">
					<img src="login/two.jpg" alt="Chicago" width="60%" height="250">
				</div>
				<div class="carousel-item">
					<img src="login/three.jpg" alt="New York" width="60%" height="250">
				</div>
				<div class="carousel-item">
					<img src="login/four.jpg" alt="Los Angeles" width="60%" height="250">
				</div>
				<div class="carousel-item">
					<img src="login/five.jpg" alt="Los Angeles" width="60%" height="250">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</center>
	<br>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

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
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="bt" value="Go"
						class="btn btn-primary"></td>
						<td> 
	
				</tr>
			</table>
		</form>
	</div>
	
	<br>
	<br>
	<br>
	<div class="container">
		<table border="1" class="table table-striped">
			<thead>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>UnitPrice</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="obj" items="${plist}">
					<tr>
						<td><img src="img/${obj.getImage_url()}"
							alt="image notFound" height="100" width="100"></td>
						<td>${obj.name}</td>
						<td>${obj.price}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>