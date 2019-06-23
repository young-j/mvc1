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
                </div>
            </div>

            <div class="col-sm-3 col-md-offset-3" style="margin-top:10px">
                
                <%
                String userid1=(String)request.getAttribute("userid");
                if( userid1==null || userid1.equals("")){
                %>
               		<div class="form-group">
                        <label for="email">해당하는 아이디를 찾을 수 없습니다.</label>
                    </div>
                <br>    
                <%}else{%>
                	<div class="form=group">
                		<label for="email">당신의 아이디는 <%=userid1 %>입니다.</label>
                	</div>
                <br>	
                <%}%>
                
                <input class="button btn-md pull-left" id="btnFindIdResult" value="이전화면" type="button">
                
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
	$("#btnFindIdResult").click( function() {
/* 		alert('ddd'); */
		//아이디 찾는 화면으로 이동한다
		var frm = document.mform;
		frm.action="/MVC1/member/findid.jsp";
		frm.submit();
	});
	
	$("#btnCancel").click( function() {
		var frm = document.mform;
		frm.action="/MVC1/index.do?cmd=member&job=logon_form";
		frm.submit();
	});
})
</script>
