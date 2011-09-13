<?php
error_reporting(E_ALL);

require_once('inc/config.php');

//$forum = new Forum($dbh, $auth);

//$tpl->assign('User', $auth->User()); #Assign current user data

#
/*if ($auth->Usergroup == 4) {
	$tpl->display('banned.tpl');
	die();
}*/

$eoforums = new Forum($dbh, $tpl);
$eoforums->push('index.tpl', array("forums" => $eoforums->fetch_all_forums()));

?>