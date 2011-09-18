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

	<title>EOForums Index</title>
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
	
	<div class="listheader">
		<h2>{$forumname}</h2>
		<a href="#toggle" class="toggle">Toggle</a>
	</div>
	<table class="forumlist" cellspacing="0" border="0">
	{foreach $subforums as $subforum}	
		
		{if $subforum.forumtype eq 0}
		<tr>
			<td class="icon"><img src="images/subforum.png" alt="subforum" /></td>
			<td class="info"><h3><a href="forumdisplay.php?fid={$subforum.fid}">{$subforum.forumname}</a></h3><div class="meta">{$subforum.forumdescription}

			{if $subforum.haschildren eq 1}
			<ol class="subforums">
				{foreach $subforum.children as $child}
				<li><a href="forumdisplay.php?fid={$child}">{$subforums.$child.forumname}</a></li>
				{/foreach}
			</ol>
			{/if}
			</div></td>
			<td class="lastpost"><a href="#">{$subforum.lastposttitle}</a><br/><span>by <a href="#">{$subforum.lastposterusername}</a> 1 Minutes Ago</span></td>
			<td class="threads">{$subforum.forumthreads}</td>
			<td class="posts">{$subforum.forumposts}</td>
		</tr>
		{/if}

	{/foreach}
	</table>	
	<div class="listfooter">
		&nbsp;
	</div>
</div>
</body>
</html>