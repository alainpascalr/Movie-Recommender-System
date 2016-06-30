<!DOCTYPE html>
<?php 
	session_start();
	$name = "";
	$userid = "";
	if(isset($_GET['movieid'])){
		$movieid = $_GET['movieid']; 
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
	$query = "SELECT M.DateReleased, D.FirstName, D.LastName, D.Country, S.Name, S.Country, A.FirstName, A.LastName
				FROM Director D, Movie M, Studio S, Directs DS, Sponsors SP, Actor A, Actorplays AP
				WHERE M.MovieID = $movieid
				AND M.MovieId = DS.MovieID
				AND DS.DirectorID = D.DirectorID
				AND M.MovieID = SP.MovieID
				AND SP.StudioID = S.StudioID
				AND M.MovieID = AP.MovieID";

				$result = pg_query($link,$query);
				$stmt = pg_prepare($link, 'ps',$query);	
	 ?>

	 <?php  

	 	require('connect.php');
	 	$query1 = "SELECT name, moviepic, language, trailer
		From Movie
		WHERE MovieId= $movieid ";
		$result1 = pg_query($link,$query1);
		$stmt1 = pg_prepare($link, 'pss',$query1);	

	  ?>

</head>

<body style="background-color: #212121">
<?php while($row = pg_fetch_array($result)){ 
		while ($row1 = pg_fetch_array($result1)) {?>

<h1 id="movietitle"><?php echo $row1[0] ; ?></h1>
<h5 id="movietitle">Released date: <?php echo $row[0]; ?></h5>
<div id="parent">
	<div id="moviepicture">
		<img src = "<?php  echo $row1[1]; ?>" alt = "Generic placeholder thumbnail">	
	</div>
	<div id="moviedetails">	
		<h3 id="moviesubtitle">Director:</h3>
		<h5 id="details"> <?php echo $row[1]; echo " ".$row[2]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3 id="moviesubtitle">Actor(s):</h3>
		<h5 id="details"> <?php echo $row[6]; echo " ".$row[7]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3 id="moviesubtitle">Studio:</h3>
		<h5 id="details"> <?php echo $row[4]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">

		<h3 id="moviesubtitle">Language:</h3>
		<h5 id="details"><?php echo $row1[2]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">


		<h3 id="moviesubtitle">Country:</h3>
		<h5 id="details"> <?php echo $row[5]; ?></h5>
		<hr style="display: block; height: 1px; border: 0;  border-top: 1px solid #0288D1; margin: 1em 0;    padding: 0; ">
		
		<h3 id="moviesubtitle">Trailer:</h3>
		<div style="overflow:hidden;height:478px;width:850px;"><div id="youtube_canvas" style="height:478px;width:850px;"><iframe style="height:478px;width:850px;border:0;" frameborder="0" src="<?php echo $row1[3];?>?hl=en&amp;autoplay=0&amp;cc_load_policy=0&amp;loop=0&amp;iv_load_policy=0&amp;fs=0&amp;showinfo=0"></iframe></div><a class="youtube-embed-code" href="http://www.tubeembed.com" id="get-youtube-data">tubeembed</a><style>#youtube_canvas img{max-width:none!important;background:none!important}</style></div>

	</div> 
</div>
 <?php  }} ?>

<div id="recommended">
	<h2 id="movietitle" style="padding-top: 5px">You might also like</h2>

<div id="recommendedmoviesection">
	<img src="media/movies/theamazingspiderman.jpg" height="300" width="200">
	<h5 style="color: #FFFFFF">Movie Title</h5>
            
    <a href = "#" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
        More details
    </a>
</div>
</div>


</body>