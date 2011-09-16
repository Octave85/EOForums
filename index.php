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

$forumData = $eoforums->fetch_all_forums();
$pForumData = array(
	"cats" => $forumData[0],
	"forums" => $forumData[1]
);
$eoforums->push('index.tpl', $pForumData);

?>