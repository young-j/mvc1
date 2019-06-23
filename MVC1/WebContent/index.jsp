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



  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active" align="center">
      <img src="images/image1.jpg" alt="Los Angeles" style="width:98%; height:350px">
    </div>
</div>

	<!-- INNER CONTENT -->
	<div class="inner-content">
		<div class="container">
			<section id="portfolio-section">
				<ul class="filter no-margin-top" data-option-key="filter">
					<li><a class="selected" href="#filter" data-option-value="*" style="font-size:13px">All</a></li>
					<li><a href="#" data-option-value=".branding" style="font-size:13px">지역별 소모임</a></li>
					<li><a href="#" data-option-value=".illustration" style="font-size:13px">일본 취업</a></li>
					<li><a href="#" data-option-value=".web-design" style="font-size:13px">게시판</a></li>
				</ul>
				<div id="portfolio-home" class="isotope tiles folio-boxed-3col">
					<div class="project-item branding">
						<a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=1">
							<div class="project-gal">
								<img src="images/hukuoka.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>지역별 소모임</p>
									<h2>후쿠오카</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item branding">
						<a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=2">
							<div class="project-gal">
								<img src="images/kyoto.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>지역별 소모임</p>
									<h2>교토</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item branding">
						<a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=3">
							<div class="project-gal">
								<img src="images/osaka.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>지역별 소모임</p>
									<h2>오사카</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item branding">
						<a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=4">
							<div class="project-gal">
								<img src="images/tokyo.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>지역별 소모임</p>
									<h2>도쿄</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item branding">
						<a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=5">
							<div class="project-gal">
								<img src="images/hokkaido.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>지역별 소모임</p>
									<h2>삿포로</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item branding">
						<a href="<%=request.getContextPath()%>/meeting.do?cmd=list&pg=0&mode=modify&id=1&category=6">
							<div class="project-gal">
								<img src="images/nagoya.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>지역별 소모임</p>
									<h2>나고야</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item illustration">
						<a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=1">
							<div class="project-gal">
								<img src="images/question.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>일본 취업</p>
									<h2>취업 질문방</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item illustration">
						<a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=2">
							<div class="project-gal">
								<img src="images/study1.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>일본 취업</p>
									<h2>스터디 모집</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item illustration">
						<a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=3">
							<div class="project-gal">
								<img src="images/info.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>일본 취업</p>
									<h2>취업 노하우</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item illustration">
						<a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=4">
							<div class="project-gal">
								<img src="images/hiring.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>일본 취업</p>
									<h2>구인 공고</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item illustration">
						<a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=5">
							<div class="project-gal">
								<img src="images/document.png" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>일본 취업</p>
									<h2>서류 합격 후기</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item illustration">
						<a href="<%=request.getContextPath()%>/work.do?cmd=list&pg=0&mode=modify&id=1&category=6">
							<div class="project-gal">
								<img src="images/interview.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>일본 취업</p>
									<h2>면접 후기</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item web-design">
						<a href="<%=request.getContextPath()%>/gallery.do">
							<div class="project-gal">
								<img src="images/picture.jpg" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>게시판</p>
									<h2>사진 게시판</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="project-item web-design">
						<a href="<%=request.getContextPath()%>/guest.do">
							<div class="project-gal">
								<img src="images/Q&A.png" class="img-responsive" alt="" style=" width:98%; height:200px">
							</div>
							<div class="overlay-folio2">
								<div class="project-info">
									<p>게시판</p>
									<h2>답변 게시판</h2>
								</div>
							</div>
						</a>
					</div>
	
			</section>
		</div>
	</div>

<%@include file="/include/footer.jsp" %>
<%@include file="/include/bottom.jsp" %>

</body>
</html>
