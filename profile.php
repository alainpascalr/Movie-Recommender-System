<!DOCTYPE html>
<?php 
	session_start();
	$name = "";
	$userid = "";
	if(isset($_GET['movieid']) && $_GET['userid']){
		$movieid = $_GET['movieid']; 
		$userid = $_GET['userid'];
		echo $userid;
	}		
?>
<?php 
	$name = "";
	$userid = "";
	if(array_key_exists('name', $_SESSION) && array_key_exists('userid', $_SESSION)){
		$name = $_SESSION['name'];
		$userid = $_SESSION['userid'];
	}
		
?>

<html lang="en">
<head>
	<?php $page_title = "Movie Details" ?>	
	<?php include("includes/resources.php");?>
	<?php include ("includes/navbar2.php");?>

	<?php 
			require('connect.php');
			$query = "SELECT U.FirstName, U.LastName, P.Gender, P.AgeRange, U.Email, U.City, U.Province, U.Country, P.yearborn
			FROM Users U, Profile P
			WHERE U.UserID = $userid 
			AND U.UserID = P.UserID";

			$result = pg_query($link, $query);
			$stmt = pg_prepare($link, 'pss', $query);


 ?>

</head>

<body style="background-color: #212121">

	<h1 style="color: #FFFFFF; margin-left: 45px;">My Profile</h1><br>

	<div id="userpicturesection">
		<div id="userpicture">
			<img class="img-circle" src = "http://www.indo-anesthesia.org/Images/speaker/no-profile-img.gif" alt = "Generic placeholder thumbnail">	
		</div>

<?php while ($row=pg_fetch_array($result)) { ?>

	<div id="userdetails">	

		<h3>Name</h3>
		<h5><?php echo $row[0]; echo " ".$row[1]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3>Gender</h3>
		<h5><?php echo $row[2]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3>Age Range</h3>
		<h5><?php echo $row[3]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3>Email</h3>
		<h5><?php echo $row[4]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3>City, Province, Country</h3>
		<h5><?php  echo $row[5]; echo ", ".$row[6]; echo ", ".$row[7]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3>Year Born</h3>
		<h5><?php echo $row[8]; ?></h5>

	</div>
	<?php } ?>
	</div>

</body>