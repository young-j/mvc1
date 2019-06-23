<%@page import="com.multi.common.Util"%>
<%@page import="com.multi.dto.GuestbookDto"%>
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
String mode=Util.nullToValue(request.getParameter("mode"), "insert");

GuestbookDto dto = (GuestbookDto)request.getAttribute("dto");
if( dto==null) dto = new GuestbookDto();

%>
<div class="outer-wrapper">

	<%@include file="/include/header.jsp" %>
<div>


	<!-- INNER CONTENT -->
	<div class="inner-content">
		<div class="container">
			<section id="portfolio-section">
				<!--  이 태그 안에 모든 소스를 갖다놓아야 한다  -->
			<div class="container-fluid">
	  <h2>글쓰기</h2>
	  <form action="" name="myform" method="post" enctype="multipart/form-data">
	  	<input type="text" name="cmd" value="save">
	  	<input type="text" name="group_id" value="<%=dto.getGroup_id()%>">
	  	<input type="text" name="group_level" value="<%=dto.getGroup_level()%>">
	  	<input type="text" name="group_depth" value="<%=dto.getGroup_depth()%>">
	  	<input type="text" name="mode" value="<%=mode%>">
	  	<input type="text" name="id" value="<%=dto.getId()%>">
	  	
	  	<input type="text" name="oldFileName1" value="<%=dto.getFileName1()%>">
	  	<input type="text" name="oldFileName2" value="<%=dto.getFileName2()%>">
	  	<input type="text" name="oldFileName3" value="<%=dto.getFileName3()%>">
	  	
	    <div class="form-group">
	      <label for="title">제목:</label>
	      <input type="text" class="form-control" id="title"    placeholder="제목을 입력하세요"    name="title" 
	      <%if( !mode.equals("reply")){%> value="<%=dto.getTitle()%> <%}%>">
	    </div>
	    <div class="form-group">
	      <label for="writer">작성자:</label>
	      <input type="text" class="form-control"   id="writer"    placeholder="이름을 입력하세요"      name="writer"
	      value="<%=dto.getWriter()%>" >
	    </div>
	    
	    <div class="form-group">
		  	<label for="contents">내용:</label>
		  	<textarea class="form-control" rows="5" id="editor" name="contents"><%if( !mode.equals("reply")){%><%=dto.getContents()%><%}%></textarea>
		</div>
		
		<%if(mode.equals("insert") || mode.equals("reply") ){ %>
		 <div class="form-group">
		 	<label for="filaname1">첨부:</label>
		 	<input type="file" class="form-control"  name="filename1" >
		 	<label for="filaname1">첨부:</label>
		 	<input type="file" class="form-control"  name="filename2" >
		 	<label for="filaname1">첨부:</label>
		 	<input type="file" class="form-control"  name="filename3" >
		 </div>
		<%}else{ %>
		 <div class="form-group">
		 	<label for="filaname1">첨부: <%=dto.getFileName1()%></label>
		 	<input type="file" class="form-control"  name="filename1" value=''>
		 	<label for="filaname1">첨부: <%=dto.getFileName2()%></label>
		 	<input type="file" class="form-control"  name="filename2" value=''>
		 	<label for="filaname1">첨부: <%=dto.getFileName3()%></label>
		 	<input type="file" class="form-control"  name="filename3" value=''>
		 </div>
		<%} %>
	   <div class="form-group" style="float:right"> 
		   <button type="button" onclick="goWrite()" class="btn btn-primary">등록</button>
		   <button type="button" onclick="goCancel()" class="btn btn-primary">취소</button>
	   </div> 
	  </form>
	</div>

</div>
			
			
			
			</section>
		</div>
	</div>


<%@include file="/include/bottom.jsp" %>


</body>
</html>

<!--  ckeditor 를 위한 라이브러리  -->
<script src="<%=contextPath%>/ckeditor/ckeditor.js"></script>
<script src="<%=contextPath%>/ckeditor/samples/js/sample.js"></script>

<link rel="stylesheet" href="<%=contextPath%>/ckeditor/samples/css/samples.css">
<link rel="stylesheet" href="<%=contextPath%>/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<script src="<%=contextPath%>/ckfinder/ckfinder.js"></script>


<script>


initSample();
function goWrite()
{
	var data = CKEDITOR.instances.editor.getData();
	
	var frm = document.myform;
	frm.contents=data;
	frm.action="/MVC1/guest.do?cmd=save";

	frm.method="post";
	frm.submit();
}

</script>
