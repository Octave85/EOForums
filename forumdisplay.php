<?php
error_reporting(E_ALL);
define('INC', 1);

require_once('inc/config.php');

$thread_lister = new Thread_list($dbh, $tpl);

if (!empty($_GET['fid'])) {
	if (is_numeric($_GET['fid'])) {
		$threads = $thread_lister->fetch_threads('thread_list', array('fid' => $_GET['fid'], 'perpage' => 20));
		$thread_lister->push('thread_list.tpl', array('threads' => $threads));
		die();
	} else {
		die("Wrong idiot.");
	}
}
?>