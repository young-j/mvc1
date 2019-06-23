<%@page import="com.multi.common.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<!-- HEADER -->
<header id="header-main">
	<div class="container">
		<div class="navbar yamm navbar-default">
			<div class="navbar-header">
				<button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a href="<%=contextPath%>/index.do" class="navbar-brand"><img src="<%=contextPath%>/images/logo.PNG" width="40" alt=""/></a>
			</div>

					<div id="navbar-collapse-1" class="navbar-collapse collapse navbar-right">
					<ul class="nav navbar-nav">
						<li class="dropdown yamm-fw">
							<a href="/MVC1/index.do"  class="maingo">
								Home 								
							</a>	
						</li>

					<li class="dropdown yamm-fw">
						<a href="/MVC1/index.do?cmd=member&job=write" class="hwa">
							회원가입 
						</a>			
					</li>
					<li class="logon">   
<%
String userid=Util.nullToValue(session.getAttribute("userid"), "");
String username=Util.nullToValue(session.getAttribute("username"),"");
System.out.println(username);
//세션에 있는 값을 읽어와서 userid가 있는지 확인한다
%>
<%if(userid.equals("")){%>
                  <a href="/MVC1/index.do?cmd=member&job=logon_form" class="logon">
                     로그인</a>
      
<%}else{ %>
                  <a href="/MVC1/index.do?cmd=member&job=logout" class="logout">
                  <h7><%=username%>&nbsp;님 </h7>로그아웃</a>
<%} %>
               </li>
					<li class="dropdown">
						<a href="<%=request.getContextPath()%>/notice.do" class="gonji">
							공지사항 
							
						</a>
						
					</li>
					<li class="dropdown">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle">
							일본 취업 
							<div class="arrow-up"><i class="fa fa-angle-down"></i></div>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=1">취업 질문방</a></li>
							<li><a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=2">스터디 모집</a></li>
							<li><a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=3">취업 노하우</a></li>
							<li><a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=4">구인공고</a></li>
							<li><a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=5">서류 합격후기</a></li>
							<li><a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=6">면접 후기</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle">
							지역별 소모임
							<div class="arrow-up"><i class="fa fa-angle-down"></i></div>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=1">후쿠오카</a></li>
							<li><a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=2">교토</a></li>
							<li><a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=3">오사카</a></li>
							<li><a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=4">도쿄</a></li>
							<li><a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=5">삿포로</a></li>
							<li><a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=6">나고야</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" data-toggle="dropdown" class="dropdown-toggle">
							게시판
							<div class="arrow-up"><i class="fa fa-angle-down"></i></div>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=request.getContextPath()%>/gallery.do">사진 게시판</a></li>
							<li><a href="<%=request.getContextPath()%>/guest.do">답변 게시판</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
		</div>
	</div>
</header>