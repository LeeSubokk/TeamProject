<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.mkinfinite.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Secular+One&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/animation/style.css"
	type="text/css" />
<script type="text/javascript">
		$(document).ready(function() {
			$('header').mkinfinite({
				maxZoom : 1.4,
				animationTime : 4000,
				imagesRatio : (960 / 720),
				isFixedBG : true,
				zoomIn : true,
				imagesList : new Array(
						'resources/img/gw1.png',
						'resources/img/gw2.png',
						'resources/img/gw3.gif',
						'resources/img/gw4.png',
						'resources/img/gw5.png')
				});
			});
	</script>

</head>
<body>
	<div class="container mainWidth">
		<header class="mkinfinite">
			<div class="content">
				<div id="content">
					<div id="logo">
						Z<span class="color-1">o</span><span class="color-2">o</span>m In
					</div>
				</div>
				<div></div>
			</div>
		</header>
	</div>

	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

</body>
</html>