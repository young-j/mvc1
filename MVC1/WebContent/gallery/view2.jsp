<%@page import="com.multi.dto.GalleryDto"%>
<%@page import="com.multi.dto.CommentDto"%>
<%@page import="com.multi.dto.GuestbookDto"%>
<%@page import="com.multi.common.Util"%>
<%@ page language="java"   contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"> 

	<%@include file="/include/top.jsp" %>

</head>
<body>
<%
//파라미터 처리하기 
String key=Util.encoding(request.getParameter("key"));
String sel=Util.nullTo(request.getParameter("sel"));
String id=Util.nullToValue(request.getParameter("id"), "1");
String pg=Util.nullToValue(request.getParameter("pg"), "1");
%>
<div class="outer-wrapper">

	<%@include file="/include/header.jsp" %>
<div>


	<!-- INNER CONTENT -->
	<div class="inner-content">
		<div class="container">
			<section id="portfolio-section">
				<!--  이 태그 안에 모든 소스를 갖다놓아야 한다  -->
			
			
<%

String mode=Util.nullToValue(request.getParameter("mode"), "insert");
GalleryDto dto =  (GalleryDto)request.getAttribute("dto");
CommentDto comDto = (CommentDto)request.getAttribute("comDto");
%>

  <h2>상세보기</h2>
  <form action="" name="myform" method="get">
  	<input type="hidden" name="cmd" value="modify" >
  	<input type="hidden" name="pg" value="<%=pg%>" >
  	<input type="hidden" name="mode" value="modify" >
  	<input type="hidden" name="id" id="id" value="<%=id%>" >
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
        <th class="table-secondary" style="background-color:#dddddd; text-align:center" >제목</th>
        <td colspan="5"><%=dto.getTitle()%></td>
      </tr>
      <tr>
        <th class="table-secondary"  style="background-color:#dddddd; text-align:center">작성자</td>
        <td ><%=dto.getWriter()%></td>
		<th class="table-secondary"  style="background-color:#dddddd; text-align:center">작성일</td>
        <td><%=dto.getWdate()%></td>
		<th class="table-secondary"  style="background-color:#dddddd; text-align:center">조회수</td>
        <td><%=dto.getHit()%></td>
      </tr>
	  <tr>
        <th class="table-secondary" style="min-height:300px;background-color:#dddddd; text-align:center">내용</th>
        <td colspan="5"><%=dto.getContents()%></td>
      </tr>
      <tr>
        <th class="table-secondary"  style="background-color:#dddddd; text-align:center">첨부1</th>
        <td colspan="5">
        	<a href="<%=contextPath%>/download.do?path=guestbook&filename=<%=dto.getFileName1()%>"><%=dto.getFileName1()%></a>
        </td>
      </tr>
       <tr>
        <th class="table-secondary"  style="background-color:#dddddd; text-align:center">첨부2</th>
          <td colspan="5">
        	<a href="<%=contextPath%>/download.do?path=guestbook&filename=<%=dto.getFileName2()%>"><%=dto.getFileName2()%></a>
        </td>
      </tr>
       <tr>
        <th class="table-secondary"  style="background-color:#dddddd; text-align:center">첨부3</th>
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
       <button type="button" onclick="goReply()" 	   	class="button btn-md pull-left" >답글달기</button>
   	   <button type="button" onclick="goList()" 	   	class="button btn-md pull-left">목록</button>
	   <button type="button" onclick="goModify()" 	   	class="button btn-md pull-left">수정</button>
	   <button type="button" onclick="goDelete()" 	   	class="button btn-md pull-left">삭제</button>
   </div> 

	<div style="clear:both;height:50px"> 
	</div>
	
 	<div class="form-group" > 

<hr>

<table id="mytable" class="table">
	<colgroup>
		<col width=70%>
		<col width=30%>
	</colgroup>
	<thead >
	  <tr>
	    <th colspan="2">댓글</th>
	  </tr>
  	</thead>
  	<tbody></tbody>
</table>
	
			</section>
			
			<section style="margin-top:40px">
			  <form name="frmComment" >
			  		<input type="text" name="writer" id="writer" value="홍길동" >
			  		<input type="hidden" name="board_id" id="board_id" value="<%=id%>" >
					<div class="form-group">
				      <label for="comment">댓글:</label>
				      <textarea class="form-control" rows="5" id="contents" name="contents"></textarea>
				    </div>
				    <button type="button" class="button color2 btn-md" onclick="goCommentWrite()">등록</button>
			  </form>
			</section>
		</div>
	</div>

