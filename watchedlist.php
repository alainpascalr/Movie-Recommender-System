<?php 
	require('connect.php');
	session_start();
	$name = "";
	$userid = "";
	if(isset($_GET['movieid'])){
		$movieid = $_GET['movieid']; 
		$userid = $_GET['userid']; 

		echo $movieid;


		$query = "INSERT INTO watches (movieid, userid, datewatched) VALUES ('$movieid', '$userid', now())"; 
		$result = pg_query($link,$query);
		$stmt = pg_prepare($link, 'ps',$query);	
		header("Location: index.php");

	}		
?>


