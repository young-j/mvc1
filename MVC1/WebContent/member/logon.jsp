<%@ page language="java"   contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"> 

	<%@include file="/include/top.jsp" %>

</head>
<body>

<div class="outer-wrapper">

	<%@include file="/include/header.jsp" %>
<div>


	<!-- INNER CONTENT -->
	<div class="inner-content">
		<div class="container">
			<section id="portfolio-section">
				<!--  이 태그 안에 모든 소스를 갖다놓아야 한다  -->
			
		<body>
			<form name="mform" id="mform" method="post"
				action="/MVC1/index.do?cmd=member&job=logon">

		<article class="container">
				<div class="col-md-6 col-md-offset-3">
					<h2 class="uppercase space40">로그인</h2>
					<form method="post">
						<div class="form-group">
							<label for="userid">아이디</label>
								<input type="userid"
								class="form-control" id="userid" name="userid"
								placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label>
								<input type="password"
								class="form-control" id="password" name="password"
								placeholder="비밀번호를 입력하세요">
						</div>
						<br>
						<input class="button btn-md" value="Login" type="submit">
						<div class="space20"></div>
					</form>
					<a class="helper-text text-center" href="/MVC1/member/findid.jsp">아이디 찾기</a>
					&nbsp;&nbsp;
					<a class="helper-text text-center" href="/MVC1/member/findpassword.jsp">비밀번호 찾기</a>
				</div>
			</div>
			<div class="space30"></div>
		<br><br><br><br><br>
		<br><br><br><br><br>
			
			</section>
		</div>
	</div>

<%@include file="/include/bottom.jsp" %>

</body>
</html>