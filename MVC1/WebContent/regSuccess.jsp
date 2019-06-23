<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- BootStrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 

	<title>Trend | Responsive Multipurpose Bootstrap Theme</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" type="text/css">

	<!-- Styles -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/owl-carousel/owl.carousel.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/owl-carousel/owl.transitions.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/flexslider/flexslider.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/isotope/isotope.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/magnific-popup/magnific-popup.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Dosis:400,200,300,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- Icon Fonts -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icomoon/style.css" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.min.css" type="text/css">

	<!-- SKIN -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/color-scheme/default-blue.css" type="text/css">


	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
           <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.2/jquery.xdomainrequest.min.js"></script>      
	<![endif]-->
        
</head>
<body>
<div class="outer-wrapper">
	<form name="mform" id="mform" method="post" action="/MVC1/index.do?cmd=member&job=insert">
		<div class="inner-content">
			<div class="container">
				<div class="row">
				<img src="/MVC1/images/congratulations.jpg" style="margin-left: auto; margin-right: auto; display: block;"/>
					<div class="col-md-12 text-center">
						<h1>회원 가입이 완료되었습니다</h1>
						<p>환영합니다</p>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 col-md-offset-3">
						<button type="button" id="goMain" class="button btn-md pull-left"
	                   			onclick="goMainTest()"><i class="icon-circle-arrow-left"></i>메인으로</button>
						<button type="button" onclick="goLogin()" class="button btn-md pull-right">
						<i class="icon-circle-arrow-left"></i>로그인창</button>
					</div>
				</div>
			</div>
		</div>
	</form>	
</div>
</body>
</html>
<script>
function goMainTest()
 {
	var frm = document.mform;
 	frm.action="<%=request.getContextPath()%>/index.do?cmd=member&job=insert"; 	
 	frm.method="";
 	frm.submit();
 }
 
 function goLogin()
 {
	 var frm = document.mform;
 	frm.action="<%=request.getContextPath()%>/index.do?cmd=member&job=logon_form"; 	
 	frm.method="post";
 	frm.submit();
 }
 </script>