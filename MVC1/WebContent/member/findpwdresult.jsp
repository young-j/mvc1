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
                	<h2 class="uppercase space40">비밀번호 찾기</h2>
                </div>
            </div>

            <div class="col-sm-3 col-md-offset-3" style="margin-top:10px">
                
               	<%
                String password=(String)request.getAttribute("password");
                if( password==null || password.equals("")){
                %>
               		<div class="form-group">
                        <label for="password">해당하는 비밀번호를 찾을 수 없습니다.</label>
                    </div>
                <br>
                <%}else{%>
                	<div class="form=group">
                		<label for="password">당신의 비밀번호는 <%=password %>입니다.</label>
                	</div>
                <br>	
                <%}%>

                <input class="button btn-md pull-left" id="btnFindPwdResult" value="이전화면" type="button">
                
                <input class="button btn-md pull-right" id="btnCancel" value="로그인화면" type="button">
			
			</div>
			</article>
       </form>
       
       <br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br><br><br><br><br><br>
       <br><br><br><br><br>
			
			</section>
		</div>
	</div>

<%@include file="/include/bottom.jsp" %>

</body>
</html>

<script>
$(document).ready(function(){
	$("#btnFindPwdResult").click( function() {
/* 		alert('ddd'); */
		//아이디 찾는 화면으로 이동한다
		var frm = document.mform;
		frm.action="/MVC1/member/findpassword.jsp";
		frm.submit();
	});
	
	$("#btnCancel").click( function() {
		var frm = document.mform;
		frm.action="/MVC1/index.do?cmd=member&job=logon_form";
		frm.submit();
	});
})
</script>