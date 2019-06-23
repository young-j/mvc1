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

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <title>Simple Sidebar - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
 </script>
 
</head>
<body>
<%
//파라미터 처리하기 
String key=Util.encoding(request.getParameter("key"));
String sel=Util.nullTo(request.getParameter("sel"));
String id=Util.nullToValue(request.getParameter("id"), "1");
String pg=Util.nullToValue(request.getParameter("pg"), "1");
String contextPath=request.getContextPath();
%>
<div class="d-flex" id="wrapper">

<%@include file="/include/top.jsp" %>

 <div class="container-fluid">

<%
GuestbookDto dto =  (GuestbookDto)request.getAttribute("dto");
%>

  <h2>방명록 상세보기</h2>
  <form action="" name="myform" method="get">
  	<input type="hidden" name="cmd" value="modify" >
  	<input type="hidden" name="pg" value="<%=pg%>" >
  	<input type="hidden" name="mode" value="modify" >
  	<input type="hidden" name="id" value="<%=id%>" >
  </form>
  
    <table class="table ">
		<col width="16%">
		<col width="*%">
		<col width="16%">
		<col width="16%">
		<col width="16%">
		<col width="16%">
	</colgroup>
   
    </thead>
    <tbody>
      <tr>
        <th class="table-secondary">제목</th>
        <td colspan="5"><%=dto.getTitle()%></td>
      </tr>
      <tr>
        <th class="table-secondary">작성자</td>
        <td ><%=dto.getWriter()%></td>
		<th class="table-secondary">작성일</td>
        <td><%=dto.getWdate()%></td>
		<th class="table-secondary">조회수</td>
        <td><%=dto.getHit()%></td>
      </tr>
	  <tr>
        <th class="table-secondary" style="min-height:300px">내용</th>
        <td colspan="5"><%=dto.getContents()%></td>
      </tr>
      <tr>
        <th class="table-secondary">첨부1</th>
        <td colspan="5">
        	<a href="<%=contextPath%>/download.do?path=guestbook&filename=<%=dto.getFileName1()%>"><%=dto.getFileName1()%></a>
        </td>
      </tr>
       <tr>
        <th class="table-secondary">첨부2</th>
          <td colspan="5">
        	<a href="<%=contextPath%>/download.do?path=guestbook&filename=<%=dto.getFileName2()%>"><%=dto.getFileName2()%></a>
        </td>
      </tr>
       <tr>
        <th class="table-secondary">첨부3</th>
        <td colspan="5">
        	<a href="<%=contextPath%>/download.do?path=guestbook&filename=<%=dto.getFileName3()%>"><%=dto.getFileName3()%></a>
        </td>
      </tr>
     
	  <tr>
        <td colspan="6"></td>
      </tr>
    </tbody>
  </table>

   <div class="form-group" style="float:right"> 
       <button type="button" onclick="goReply()" 	   	class="btn btn-primary">답글달기</button>
   	   <button type="button" onclick="goList()" 	   	class="btn btn-primary">목록</button>
	   <button type="button" onclick="goModify()" 	   	class="btn btn-primary">수정</button>
	   <button type="button" onclick="goDelete()" 	   	class="btn btn-primary">삭제</button>
   </div> 
 
</div>
</div>

</body>
</html>

<script>

function goReply()
{
	var frm = document.myform;
	frm.cmd.value="reply";
	frm.mode.value="reply";
	
	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}


function goList()
{
	var frm = document.myform;
	frm.cmd.value="list";
	
	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}

function goModify()
{
	var frm = document.myform;
	frm.cmd.value="modify";
	frm.mode.value="modify";

	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
	
	//location.href=url;
}

function goDelete()
{
	var frm = document.myform;
	frm.cmd.value="delete";
	frm.mode.value="delete";

	frm.action="<%=contextPath%>/guest.do";
	frm.submit();
}
</script>
