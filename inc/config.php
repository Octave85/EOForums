<?php
session_set_cookie_params(31556926); //1 year
session_name('forum');
session_start();

if (isset($_COOKIE['forum']))
	setcookie('forum', $_COOKIE['forum'], time() + 31556926, "/");

/*require_once('inc/Authentication.php'); //Authentication class
require_once('inc/Forum.php'); //Posting/fetching posts class
require_once('inc/User.php'); //Getting/changing User data class*/
require_once('inc/tpl_sys/Smarty.class.php'); //template system
require_once('inc/nbbc.php'); //BBCode parser
require_once('inc/Forum.php');

try {
	$dbh = new PDO('mysql:host=localhost;dbname=octvc_eoforums', 'octvc_eofuser', 'P*3NCqeva^,F');
} catch (PDOException $e) {
	die('Database connection error: ' . $e->getMessage());
}

//$auth = new Authentication($dbh);

$tpl = new Smarty;
$tpl->setTemplateDir('templates');
$tpl->setCompileDir('templates/c');
$tpl->setCacheDir('cache');

//debugging only for me
if ($_SERVER['REMOTE_ADDR'] == '173.76.250.62' || $_SERVER['REMOTE_ADDR'] == '71.75.45.50')
	$tpl->debugging = true;

$tpl->force_compile = true;
$tpl->caching = false;

function Redirect($url = "/") {
	header("Location: $url");
	die();
}

//Converts MySQL TimeStamp to Unix Time for use with Date();
function UnixTime($mysql_timestamp) {
	if (preg_match('/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/', $mysql_timestamp, $pieces)
	    || preg_match('/(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/', $mysql_timestamp, $pieces)) {
	        $unix_time = mktime($pieces[4], $pieces[5], $pieces[6], $pieces[2], $pieces[3], $pieces[1]);
	} elseif (preg_match('/\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2}/', $mysql_timestamp)
	    || preg_match('/\d{2}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2}/', $mysql_timestamp)
	    || preg_match('/\d{4}\-\d{2}\-\d{2}/', $mysql_timestamp)
	    || preg_match('/\d{2}\-\d{2}\-\d{2}/', $mysql_timestamp)) {
	        $unix_time = strtotime($mysql_timestamp);
	} elseif (preg_match('/(\d{4})(\d{2})(\d{2})/', $mysql_timestamp, $pieces)
	    || preg_match('/(\d{2})(\d{2})(\d{2})/', $mysql_timestamp, $pieces)) {
	        $unix_time = mktime(0, 0, 0, $pieces[2], $pieces[3], $pieces[1]);
	} else {
		$unix_time = 0;
	}
	return $unix_time;
}

function timeSincePost($l) { 
	$l = time() - strtotime($l);
	$y = array(31536000=>'Year', 
			2592000=>'Month',
			604800=>'Week',
			86400=>'Day',
			3600=>'Hour',
			60=>'Minute',
			1=>'Second'
		);
	
	foreach($y as $r => $q) {
		if ($l < $r) continue;
		$o = floor($l / $r);
		return $o . ' ' . $q . (($o > 1) ?'s Ago' : ' Ago');
	}
	return 'Just Now!';
}

function updateColumn($dbh, $table, $column, $value, $wherecolumn, $wherevalue) {
		$updateQuery = $this->prepare('UPDATE :table SET :column = :value WHERE :wherecolumn = :wherevalue');
		$updateQuery->bindParam(':table', $table);
		$updateQuery->bindParam(':column', $column);
		$updateQuery->bindParam(':value', $value);
		$updateQuery->bindParam(':wherecolumn', $wherecolumn);
		$updateQuery->bindParam(':wherevalue', $wherevalue);
		$updateQuery->execute();
		return $updateQuery->rowCount();
}


?>