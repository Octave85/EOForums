<?php
error_reporting(E_ALL);
define('INC', 1);

require_once('inc/config.php');

//$forum = new Forum($dbh, $auth);

//$tpl->assign('User', $auth->User()); #Assign current user data

#
/*if ($auth->Usergroup == 4) {
	$tpl->display('banned.tpl');
	die();
}*/

$board = new Index($dbh, $tpl);

$forumData = $board->fetch_all_forums();
$pForumData = array(
	"cats" => $forumData[0],
	"forums" => $forumData[1]
);
$board->push('index.tpl', $pForumData);

?>