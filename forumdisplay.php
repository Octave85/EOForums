<?php
error_reporting(E_ALL);
define('INC', 1);

require_once('inc/config.php');

$this_forum = new Forum($dbh, $tpl);

if ($this_forum->get('fid', 'num')) {
	$this_forum->set_fid($_GET['fid']);
} else {
	$this_forum->error('info', 'forumdisplay_invalidfid');
}

$thread_lister = new Thread_list($dbh, $tpl);

//die(print_r($this_forum->generate_navbits()));
$navbits = $this_forum->generate_navbits();
$this_forum->add(array('navbits' => $navbits));

switch ($this_forum->forum_data['forumtype']) {
	case 0:
	case 2:
		$threads = $thread_lister->fetch_threads('thread_list', array('fid' => $_GET['fid'], 'perpage' => 20));

		if ( ! empty($this_forum->forum_data)) {
			$this_forum->add(array('forumname' => $this_forum->forum_data['forumname']));
		} else {
			$this_forum->error('info', 'forumdisplay_invalidfid');
		}

		$thread_lister->push('thread_list.tpl', array('threads' => $threads));
		die();
		break;
	case 1:
		$this_forum->add(array('forumname' => $this_forum->forum_data['forumname']));

		$category = new Index($dbh, $tpl);
		$cat_subforums = $category->fetch_child_forums($this_forum->forum_data['fid']);
		if ( ! empty($cat_subforums)) {
			//die(print_r($cat_subforums));
			$this_forum->push('category_display.tpl', array('subforums' => $cat_subforums));
		} else {
			$this_forum->error('info', 'categorydisplay_nosubforums');
		}

		die();
		break;
	}

?>