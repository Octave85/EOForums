<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	<link rel="icon" type="image/png" href="icons/favicon.png" />

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>

	<title>{$forumname}</title>
</head>
<body>
<div id="container">
	<div id="header">
		<h1>{$forumname}</h1>
		<ul class="breadcrumbs">
			<li><a href="./">Home</a></li> >
			{foreach $navbits as $navbit}
			<li><a href="forumdisplay.php?fid={$navbit@key}">{$navbit}</a></li>{if $navbit@last}{else} >{/if} 
			{/foreach}
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
	{foreach $subforums as $subforum}
	{if $subforum@first}
	<div class="listheader">
		<h2>Sub-Forums</h2>
	</div>
	<table class="forumlist" cellspacing="0" border="0" valign="top">
	{/if}
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum"></td>
			<td class="info"><h3><a href="forumdisplay?fid={$subforum.fid}">{$subforum.forumname}</a></h3><div class="meta">{$subforum.forumdescription}</div></td>
			<td class="lastpost"><a href="/posts/{$subforum.lastpostpid}">{$subforum.lastposttitle}</a><br/><span>by <a href="#">{$subforum.lastposterusername}</a> {$subforum.lastpost}</span></td>
			<td class="threads"><a href="#">{$subforum.forumthreads}</a></td>
			<td class="posts"><a href="#">{$subforum.forumposts}</a></td>
		</tr>
	{if $subforum@last}
	</table>
	<div class="listheader middle">
	{/if}
	{foreachelse}
	<div class="listheader">
	{/foreach}
		<a class="button" href="#">New Thread</a>
		<a class="button" href="#">Subscribe</a>
		<div class="pagination">
			<div class="description">Page 1 of 3</div>
			<ol>
				<li class="selected"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">></a></li>
				<li><a href="#">Last »</a></li>
			</ol>
		</div>
	</div>
	<table class="threadlist" cellspacing="0" border="0" valign="top">
		{foreach $threads as $thread}
		<tr>
			<td class="icon"><img src="images/posticons/default.png" alt="PostIcon"/></td>
			<td class="info"><h3><a href="threads/{$thread.tid}">{$thread.threadtitle}</a></h3><div class="meta"><a href="users/{$thread.threadposter}">Octave</a> <span>3 reading</span></div></td>
			<td class="lastpost"><a href="users/{$thread.lastposterid}">Erp</a><br/><span>{$thread.lastpost}</span></td>
			<td class="replies"><a href="#">{$thread.threadposts}</a></td>
			<td class="views"><a href="#">{$thread.threadviews}</a></td>
		</tr>
		{foreachelse}
			<span style="margin: auto;text-align:center;font-weight:bold">There are no posts in this forum in the last 30 days.</span>
		{/foreach}
		
	</table>
	<div class="listfooter">
		<a class="button" href="#">New Thread</a>
		<a class="button" href="#">Subscribe</a>
		<div class="pagination">
			<div class="description">Page 1 of 3</div>
			<ol>
				<li class="selected"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">></a></li>
				<li><a href="#">Last »</a></li>
			</ol>
		</div>
	</div>
</div>
</body>
</html>