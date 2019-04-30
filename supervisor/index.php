<?php
session_start();
error_reporting(0);
include("include/config.php");
if(isset($_POST['submit']))
{
	$username=$_POST['username'];
	$password=md5($_POST['password']);
$ret=mysqli_query($con,"SELECT * FROM supervisor WHERE username='$username' and password='$password'");
$num=mysqli_fetch_array($ret);
if($num>0)
{
$extra="change-password.php";//
$_SESSION['slogin']=$_POST['username'];
$_SESSION['id']=$num['id'];
$host=$_SERVER['HTTP_HOST'];
$uri=rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
exit();
}
else
{
$_SESSION['errmsg']="Invalid username or password";
$extra="index.php";
$host  = $_SERVER['HTTP_HOST'];
$uri  = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
exit();
}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CMS | Admin login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="css/half-slider.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark ">
		<a class="navbar-brand py-0  text-white" href="http://localhost/cms/index.html">
			<img src="http://localhost/cms/img/logo.jpg" width="50" height="50" class="d-inline-block align-center" alt="">
				<span><b>Guwahati Municipal Corporation</b></span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse text-white" id="navbarNav">
			<ul class="nav nav-pills justify-content-end">
				<li class="nav-item">
					<a class="nav-link text-white" href="http://localhost/cms/index.html">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-white" href="http://localhost/cms/users/">User Login</a>
				</li>
				<li class="nav-item">
						<a class="nav-link text-white" href="http://localhost/cms/users/registration.php">User Registration</a>
				</li>
				<li class="nav-item">
				<a class="nav-link text-white" href="http://localhost/cms/admin/">Engineer Login</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-white active" href="http://localhost/cms/supervisor/">Supervisor Login</a>
				</li>
			</ul>
		</div>
	</nav>


	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="module module-login span4 offset4">
					<form class="form-vertical" method="post">
						<div class="module-head">
							<h3>Sign In</h3>
						</div>
						<span style="color:red;" ><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="inputEmail" name="username" placeholder="Username">
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
						<input class="span12" type="password" id="inputPassword" name="password" placeholder="Password">
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="submit" class="btn btn-primary pull-right" name="submit">Login</button>

								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!--/.wrapper-->

	<footer class="page-footer font-small blue fixed-bottom">

		<!-- Copyright -->
		<div class="footer-copyright text-center">
			<p>&copy; 2019 Copyright : <b>Guwahati Municipal Corporation</b></p>
		</div>
		<!-- Copyright -->

	</footer>
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
