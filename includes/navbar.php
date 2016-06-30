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
<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-collapse collapse">

		<!-- Right -->
		<ul class="nav navbar-nav navbar-right">
			<li><a href="login.php">';
					if ($page_title == "Login")
						echo "<strong>";
			echo '
				Login';
					if ($page_title == "Login")
						echo "</strong>";
			echo '	
			</a></li>
			<li><a href="register.php">';
					if ($page_title == "Sign Up")
						echo "<strong>";
			echo '
				Sign Up';
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
<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-collapse collapse">

		<!-- Left -->
		<!-- Right -->
		<ul class="nav navbar-nav navbar-right">
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
