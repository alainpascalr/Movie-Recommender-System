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
	<?php $page_title = "Home" ?>
	<?php include("includes/resources.php");?>
	<?php include ("includes/navbar2.php");?>
      <?php
      require('connect.php');
		$query = "SELECT M.MovieID, M.Name, rank.average, M.moviepic
					FROM (
					    SELECT SUM(W.Rating)/count(W.Rating) AS average, M.MovieID AS mo
					    FROM Movie M, Watches W
					    WHERE M.MovieID = W.MovieID
					    GROUP BY M.MovieID)rank, Movie M
					WHERE M.MovieID = rank.mo 
					GROUP BY rank.average, rank.mo, M.Name, M.MovieID, M.moviepic
					ORDER BY rank.average DESC
					LIMIT 10";

		$result = pg_query($link,$query);
		$stmt = pg_prepare($link, 'ps',$query);	

      ?>

</head>

<body style="background-color: #212121; padding-bottom: 30px;">
	<div class="container">

	<h1 style="color: #FFFFFF; margin-left: -45px;"> 
	Top rated movies:
	</h1>

		<div class="row clearfix">

	<!--Thumbnail for the movies-->

	<div class = "row"  id="thumbnailsection">
   
   <?php while($row = pg_fetch_array($result)) { ?>


   <div class = "col-sm-6 col-md-3" id="indivthumbnail" >
      <div class = "thumbnail" id="indivthumbnail2" >
         <img src = "<?php  echo $row[3]; ?> " alt = "Generic placeholder thumbnail">
      </div>
      
      <div class = "caption" id="caption2">
         <h4> <?php echo $row[1]; ?> </h4>
         <p>Rating: <?php  echo $row[2];   ?> </p>
         
         <p>
         <?php if (1==1){?>
            <a href = "watchedlist.php?movieid=<?php echo $row[0];?>&userid=<?php echo $userid ?>" class = "btn btn-primary" id="btnprimary" role = "button">
               Watched
            </a> 
         <?php } else { ?>
            <a href = "watchedlist.php?movieid=<?php echo $row[0];?>&userid=<?php echo $userid ?>" class = "btn btn-primary" id="btnprimary" role = "button">
               Add to watchlist
            </a> 
            <?php } ?>
            <a href = "moviedetails.php?movieid=<?php echo $row[0];?>" class = "btn btn-default" id="btndefault" role = "button">
               More details
            </a>
         </p>
         
      </div>
   </div>

 <?php  } ?>
  </div>
  </div>
  </div>

</body>
</html>