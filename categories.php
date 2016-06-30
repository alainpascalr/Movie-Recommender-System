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
	<?php $page_title = "Movie Details" ?>	
	<?php include("includes/resources.php");?>
	<?php include ("includes/navbar2.php");?>

	<?php 

	require('connect.php');
		$query1 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '1' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result1 = pg_query($link,$query1);
		$stmt1 = pg_prepare($link, 'ps1',$query1);	

	 ?>

	 	<?php 

	require('connect.php');
		$query2 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '2' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result2 = pg_query($link,$query2);
		$stmt2 = pg_prepare($link, 'ps2',$query2);	

	 ?>

	 	<?php 

	require('connect.php');
		$query3 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '3' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result3 = pg_query($link,$query3);
		$stmt3 = pg_prepare($link, 'ps3',$query3);	

	 ?>
	 	<?php 

	require('connect.php');
		$query4 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '4' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result4 = pg_query($link,$query4);
		$stmt4 = pg_prepare($link, 'ps4',$query4);	

	 ?>
	 	<?php 

	require('connect.php');
		$query6 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '6' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result6 = pg_query($link,$query6);
		$stmt6 = pg_prepare($link, 'ps6',$query6);	

	 ?>
	 	<?php 

	require('connect.php');
		$query7 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '7' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result7 = pg_query($link,$query7);
		$stmt7 = pg_prepare($link, 'ps7',$query7);	

	 ?>
	 	<?php 

	require('connect.php');
		$query8 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '8' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result8 = pg_query($link,$query8);
		$stmt8 = pg_prepare($link, 'ps8',$query8);	

	 ?>
	 	<?php 

	require('connect.php');
		$query9 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '9' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result9 = pg_query($link,$query9);
		$stmt9 = pg_prepare($link, 'ps9',$query9);	

	 ?>
	 	<?php 

	require('connect.php');
		$query10 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '10' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result10 = pg_query($link,$query10);
		$stmt10 = pg_prepare($link, 'ps10',$query10);	

	 ?>
	 	<?php 

	require('connect.php');
		$query11 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '11' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result11 = pg_query($link,$query11);
		$stmt11 = pg_prepare($link, 'ps11',$query11);	

	 ?>
	 	<?php 

	require('connect.php');
		$query12 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '12' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result12 = pg_query($link,$query12);
		$stmt12 = pg_prepare($link, 'ps12',$query12);	

	 ?>
	 	<?php 

	require('connect.php');
		$query13 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '13' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result13 = pg_query($link,$query13);
		$stmt13 = pg_prepare($link, 'ps13',$query13);	

	 ?>
	 	<?php 

	require('connect.php');
		$query14 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '14' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result14 = pg_query($link,$query14);
		$stmt14 = pg_prepare($link, 'ps14',$query14);	

	 ?>
	 	<?php 

	require('connect.php');
		$query15 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '15' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result15 = pg_query($link,$query15);
		$stmt15 = pg_prepare($link, 'ps15',$query15);	

	 ?>
	 	<?php 

	require('connect.php');
		$query16 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '16' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result16 = pg_query($link,$query16);
		$stmt16 = pg_prepare($link, 'ps16',$query16);	

	 ?>
	 	<?php 

	require('connect.php');
		$query17 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '17' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result17 = pg_query($link,$query17);
		$stmt17 = pg_prepare($link, 'ps17',$query17);	

	 ?>

	 	<?php 

	require('connect.php');
		$query18 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '18' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result18 = pg_query($link,$query18);
		$stmt18 = pg_prepare($link, 'ps18',$query18);	

	 ?>
	 	<?php 

	require('connect.php');
		$query19 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '19' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result19 = pg_query($link,$query19);
		$stmt19 = pg_prepare($link, 'ps19',$query19);	

	 ?>
	 	<?php 

	require('connect.php');
		$query20 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '20' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result20 = pg_query($link,$query20);
		$stmt20 = pg_prepare($link, 'ps20',$query20);	

	 ?>
	 	<?php 

	require('connect.php');
		$query21 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '21' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result21 = pg_query($link,$query21);
		$stmt21 = pg_prepare($link, 'ps21',$query21);	

	 ?>
	 	<?php 

	require('connect.php');
		$query22 = "SELECT M.MovieID, M.Name, M.MoviePic
		FROM Movie M, Topics T, MovieTopics MT
		WHERE T.TopicID = '22' 
		AND T.TopicID = MT.TopicID 
		AND MT.MovieID = M.MovieID";

		$result22 = pg_query($link,$query22);
		$stmt22 = pg_prepare($link, 'ps22',$query22);	

	 ?>


</head>

<body style="background-color: #212121">

