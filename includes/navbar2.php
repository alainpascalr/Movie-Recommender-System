<?php 
	if(session_id() == '') {
	session_start();
	$name = "";
	$userid = "";
	if(array_key_exists('name', $_SESSION) && array_key_exists('userid', $_SESSION)){
		$name = $_SESSION['name'];
		$userid = $_SESSION['userid'];
	}
}
		
?>


<?php
if($name == "" || $userid == ""){
echo '
<!-- Navigation Bar -->
<nav id="indexnavbar" class="navbar navbar-default" role="navigation">
	<div class="navbar-collapse collapse">
		<!-- Left -->
		<ul class="nav navbar-nav navbar-left">
			<li><a href="index.php">';
					if ($page_title == "Home")
						echo "<strong>";

					echo "Home";

					if ($page_title == "Home")
						echo "</strong>";
		echo '						
			</a></li>
		</ul>

	<div class="dropdown" id="dropdown">
	  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownBtnLeft" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	    Browse By
	    <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	  <li class="dropdown-header">Categories</li>
	    <li role="separator" class="divider"></li>
	    <li><a href="#">Top 10 Rated</a></li>
	  </ul>
	</div>

		<!-- Right -->
		<ul class="nav navbar-nav navbar-right" id="navbar-right">
			<li><a href="register.php">';
					if ($page_title == "Sign Up")
						echo "<strong>";
			echo 'Sign Up';
					if ($page_title == "Sign Up")
							echo "</strong>";
			echo '</a></li>
		</ul>
	</div>	
</nav>
';
}
else{
echo '
<!-- Navigation Bar -->
<nav id="indexnavbar" class="navbar navbar-default" role="navigation">
	<div class="navbar-collapse collapse">
		<!-- Left -->
		<ul class="nav navbar-nav navbar-left">
			<li><a href="index.php">';
					if ($page_title == "Home")
						echo "<strong>";

					echo "Home";

					if ($page_title == "Home")
						echo "</strong>";
		echo '						
			</a></li>
		</ul>

			<div class="dropdown" id="dropdown">
	  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownBtnLeft" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	    Browse By
	    <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	    <li><a href="categories.php">Categories</a></li>


	    <li role="separator" class="divider"></li>
	    <li><a href="allmovies.php">All Movies</a></li>
	  </ul>
	</div>
		<!-- Right -->

		<ul class="nav navbar-nav navbar-right" id="navbar-right2">
			<li><a href="logout.php">';
					if ($page_title == "Logout")
						echo "<strong>";
			echo '
				Logout';
					if ($page_title == "Logout")
						echo "</strong>";
			$tmp = $_SESSION['name'];
			$tmp1 = $_SESSION['userid'];
			echo "
			</a></li>
			<li><a href='profile.php?userid=$tmp1'>";
					if ($page_title == "Profile")
						echo "<strong>";
			echo "
				$tmp";
					if ($page_title == "Profile")
						echo "</strong>";
			echo '</a></li>
		</ul>
	</div>	
</nav>
';
}
?>