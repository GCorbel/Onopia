<!doctype html>
<!--[if lt IE 8 ]><html lang="en" class="no-js ie ie7"><![endif]-->
<!--[if IE 8 ]><html lang="en" class="no-js ie"><![endif]-->
<!--[if (gt IE 8)|!(IE)]><!--><html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>Constellation Admin Skin</title>
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!--
	
	Note: this file is a variant of the main index.php file,
	just to show the markup required to use the aletrnative menu style
	See documentation for more details
	
	-->
	
	<!-- Global stylesheets -->
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/common.css" rel="stylesheet" type="text/css">
	<link href="css/form.css" rel="stylesheet" type="text/css">
	<link href="css/standard-alt.css" rel="stylesheet" type="text/css">
	
	<!-- Comment/uncomment one of these files to toggle between fixed and fluid layout -->
	<!--<link href="css/960.gs.css" rel="stylesheet" type="text/css">-->
	<link href="css/960.gs.fluid.css" rel="stylesheet" type="text/css">
	
	<!-- Custom styles -->
	<link href="css/simple-lists.css" rel="stylesheet" type="text/css">
	<link href="css/block-lists.css" rel="stylesheet" type="text/css">
	<link href="css/planning.css" rel="stylesheet" type="text/css">
	<link href="css/table.css" rel="stylesheet" type="text/css">
	<link href="css/calendars.css" rel="stylesheet" type="text/css">
	<link href="css/wizard.css" rel="stylesheet" type="text/css">
	<link href="css/gallery.css" rel="stylesheet" type="text/css">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="icon" type="image/png" href="favicon-large.png">
	
	<!-- Modernizr for support detection, all javascript libs are moved right above </body> for better performance -->
	<script src="js/libs/modernizr.custom.min.js"></script>
	
</head>