<h2 style="color: #FFFFFF" id="categoryh2">Category</h2>

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" id="categorytitle">
          Action
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body" id="panelsection">

      <?php while($row1 = pg_fetch_array($result1)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row1[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row1[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row1[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>

      </div>
    </div>
  </div>

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="categorytitle">
          Adventure
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body" id="panelsection">

      <?php while($row2 = pg_fetch_array($result2)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row2[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row2[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row2[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>

      </div>
    </div>
  </div>

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" id="categorytitle">
          Comedy
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body" id="panelsection">
      <?php while($row3 = pg_fetch_array($result3)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row3[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row3[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row3[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


<div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour" id="categorytitle">
          Fantasy
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body" id="panelsection">
      <?php while($row4 = pg_fetch_array($result4)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row4[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row4[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row4[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


<div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingFive">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive" id="categorytitle">
          Drama
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
      <div class="panel-body"  id="panelsection">
      <?php while($row6 = pg_fetch_array($result6)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row6[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row6[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row6[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingSix">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix" id="categorytitle">
          Romance
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
      <div class="panel-body" id="panelsection">
      <?php while($row7 = pg_fetch_array($result7)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row7[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row7[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row7[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingSeven">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven" id="categorytitle">
          Crime
        </a>
      </h4>
    </div>
    <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
      <div class="panel-body" id="panelsection">
      <?php while($row8 = pg_fetch_array($result8)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row8[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row8[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row8[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingEight">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight" id="categorytitle">
          Triller
        </a>
      </h4>
    </div>
    <div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
      <div class="panel-body" id="panelsection">
      <?php while($row9 = pg_fetch_array($result9)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row9[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row9[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row9[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingNine">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine" id="categorytitle">
          Horror
        </a>
      </h4>
    </div>
    <div id="collapseNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNine">
      <div class="panel-body" id="panelsection">
      <?php while($row10 = pg_fetch_array($result10)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row10[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row10[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row10[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingTen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTen" aria-expanded="false" aria-controls="collapseTen" id="categorytitle">
          Animation
        </a>
      </h4>
    </div>
    <div id="collapseTen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTen">
      <div class="panel-body" id="panelsection">
      <?php while($row11 = pg_fetch_array($result11)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row11[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row11[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row11[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingEleven">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven" id="categorytitle">
          Sci-Fi
        </a>
      </h4>
    </div>
    <div id="collapseEleven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEleven">
      <div class="panel-body" id="panelsection">
      <?php while($row12 = pg_fetch_array($result12)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row12[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row12[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row12[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingTwelve">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve" id="categorytitle">
          Sport
        </a>
      </h4>
    </div>
    <div id="collapseTwelve" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwelve">
      <div class="panel-body" id="panelsection">
      <?php while($row13 = pg_fetch_array($result13)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row13[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row13[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row13[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingThirteen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen" id="categorytitle">
          Western
        </a>
      </h4>
    </div>
    <div id="collapseThirteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThirteen">
      <div class="panel-body" id="panelsection">
      <?php while($row14 = pg_fetch_array($result14)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row14[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row14[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row14[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingFourteen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen" id="categorytitle">
          Mystery
        </a>
      </h4>
    </div>
    <div id="collapseFourteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFourteen">
      <div class="panel-body" id="panelsection">
      <?php while($row15 = pg_fetch_array($result15)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row15[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row15[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row15[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>



  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingFifteen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen" id="categorytitle">
          Musical
        </a>
      </h4>
    </div>
    <div id="collapseFifteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFifteen">
      <div class="panel-body" id="panelsection">
      <?php while($row16 = pg_fetch_array($result16)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row16[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row16[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row16[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingSixteen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen" id="categorytitle">
          War
        </a>
      </h4>
    </div>
    <div id="collapseSixteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSixteen">
      <div class="panel-body" id="panelsection">
      <?php while($row17 = pg_fetch_array($result17)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row17[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row17[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row17[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingSeventeen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen" id="categorytitle">
          Documentary
        </a>
      </h4>
    </div>
    <div id="collapseSeventeen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeventeen">
      <div class="panel-body" id="panelsection">
      <?php while($row18 = pg_fetch_array($result18)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row18[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row18[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row18[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>

  <div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingEighteen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen" aria-expanded="false" aria-controls="collapseEighteen" id="categorytitle">
          History
        </a>
      </h4>
    </div>
    <div id="collapseEighteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEighteen">
      <div class="panel-body" id="panelsection">
      <?php while($row19 = pg_fetch_array($result19)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row19[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row19[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row19[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>



<div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingNineteen">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNineteen" aria-expanded="false" aria-controls="collapseNineteen" id="categorytitle">
          Family
        </a>
      </h4>
    </div>
    <div id="collapseNineteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNineteen">
      <div class="panel-body" id="panelsection">
      <?php while($row20 = pg_fetch_array($result20)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row20[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row20[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row20[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


<div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingTwenty">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwenty" aria-expanded="false" aria-controls="collapseTwenty" id="categorytitle">
          Film-noir
        </a>
      </h4>
    </div>
    <div id="collapseTwenty" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwenty">
      <div class="panel-body" id="panelsection">
      <?php while($row21 = pg_fetch_array($result21)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row21[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row21[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row21[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>


<div class="panel panel-default" id="categorypanel">
    <div class="panel-heading" role="tab" id="headingTwentyone">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwentyone" aria-expanded="false" aria-controls="collapseTwentyone" id="categorytitle">
          Biography
        </a>
      </h4>
    </div>
    <div id="collapseTwentyone" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwetyone">
      <div class="panel-body" id="panelsection">
      <?php while($row22 = pg_fetch_array($result22)){ ?>
		<div id="categorymoviesection">
			<img src="<?php echo $row22[2]; ?>" height="300" width="200">
			<h5 style="color: #FFFFFF"><?php echo $row22[1]; ?></h5>
		            
		    <a href = "moviedetails.php?movieid=<?php echo $row22[0];?>" class = "btn btn-default" id="btndefault" role = "button" style="width: 200px">
		        More details
		    </a>
		</div>
		<?php  } ?>
      </div>
    </div>
  </div>

</div>

</body>