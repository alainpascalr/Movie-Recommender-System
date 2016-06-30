<!DOCTYPE html>
<?php 
	session_start();
	$name = "";
	$userid = "";
	if(array_key_exists('name', $_SESSION) && array_key_exists('userid', $_SESSION)){
		$name = $_SESSION['name'];
		$userid = $_SESSION['userid'];
	}
		
?>

<html lang="en">
<head>  
	<?php $page_title = "Register" ?>

	<?php include("includes/resources.php");?>
</head>

<body id="loginbackground">
<div class="container">
	<div class="row clearfix">
		<?php include("includes/navbar.php");?>
			
			<div class="register-form">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<form id="formID" name="formID" method="post" action="" role="form">
							<div class="row">
								<div class="form-group-xs">
									<label for="first-name">First Name</label>
									<input name ="first-name" type="name" class="form-control" id="first-name" placeholder="First Name" required autofocus/>
								</div>
							</div>

							<div class="row">
								<div class="form-group-xs">
									<label for="last-name">Last Name</label>
									<input name ="last-name" type="name" class="form-control" id="last-name" placeholder="Last Name" required autofocus/>
								</div>
							</div>

							<div class="row">
								<div class="form-group-xs">
									<label for="city-name">City</label>
									<input name ="city-name" type="name" class="form-control" id="city-name" placeholder="City" required autofocus/>
								</div>
							</div>

							<div class="row">
								<div class="form-group-xs">
									<label for="province-name">Province</label>
									<input name ="province-name" type="name" class="form-control" id="province-name" placeholder="Province" required autofocus/>
								</div>
							</div>


							<div class="row">
								<div class="form-group-xs">
									<label for="country-name">Country</label>
									<input name ="country-name" type="name" class="form-control" id="country-name" placeholder="Country" required autofocus/>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group-xs">
									 <label for="input-email">Email address</label>
									 <input name ="input-email" type="email" class="form-control" id="input-email" placeholder="abcd@gmail.com" required autofocus/>
								</div>
							</div>
							<div class="row">
								<div class="form-group-xs">
									 <label for="input-pw">Password</label>
									 <input name ="input-pw" type="password" class="form-control" id="input-pw" placeholder="**********" required/>
								</div>
							</div>
							<div class="row">
								<div class="form-group-xs">
									 <label for="input-pw-confirm">Confirm Password</label>
									 <input name ="input-pw-confirm" type="password" class="form-control" id="input-pw-confirm" placeholder="**********"required/>
								</div>
							</div>
<!-- 							<div class="row">
								<div class="form-group-xs">
								<label id = "input-type" name = "input-type" method="post" for="form-control">Type of Rater</label>
								<select name = "input-type" id = "input-type" method= "post" class="form-control">
									<option>Casual</option>
									<option>Blogger</option>
									<option>Verified Critic</option>
									<option>Other</option>
								</select>
								</div>
							</div> -->
							<div class="text-center">
								<button name="register" id="register" type="submit" class="btn btn-primary"><strong>Sign Up</strong></button>
							</div>
						</form>
						<?php

						if (array_key_exists('input-email', $_POST) && array_key_exists('input-pw', $_POST) && array_key_exists('input-pw-confirm', $_POST) && array_key_exists('first-name', $_POST) && array_key_exists('last-name', $_POST) &&
						 array_key_exists('city-name', $_POST) && array_key_exists('province-name', $_POST) && array_key_exists('country-name', $_POST)){
				
							//get form variables
							$getLastName = $_POST['last-name'];
						    $getCityName = $_POST['city-name'];
						    $getProvinceName = $_POST['province-name'];
						    $getCountryName = $_POST['country-name'];
							$getFirstName = $_POST['first-name'];
							$getEmail = $_POST['input-email'];
							$getPass = $_POST['input-pw'];
							$getConf = $_POST['input-pw-confirm'];
						


							require("connect.php");
							
							$query = "SELECT * FROM users WHERE users.firstname='$getFirstName'";
							$result = pg_query($query) or die('Query failed: ' . pg_last_error());
							
							$numRows = pg_num_rows($result);
							
							if(strpos($getFirstName,'@')){
								echo "Your name cannot contain the @ symbol";
							}
							else if($numRows == 0){
								
								$query = "SELECT * FROM users WHERE users.email='$getEmail'";
								$result = pg_query($query) or die('Query failed: ' . pg_last_error());
							
								$numRows = pg_num_rows($result);
								
								if($numRows == 0){
									if($getPass == $getConf){
										//connect to DB
										require("connect.php");
										//Current date in YYYY-MM-DD format
										//$currentDate = date('Y-m-d');
										pg_query("
											INSERT INTO users(userid, password, firstname, lastname, email, city, province, country)
											VALUES('21', '$getPass', '$getFirstName', '$getLastName' , '$getEmail', '$getCityName','$getProvinceName', '$getCountryName');
										");
										
										echo "<p align='center'>Welcome <b> $getFirstName </b> you are now registered. <a href= './login.php'> Continue </a></p>";
									}
									else{
										echo "<p class='error'>Your password and confirmation do not match.</p>";
									}
								}
								else{
									echo "<p class='error'>That email is already taken please enter another</p>";

								}
							}
							else {
								echo "<p class='error'>That name is already taken please enter another</p>";
							}
						}
						?>
					</div>
				</div>
			</div>
	</div>
</div>

</body>
</html>