<body>
	
	<!-- Header -->
	
	<!-- Server status -->
	<header><div class="container_12">
		
		<p id="skin-name"><small>Constellation<br> Admin Skin</small> <strong>1.2</strong></p>
		<div class="server-info">Server: <strong>Apache 2.2.14</strong></div>
		<div class="server-info">Php: <strong>5.3.1</strong></div>
		
	</div></header>
	<!-- End server status -->
	
	<!-- Logo section -->
	<div id="header-bg">
		<img src="images/your-logo.png" width="210" height="40">
	</div>
	
	<!-- Sub nav -->
	<div id="sub-nav"><div class="container_12">
		
		<ul>
			<li class="current"><a href="#" title="Dashboard">Dashboard</a></li>
			<li><a href="#" title="My profile">My profile</a></li>
			<li class="menu-opener"><a href="#" title="My settings">My settings</a>
				<div class="menu-arrow">
					<img src="images/menu-open-arrow.png" width="16" height="16">
				</div>
				<div class="menu">
					<ul>
						<li class="icon_address"><a href="#">Browse by</a>
							<ul>
								<li class="icon_blog"><a href="#">Blog</a>
									<ul>
										<li class="icon_alarm"><a href="#">Recents</a>
											<ul>
												<li class="icon_building"><a href="#">Corporate blog</a></li>
												<li class="icon_newspaper"><a href="#">Press blog</a></li>
											</ul>
										</li>
										<li class="icon_building"><a href="#">Corporate blog</a></li>
										<li class="icon_computer"><a href="#">Support blog</a></li>
										<li class="icon_search"><a href="#">Search...</a></li>
									</ul>
								</li>
								<li class="icon_server"><a href="#">Website</a></li>
								<li class="icon_network"><a href="#">Domain</a></li>
							</ul>
						</li>
						<li class="icon_export"><a href="#">Export</a>
							<ul>
								<li class="icon_doc_excel"><a href="#">Excel</a></li>
								<li class="icon_doc_csv"><a href="#">CSV</a></li>
								<li class="icon_doc_pdf"><a href="#">PDF</a></li>
								<li class="icon_doc_image"><a href="#">Image</a></li>
								<li class="icon_doc_web"><a href="#">Html</a></li>
							</ul>
						</li>
						<li class="sep"></li>
						<li class="icon_refresh"><a href="#">Reload</a></li>
						<li class="icon_reset">Reset</li>
						<li class="icon_search"><a href="#">Search</a></li>
						<li class="sep"></li>
						<li class="icon_terminal"><a href="#">Custom request</a></li>
						<li class="icon_battery"><a href="#">Stats server load</a></li>
					</ul>
				</div>
			</li>
		</ul>
		
	</div></div>
	<!-- End sub nav -->
	
	<!-- Status bar -->
	<div id="status-bar"><div class="container_12">
	
		<ul id="status-infos">
			<li class="spaced">Logged as: <strong>Admin</strong></li>
			<li>
				<a href="#" class="button" title="5 messages"><img src="images/icons/fugue/mail.png" width="16" height="16"> <strong>5</strong></a>
				<div id="messages-list" class="result-block">
					<span class="arrow"><span></span></span>
					
					<ul class="small-files-list icon-mail">
						<li>
							<a href="#"><strong>10:15</strong> Please update...<br>
							<small>From: System</small></a>
						</li>
						<li>
							<a href="#"><strong>Yest.</strong> Hi<br>
							<small>From: Jane</small></a>
						</li>
						<li>
							<a href="#"><strong>Yest.</strong> System update<br>
							<small>From: System</small></a>
						</li>
						<li>
							<a href="#"><strong>2 days</strong> Database backup<br>
							<small>From: System</small></a>
						</li>
						<li>
							<a href="#"><strong>2 days</strong> Re: bug report<br>
							<small>From: Max</small></a>
						</li>
					</ul>
					
					<p id="messages-info" class="result-info"><a href="#">Go to inbox &raquo;</a></p>
				</div>
			</li>
			<li>
				<a href="#" class="button" title="25 comments"><img src="images/icons/fugue/balloon.png" width="16" height="16"> <strong>25</strong></a>
				<div id="comments-list" class="result-block">
					<span class="arrow"><span></span></span>
					
					<ul class="small-files-list icon-comment">
						<li>
							<a href="#"><strong>Jane</strong>: I don't think so<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Ken_54</strong>: What about using a different...<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Jane</strong> Sure, but no more.<br>
							<small>On <strong>Another post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Max</strong>: Have you seen that...<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Anonymous</strong>: Good luck!<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Sébastien</strong>: This sure rocks!<br>
							<small>On <strong>Another post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>John</strong>: Me too!<br>
							<small>On <strong>Third post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>John</strong> This can be solved by...<br>
							<small>On <strong>Another post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Jane</strong>: No prob.<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Anonymous</strong>: I had the following...<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Anonymous</strong>: Yes<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Lian</strong>: Please make sure that...<br>
							<small>On <strong>Last post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Ann</strong> Thanks!<br>
							<small>On <strong>Last post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Max</strong>: Don't tell me what...<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Gordon</strong>: Here is an article about...<br>
							<small>On <strong>My another post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Lee</strong>: Try to reset the value first<br>
							<small>On <strong>Last title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Lee</strong>: Sure!<br>
							<small>On <strong>Second post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Many</strong> Great job, keep on!<br>
							<small>On <strong>Third post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>John</strong>: I really like this<br>
							<small>On <strong>First title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Paul</strong>: Hello, I have an issue with...<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>June</strong>: Yuck.<br>
							<small>On <strong>Another title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Jane</strong>: Wow, sounds amazing, do...<br>
							<small>On <strong>Another title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Esther</strong>: Man, this is the best...<br>
							<small>On <strong>Another post</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>Max</strong>: Thanks!<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="#"><strong>John</strong>: I'd say it is not safe...<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
					</ul>
					
					<p id="comments-info" class="result-info"><a href="#">Manage comments &raquo;</a></p>
				</div>
			</li>
			<li><a href="login.php" class="button red" title="Logout"><span class="smaller">LOGOUT</span></a></li>
		</ul>
		
		<!-- v1.5: you can now add class red to the breadcrumb -->
		<ul id="breadcrumb">
			<li><a href="#" title="Home">Home</a></li>
			<li><a href="#" title="Dashboard">Dashboard</a></li>
		</ul>
	
	</div></div>
	<!-- End status bar -->
	
	<div id="header-shadow"></div>
	<!-- End header -->
	
	<!-- Always visible control bar -->
	<div id="control-bar" class="grey-bg clearfix"><div class="container_12">
	
		<div class="float-left">
			<button type="button"><img src="images/icons/fugue/navigation-180.png" width="16" height="16"> Back to list</button>
		</div>
		
		<div class="float-right"> 
			<button type="button" disabled="disabled">Disabled</button>
			<button type="button" class="red">Cancel</button> 
			<button type="button" class="grey">Reset</button> 
			<button type="button"><img src="images/icons/fugue/tick-circle.png" width="16" height="16"> Save</button>
		</div>
			
	</div></div>
	<!-- End control bar -->
	
	<!-- Content -->
	<article class="container_12">
		
		<section class="grid_4">
			<!--<div class="block-border"><div class="block-content">-->
				<h1>Favourites</h1>
				
				<ul class="favorites no-margin with-tip" title="Context menu available!">
					
					<li>
						<img src="images/icons/web-app/48/Info.png" width="48" height="48">
						<a href="#">Settings<br>
						<small>System &gt; Settings</small></a>
						<ul class="mini-menu">
							<li><a href="#" title="Move down"><img src="images/icons/fugue/arrow-270.png" width="16" height="16"></a></li>
							<li><a href="#" title="Delete"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"> Delete</a></li>
						</ul>
					</li>
					
					<li>
						<img src="images/icons/web-app/48/Line-Chart.png" width="48" height="48">
						<a href="#">Bandwidth usage<br>
						<small>Stats &gt; Server &gt; Bandwidth usage</small></a>
						<ul class="mini-menu">
							<li><a href="#" title="Move up"><img src="images/icons/fugue/arrow-090.png" width="16" height="16"></a></li>
							<li><a href="#" title="Move down"><img src="images/icons/fugue/arrow-270.png" width="16" height="16"></a></li>
							<li><a href="#" title="Delete"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"> Delete</a></li>
						</ul>
					</li>
					
					<li>
						<img src="images/icons/web-app/48/Modify.png" width="48" height="48">
						<a href="#">New post<br>
						<small>Write &gt; New post</small></a>
						<ul class="mini-menu">
							<li><a href="#" title="Move up"><img src="images/icons/fugue/arrow-090.png" width="16" height="16"></a></li>
							<li><a href="#" title="Move down"><img src="images/icons/fugue/arrow-270.png" width="16" height="16"></a></li>
							<li><a href="#" title="Delete"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"> Delete</a></li>
						</ul>
					</li>
					
					<li>
						<img src="images/icons/web-app/48/Pie-Chart.png" width="48" height="48">
						<a href="#">Browsers stats<br>
						<small>Stats &gt; Sites &gt; Browsers stats</small></a>
						<ul class="mini-menu">
							<li><a href="#" title="Move up"><img src="images/icons/fugue/arrow-090.png" width="16" height="16"></a></li>
							<li><a href="#" title="Move down"><img src="images/icons/fugue/arrow-270.png" width="16" height="16"></a></li>
							<li><a href="#" title="Delete"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"> Delete</a></li>
						</ul>
					</li>
					
					<li>
						<img src="images/icons/web-app/48/Comment.png" width="48" height="48">
						<a href="#">Manage comments<br>
						<small>Comments &gt; Manage comments</small></a>
						<ul class="mini-menu">
							<li><a href="#" title="Move up"><img src="images/icons/fugue/arrow-090.png" width="16" height="16"></a></li>
							<li><a href="#" title="Delete"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"> Delete</a></li>
						</ul>
					</li>
					
				</ul>
				
				<form class="form" name="stats_options" id="stats_options" method="post" action="">
					<fieldset class="grey-bg no-margin">
						<legend>Add favourite</legend>
						<p class="input-with-button">
							<label for="simple-action">Select page</label>
							<select name="simple-action" id="simple-action">
								<option value=""></option>
								<option value="1">Page 1</option>
								<option value="2">Page 2</option>
							</select>
							<button type="button">Add</button>
						</p>
					</fieldset>
				</form>
				
			<!--</div></div>-->
		</section>
		
		<section class="grid_8">
			<div class="block-border"><div class="block-content">
				<!-- We could put the menu inside a H1, but to get valid syntax we'll use a wrapper -->
				<div class="h1 with-menu">
					<h1>Web stats</h1>
					<div class="menu">
						<img src="images/menu-open-arrow.png" width="16" height="16">
						<ul>
							<li class="icon_address"><a href="#">Browse by</a>
								<ul>
									<li class="icon_blog"><a href="#">Blog</a>
										<ul>
											<li class="icon_alarm"><a href="#">Recents</a>
												<ul>
													<li class="icon_building"><a href="#">Corporate blog</a></li>
													<li class="icon_newspaper"><a href="#">Press blog</a></li>
												</ul>
											</li>
											<li class="icon_building"><a href="#">Corporate blog</a></li>
											<li class="icon_computer"><a href="#">Support blog</a></li>
											<li class="icon_search"><a href="#">Search...</a></li>
										</ul>
									</li>
									<li class="icon_server"><a href="#">Website</a></li>
									<li class="icon_network"><a href="#">Domain</a></li>
								</ul>
							</li>
							<li class="icon_export"><a href="#">Export</a>
								<ul>
									<li class="icon_doc_excel"><a href="#">Excel</a></li>
									<li class="icon_doc_csv"><a href="#">CSV</a></li>
									<li class="icon_doc_pdf"><a href="#">PDF</a></li>
									<li class="icon_doc_image"><a href="#">Image</a></li>
									<li class="icon_doc_web"><a href="#">Html</a></li>
								</ul>
							</li>
							<li class="sep"></li>
							<li class="icon_refresh"><a href="#">Reload</a></li>
							<li class="icon_reset">Reset</li>
							<li class="icon_search"><a href="#">Search</a></li>
							<li class="sep"></li>
							<li class="icon_terminal"><a href="#">Custom request</a></li>
							<li class="icon_battery"><a href="#">Stats server load</a></li>
						</ul>
					</div>
				</div>
			
				<div class="block-controls">
					
					<ul class="controls-tabs js-tabs same-height with-children-tip">
						<li><a href="#tab-stats" title="Charts"><img src="images/icons/web-app/24/Bar-Chart.png" width="24" height="24"></a></li>
						<li><a href="#tab-comments" title="Comments"><img src="images/icons/web-app/24/Comment.png" width="24" height="24"></a></li>
						<li><a href="#tab-medias" title="Medias"><img src="images/icons/web-app/24/Picture.png" width="24" height="24"></a></li>
						<li><a href="#tab-users" title="Users"><img src="images/icons/web-app/24/Profile.png" width="24" height="24"></a></li>
						<li><a href="#tab-infos" title="Informations"><img src="images/icons/web-app/24/Info.png" width="24" height="24"></a></li>
					</ul>
					
				</div>
				
				<form class="form" id="tab-stats" method="post" action="">
					
					<fieldset class="grey-bg">
						<legend><a href="#">Options</a></legend>
						
						<div class="float-left gutter-right">
							<label for="stats-period">Period</label>
							<span class="input-type-text"><input type="text" name="stats-period" id="stats-period" value=""><img src="images/icons/fugue/calendar-month.png" width="16" height="16"></span>
						</div>
						<div class="float-left gutter-right">
							<span class="label">Display</span>
							<p class="input-height grey-bg">
								<input type="checkbox" name="stats-display[]" id="stats-display-0" value="0">&nbsp;<label for="stats-display-0">Views</label> 
								<input type="checkbox" name="stats-display[]" id="stats-display-1" value="1">&nbsp;<label for="stats-display-1">Unique visitors</label>
							</p> 
						</div>
						<div class="float-left gutter-right">
							<span class="label">Sites</span>
							<p class="input-height grey-bg">
								<input type="radio" name="stats-sites" id="stats-sites-0" value="0">&nbsp;<label for="stats-sites-0">Group</label> 
								<input type="radio" name="stats-sites" id="stats-sites-1" value="1">&nbsp;<label for="stats-sites-1">Separate</label>
							</p>
						</div>
						<div class="float-left">
							<span class="label">Mode</span>
							<select name="stats-sites" id="stats-sites-0">
								<option value="0">Bars</option>
								<option value="0">Lines</option>
							</select>
						</div>
					</fieldset>
					<div id="chart_div" style="height:330px;"></div>
					
				</form>
				
				<div id="tab-comments" class="with-margin">
					<!-- Content is loaded dynamically at bottom in the javascript section -->
				</div>
				
				<div id="tab-medias" class="with-margin">
					<p>Medias</p>
				</div>
				
				<div id="tab-users" class="with-margin">
					<p>Users</p>
				</div>
				
				<div id="tab-infos" class="with-margin">
					<p>Infos</p>
				</div>
				
				<ul class="message no-margin">
					<li>This is an <strong>information message</strong>, inside a box</li>
				</ul>
				
			</div></div>
		</section>
		
		<div class="clear"></div>
		
	</article>
	
	<!-- End content -->
	
	<footer>
		
		<div class="float-left">
			<a href="#" class="button">Help</a>
			<a href="#" class="button">About</a>
		</div>
		
		<div class="float-right">
			<a href="#top" class="button"><img src="images/icons/fugue/navigation-090.png" width="16" height="16"> Page top</a>
		</div>
		
	</footer>
	
	<!--
	
	Updated as v1.5:
	Libs are moved here to improve performance
	
	-->
	
	<!-- Generic libs -->
	<script src="js/libs/jquery-1.6.3.min.js"></script>
	<script src="js/old-browsers.js"></script>		<!-- remove if you do not need older browsers detection -->
	<script src="js/libs/jquery.hashchange.js"></script>
	
	<!-- Template libs -->
	<script src="js/jquery.accessibleList.js"></script>
	<script src="js/searchField.js"></script>
	<script src="js/common.js"></script>
	<script src="js/standard.js"></script>
	<!--[if lte IE 8]><script src="js/standard.ie.js"></script><![endif]-->
	<script src="js/jquery.tip.js"></script>
	<script src="js/jquery.contextMenu.js"></script>
	
	<!-- Charts library -->
	<!--Load the AJAX API-->
	<script src="http://www.google.com/jsapi"></script>
	<script>
		
		/*
		 * This script is dedicated to building and refreshing the demo chart
		 * Remove if not needed
		 */
		
		// Load the Visualization API and the piechart package.
		google.load('visualization', '1', {'packages':['corechart']});
		
		// Add listener for tab
		$('#tab-stats').onTabShow(function() { drawVisitorsChart(); }, true);
		
		// Handle viewport resizing
		var previousWidth = $(window).width();
		$(window).resize(function()
		{
			if (previousWidth != $(window).width())
			{
				drawVisitorsChart();
				previousWidth = $(window).width();
			}
		});
		
		// Demo chart
		function drawVisitorsChart() {

			// Create our data table.
			var data = new google.visualization.DataTable();
			var raw_data = [['Website', 50, 73, 104, 129, 146, 176, 139, 149, 218, 194, 96, 53],
							['Shop', 82, 77, 98, 94, 105, 81, 104, 104, 92, 83, 107, 91],
							['Forum', 50, 39, 39, 41, 47, 49, 59, 59, 52, 64, 59, 51],
							['Others', 45, 35, 35, 39, 53, 76, 56, 59, 48, 40, 48, 21]];
			
			var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			
			data.addColumn('string', 'Month');
			for (var i = 0; i < raw_data.length; ++i)
			{
				data.addColumn('number', raw_data[i][0]);	
			}
			
			data.addRows(months.length);
			
			for (var j = 0; j < months.length; ++j)
			{	
				data.setValue(j, 0, months[j]);	
			}
			for (var i = 0; i < raw_data.length; ++i)
			{
				for (var j = 1; j < raw_data[i].length; ++j)
				{
					data.setValue(j-1, i+1, raw_data[i][j]);	
				}
			}
			
			// Create and draw the visualization.
			var div = $('#chart_div');
			new google.visualization.ColumnChart(div.get(0)).draw(data, {
				title: 'Monthly unique visitors count',
				width: div.width(),
				height: 330,
				legend: 'right',
				yAxis: {title: '(thousands)'}
			});
			
			// Message
			notify('Chart updated');
		};
		
	</script>

</body>
</html>