<%@include file="/include/footer.jsp" %>
<%@include file="/include/bottom.jsp" %>


</body>
</html>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
  $('#btn-add-row').click(function() {
    var temp="<tr><td>안녕 친구들 안녕 친구들 안녕 친구들 안녕 친구들</td><td>홍길동 <br/>2019.04.11<br/>127.0.0.1<br/></td></tr>";
    $('#mytable > tbody:first').append(temp);
  });
 
</script>

<script>
function goWrite()
{
	var data = CKEDITOR.instances.editor.getData();
	
	var frm = document.myform;
	frm.contents=data;
	frm.action="/MVC1/gallery.do?cmd=save";

	frm.method="post";
	frm.submit();
}


function goReply()
{
	var frm = document.myform;
	frm.cmd.value="reply";
	frm.mode.value="reply";
	
	frm.action="<%=contextPath%>/gallery.do";
	frm.submit();
}


function goList()
{
	var frm = document.myform;
	frm.cmd.value="list";
	
	frm.action="<%=contextPath%>/gallery.do";
	frm.submit();
}

function goModify()
{
	var frm = document.myform;
	frm.cmd.value="modify";
	frm.mode.value="modify";

	frm.action="<%=contextPath%>/gallery.do";
	frm.submit();
	
	//location.href=url;
}

function goDelete()
{
	if(confirm('삭제하시겠습니까?'))
		{
			var frm = document.myform;
			frm.cmd.value="delete";
			frm.mode.value="delete";
		
			frm.action="<%=contextPath%>/gallery.do";
			frm.submit();
		}
}

$(document).ready(function(){
	loadData();
});


function loadData() {
	var board_id = $("#id").val();
	$.ajax({
		url: "<%=request.getContextPath()%>/comment.do", // 호출할 파일명
		data:{'cmd':'list', 'board_id':board_id},
		method: "POST",
		dataType: "json",	// 내가 받아야 할 결과 형태가 text, html, xml, json
		success:function(data) {
			console.log(data);
			$('#mytable > tbody:first *').remove();
			
			for(i=0; i<data.length; i++)
			{
				console.log(data[i].writer);
				var temp="<tr>";
				temp +="<td>"+ data[i].contents+"</td>";
				temp +="<td>"+ data[i].writer + "<br/>";
				temp += data[i].ip + "<br/>";
				temp += data[i].wdate + "<br/>";
				var writer ='<%=session.getAttribute("userid")%>';
				//if( writer == data[i].writer){
					//temp +="<button type='button' class='btn btn-primary' onclick='goCommentModify(\"" + data[i].comment_id + "\")'>수정</button>";
					//temp +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					temp +="<button type='button' class='button color4  btn-small' onclick='goCommentDelete(\"" + data[i].comment_id + "\")'>삭제</button>";
				//}
				temp +="<td>";
				temp += "</tr>";
			    $('#mytable > tbody:first').append(temp);
			}
			
		},
		error:function(){
			console.log("데이터 로딩 실패");
		}
	});
}

function goCommentWrite()
{
	
	var board_id = $("#board_id").val();
	var writer= $("#writer").val();
	var contents = $("#contents").val();
	
	if( contents.trim().length<10)
	{
		alert("10글자 이상 내용을 입력해주세요");
		$("#contents").focus();
		return false;
	}
	
	$.ajax({
		url: "<%=request.getContextPath()%>/comment.do", // 호출할 파일명
		data:{'cmd':'save', 'board_id':board_id, 'writer':writer, 'contents':contents},
		method: "POST",
		dataType: "text",	// 내가 받아야 할 결과 형태가 text, html, xml, json
		success:function(data) {
			console.log(data);
			
			if(data=='OK'){
				alert('등록');
				$("#contents").val("");
				loadData();
			}
			
		},
		error:function(){
			console.log("데이터 로딩 실패");
		}
	});
}

function goCommentModify(id)
{
	alert(id);

}

function goCommentDelete(id)
{
	alert(id);
	
	$.ajax({
		url: "<%=request.getContextPath()%>/comment.do", // 호출할 파일명
		data:{'cmd':'delete',  'comment_id':id},
		method: "POST",
		dataType: "text",	// 내가 받아야 할 결과 형태가 text, html, xml, json
		success:function(data) {
			console.log(data);
			
			if(data=='OK'){
				alert('삭제완료');
				loadData();
			}
			
		},
		error:function(){
			console.log("데이터 로딩 실패");
		}
	});
}



</script>