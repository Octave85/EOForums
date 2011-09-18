<?php
error_reporting(E_ALL);
define('INC', 1);

require_once('inc/config.php');

$this_forum = new Forum($dbh, $tpl);

if ($this_forum->get('fid', 'num')) { // validate fid's presence and numerical-ness
	$this_forum->set_fid($_GET['fid']); // specify $_GET['fid'] as the current fid
} else {
	$this_forum->error('info', 'forumdisplay_invalidfid'); // if not valid, display error
}

$thread_lister = new Thread_list($dbh, $tpl);
$forum_lister = new Index($dbh, $tpl);


//die(print_r($this_forum->generate_navbits()));
// generate and assign navbit data
$navbits = $this_forum->generate_navbits();
$this_forum->add(array('navbits' => $navbits));

$subforums = $forum_lister->fetch_child_forums($this_forum->forum_data['fid']);

// central control structure: whether current forum is a category or a normal forum
switch ($this_forum->forum_data['forumtype']) {
	case 0:
	case 2:
		
		$this_forum->add(array('subforums' => $subforums));

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

		if ( ! empty($subforums)) {
			//die(print_r($cat_subforums));
			$this_forum->push('category_display.tpl', array('subforums' => $subforums));
		} else {
			$this_forum->error('info', 'categorydisplay_nosubforums');
		}

		die();
		break;
	}

?>