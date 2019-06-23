<%@page language="java"   contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.multi.model.*" %>
<%@page import="com.multi.dto.*" %>
<%@page import="com.multi.common.*" %>
<%@page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Simple Sidebar - Start Bootstrap Template</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">


	<!-- SAKURA -->
	<link href="css/jquery-sakura.css" rel="stylesheet">

	<!-- Styles -->

	<link rel="stylesheet" href="js/owl-carousel/owl.carousel.css">
	<link rel="stylesheet" href="js/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="js/owl-carousel/owl.transitions.css">
	<link rel="stylesheet" href="js/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="js/flexslider/flexslider.css">
	<link rel="stylesheet" href="js/isotope/isotope.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="js/magnific-popup/magnific-popup.css">
	<link rel="stylesheet" href="css/style.css">

	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Dosis:400,200,300,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- Icon Fonts -->
	<link rel="stylesheet" href="css/icomoon/style.css" type="text/css">
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

	<!-- SKIN -->
	<link rel="stylesheet" href="css/color-scheme/default-blue.css" type="text/css">


</head>
<body>
<%
//파라미터 처리하기 
String key=Util.encoding(request.getParameter("key"));
String sel=Util.nullTo(request.getParameter("sel"));
String contextPath=request.getContextPath();

int totalCount = (int)request.getAttribute("totalCount");
System.out.println("전체데이터개수 : " + totalCount);

%>
<div class="d-flex" id="wrapper">

<%@include file="/include/top.jsp" %>

 <div class="container-fluid">
 
 
 <form name="mform" >
	<input type="hidden" name="cmd"            value="write">
	<input type="hidden" name="pg"             value="0">
	<input type="hidden" name="id"             value="1">
	

	<div class="form-group" style="float:right"> 
	  <label class="form-check-label"> 	
	   <select class="form-control" id="sel"   name="sel">
	    <option value="all"  <%if(sel.equals("all")){%>   selected    <%}%> >전체</option>
	    <option value="1"    <%if(sel.equals("1")){%>     selected    <%}%> >제목</option>
	    <option value="2"    <%if(sel.equals("2")){%>     selected    <%}%> >내용</option>
	    <option value="3"    <%if(sel.equals("3")){%>     selected    <%}%> >글쓴이</option>
	   </select>
	 </label>
	 <label class="form-check-label"> 	
	    <input type="text" class="form-control"    id="key" name="key" value="<%=key%>">
	 </label>
	 <label class="form-check-label"> 	
	   	<button type="button" onclick="goSearch()"  	class="btn btn-primary">검색</button>
	  </label>
	</div> 
	<div style="clear:left">&nbsp;</div>
</form>

  <h2>게시판</h2>
  
  <p></p>
  <table class="table table-striped">
    <thead class="thead-dark">
      <colgroup>
      	<col width=10%>
      	<col width=*>
      	<col width=10%>
      	<col width=10%>
      	<col width=10%>
      </colgroup>
      <tr class="thead-dark">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>파일첨부여부</th>
        <th>작성일자</th>
      </tr>
    </thead>
    <tbody>
<%

List<GuestbookDto> list = (List<GuestbookDto>)request.getAttribute("list");
for(int i=0; i<list.size(); i++){
	GuestbookDto tempDto = list.get(i);
	int num = tempDto.getNum();
	int depth = tempDto.getGroup_depth();
	String reply="";
	
	for(int jj=0; jj<depth; jj++)
	{
		reply = reply + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	if( depth!=0)
		reply=reply+"re)";
%>
      <tr>
        <td><%=totalCount-num+1%></td>
        <td>
        <%=reply%>
       	<a href="#none" onclick="goView('<%=tempDto.getId()%>')"><%=tempDto.getTitle()%></a>
        </td>
        <td><%=tempDto.getWriter()%></td>
        <td><%=tempDto.getWriter()%></td>
        <td><%=tempDto.getWdate()%></td>
      </tr>
<%} %>
    </tbody>
  </table>
  

	 <div class="form-group" style="float:right"> 
	  <button type="button" onclick="goWrite()"   	class="btn btn-primary">글쓰기</button>
	</div>

<!--  페이징 처리  -->
<%=Pager.makeTag(request, 10, totalCount)%>

	
   </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->



</body>
</html>


<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- sakura -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/jquery-sakura.js"></script>
<script>
$(window).load(function () {
    $('#sakura').sakura();
});
</script>

<!-- Plugins -->
<script src="js/bootstrap.min.js"></script>
<script src="js/menu.js"></script>
<script src="js/owl-carousel/owl.carousel.min.js"></script>
<script src="js/rs-plugin/js/jquery.themepunch.tools.min.js"></script>   
<script src="js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/isotope/isotope.pkgd.js"></script>
<script src="js/jflickrfeed.min.js"></script>
<script src="js/tweecool.js"></script>
<script src="js/flexslider/jquery.flexslider.js"></script>
<script src="js/easypie/jquery.easypiechart.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.appear.js"></script>
<script src="js/jquery.inview.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/magnific-popup/jquery.magnific-popup.min.js"></script>

<script src="js/main.js"></script>

<script>

//페이지 이동용 함수 
function goPage(page)
{
	var frm = document.mform;
	//새로 변경된 페이지 정보를 저장
	frm.pg.value = page;
	frm.cmd.value="list";
	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}

function  goWrite()
{
	var frm = document.mform;
	frm.cmd.value="write";
	frm.sel.value="";
	frm.pg.value=1;
	frm.key.value="";
	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}

function goSearch()
{
	//get 방식으로 서버로 보낼때는 한글은 반드시 인코딩을 해서 보내야  안깨진다 

	var key = document.getElementById("key").value;
	key = encodeURI(key);//인코딩 
	var frm = document.mform;
	frm.method="get";
	frm.cmd.value="list";
	frm.key.value=key;
	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}


function goView(id)
{
	//get 방식으로 서버로 보낼때는 한글은 반드시 인코딩을 해서 보내야  안깨진다 

	var key = document.getElementById("key").value;
	key = encodeURI(key);//인코딩 
	var frm = document.mform;
	frm.method="get";
	frm.cmd.value="view";
	frm.id.value=id;
	frm.key.value=key;
	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}
</script>



