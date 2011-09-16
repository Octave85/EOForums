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
	{$firstCat = 1}
	{foreach $cats as $cat}
	
	<div class="{if $firstCat eq 1}listheader{else}listheader middle{/if}">
		<h2>{$cat.forumname}</h2>
		<a href="#toggle" class="toggle">Toggle</a>
	</div>
	<table class="forumlist" cellspacing="0" border="0">
	{$firstCat = 0}
	{foreach $cat.children as $child}	
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="#">{$forums.$child.forumname}</a></h3><div class="meta">{$forums.$child.forumdescription}</div></td>
			<td class="lastpost"><a href="#">{$forums.$child.lastposttitle}</a><br/><span>by <a href="#">{$forums.$child.lastposterusername}</a> 1 Minutes Ago</span></td>
			<td class="threads">{$forums.$child.threads}</td>
			<td class="posts">{$forums.$child.posts}</td>
		</tr>
	

	{/foreach}
	</table>
{/foreach}	
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