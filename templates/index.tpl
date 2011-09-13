<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	<link rel="icon" type="image/png" href="icons/favicon.png" />

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/valobb.js"></script>

	<title>ValoBB Index</title>
</head>
<body>
<div id="container">
	<div id="header">
		<h1>Forum Header</h1>
		<ul class="breadcrumbs">
			<li><a href="#">Home</a> > </li>
			<li><a href="#">Forum</a> > </li>
			<li><a href="#">Facepunch</a> > </li>
			<li><a href="#">Hardware and Software</a></li>
		</ul>
		<a class="username" href="#">Username</a>
		<div class="controls">
			<a class="pm" href="#">PM</a>
			<a class="more" href="#">More</a>
		</div>
		<ul class="navigation">
			<li class="tick"><a href="#">Ticker</a></li>
			<li class="event"><a href="#">Events</a></li>
			<li class="search"><a href="#">Search</a></li>
			<li class="more"><a href="#">More</a></li>
		</ul>
	</div>
	<div class="notification information">
		<span class="close">Close</span>
		<p>Hey there! If this is your first visit, be sure to check out the <a href="#">FAQ</a>. You are required to <a href="#">Register</a> before you can post. Dive right into the community below - discussion is categorized into forums and subforums; find a topic you're interested in and get posting!</p>
	</div>
	
	{foreach $forum in $forums}

	{if $forum.forumtype eq 1}
	<div class="listheader">
		<h2>{$forum.0.forumname}</h2>
		<a href="#toggle" class="toggle">Toggle</a>
	</div>
	{/if}

	{if $forum.forumtype eq 0 && $forum.parentid eq ???}
		
	<table class="forumlist" cellspacing="0" border="0">
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="#">{$forums.1.forumname}</a></h3><div class="meta">{$forums.1.forumdescription}</div></td>
			<td class="lastpost"><a href="#">The Boner-Shrinking Thread -...</a><br/><span>by <a href="#">glassy</a> 1 Minutes Ago</span></td>
			<td class="threads">24,492</td>
			<td class="posts">1,978,499</td>
		</tr>
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="#">Film and Television</a></h3><div class="meta">Discuss your favorite movies and TV shows</div></td>
			<td class="lastpost"><a href="#">Doctor Who V4 - Hello Sweetie...</a><br/><span>by <a href="#">DainBramageStudios</a> 2 Minutes Ago</span></td>
			<td class="threads">1,917</td>
			<td class="posts">117,231</td>
		</tr>
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="#">Hardware and Software</a></h3><div class="meta">A forum dedicated to hardware and software, gadgets and gizmos.
				<ol class="subforums"><li><a href="#">Technical Support</a></li><li><a href="#">Programming</a></li><li><a href="#">Windows</a></li><li><a href="#">Web Development</a></li><li><a href="#">Linux</a> </li><li><a href="#">Apple</a></li><li><a href="#">PC Building</a></li></ol></div></td>
			<td class="lastpost"><a href="#">Post Your Desktop v7</a><br/><span>by <a href="#">BreenIsALie</a> 7 Minutes Ago</span></td>
			<td class="threads">26,433</td>
			<td class="posts">525,597</td>
		</tr>
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="#">Fast Threads</a></h3><div class="meta">This is for your "Post Your" and "Question" threads.</div></td>
			<td class="lastpost"><a href="#">The Gift Giving Thread, Early...</a><br/><span>by <a href="#">Fusilero1</a> 1 Minutes Ago</span></td>
			<td class="threads">22,891</td>
			<td class="posts">1,805,659</td>
		</tr>
	</table>
	<div class="listheader middle">
		<h2>Games</h2>
		<a href="#toggle" class="toggle">Toggle</a>
	</div>
	<table class="forumlist" cellspacing="0" border="0">
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="#">General Games Discussion</a></h3><div class="meta">I bet you can't guess what you're meant to talk about in here.
				<ol class="subforums"><li><a href="#">Games In Progress</a></li></ol></div></td>
			<td class="lastpost"><a href="#">World of Tanks V4 - World of...</a><br/><span>by <a href="#">Awesomecaek</a> 2 Minutes Ago</span></td>
			<td class="threads">11,638</td>
			<td class="posts">1,075,047</td>
		</tr>
	</table>
	<div class="listfooter">
		&nbsp;
	</div>
</div>
<div id="footer">
	<div class="inner">
		<div class="forumbox">
			<h4>ValoBB</h4>
			<p>&copy; 2010. All rights reserved</p>
			<p class="small">
				All times are GMT +8; 3:25PM.<br/>
				Server IP: 127.0.0.1
			</p>
			<ul class="links">
				<li><a href="#">Archive</a></li>
				<li><a href="#">Moderators</a></li>
				<li><a href="#">Top</a></li>
			</ul>
		</div>
		<div class="statistics">
			<h4 class="stats">Forum Statistics</h4>
			<ul>
				<li>
					<ul class="row">
						<li>Threads:</li>
						<li>264,331</li>
					</ul>
					<ul class="row">
						<li>Posts:</li>
						<li>10,488,096</li>
					</ul>
					<ul class="row">
						<li>Members:</li>
						<li>168,553</li>
					</ul>
					<ul class="row">
						<li>Active Members:</li>
						<li>23,157</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="fbox">
			<h4 class="users">30 users online (4 guests)</h4>
			<ol>
				<li><a href="#">Pruneyman</a></li>
				<li><a href="#">jio14001</a></li>
				<li><a href="#">sniperlover</a></li>
				<li><a href="#" class="gold">Person557</a></li>
				<li><a href="#">CAT17</a></li>
				<li><a href="#">MarkJaw</a></li>
				<li><a href="#">idome</a></li>
				<li><a href="#">Nasser</a></li>
				<li><a href="#">Sir Spicy Buns</a></li>
				<li><a href="#">duif</a></li>
				<li><a href="#">Crowski</a></li>
				<li><a href="#" class="gold">bepassley</a></li>
				<li><a href="#">reywilnc</a></li>
				<li><a href="#">Rsill</a></li>
				<li><a href="#">cr2142</a></li>
				<li><a href="#" class="gold">David29</a></li>
				<li><a href="#" class="gold">Mister Royzo</a></li>
				<li><a href="#">DeveloperConsol</a></li>
				<li><a href="#">lasan</a></li>
				<li><a href="#">Necrotic Fever</a></li>
				<li><a href="#">teh_1337_r0XX0r</a></li>
				<li><a href="#">TheSniper9</a></li>
				<li><a href="#">Pandz</a></li>
				<li><a href="#" class="gold">Scoooby</a></li>
				<li><a href="#">dittojam</a></li>
				<li><a href="#">blobman570</a></li>
			</ol>
		</div>
	</div>
</div>
</body>
</html>