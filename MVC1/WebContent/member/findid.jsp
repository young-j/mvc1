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
					<h2 class="uppercase space40">아이디 찾기</h2>
					
					<div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" class="form-control" 
                        id="email" name="email" 
                        placeholder="이메일을 입력하세요">
                    </div>
                    
					<div class="form-group">
                        <label for="phone">전화번호</label>
                        <input type="tel" class="form-control" 
                        name="phone" id="phone" 
                        placeholder="전화번호를 입력하세요">
                    </div>
                    	<br>
						<input class="button btn-md pull-left" id="btnFindId" value="확인" type="button">
					</form>
				</div>
			</div>
			<div class="space50"></div>
			<br><br><br><br><br>
			
			</section>
		</div>
	</div>

<%@include file="/include/bottom.jsp" %>

</body>
</html>

<script>
$(document).ready(function(){
	$("#btnFindId").click( function() {
/* 		alert('ddd'); */
		//아이디 찾는 화면으로 이동한다
		var frm = document.mform;
		frm.action="/MVC1/index.do?cmd=member&job=findidresult";
		frm.submit();
	});
})
</script>