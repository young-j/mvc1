<%@page import="com.multi.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.common.Pager"%>
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

int totalCount = (int)request.getAttribute("totalCount");
System.out.println("전체데이터개수 : " + totalCount);

%>
<div class="outer-wrapper">

	<%@include file="/include/header.jsp" %>
<div>


	<!-- INNER CONTENT -->
	<div class="inner-content">
		<div class="container">
			<section id="portfolio-section">
				<!--  이 태그 안에 모든 소스를 갖다놓아야 한다  -->

<div class="d-flex" id="wrapper">


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
<%
	List<GalleryDto> list = (List<GalleryDto>)request.getAttribute("list");

	
%>

 <h2>사진 게시판</h2>

<div class="container" style="clear:both">
  <div class="row">
  <%
  for(int i=0; i<list.size(); i++){
		GalleryDto tempDto = list.get(i);
		int num = tempDto.getNum();
  	%>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="#none" onclick="goView('<%=tempDto.getId()%>')" >
          
          <img src="<%=request.getContextPath()%>/upload/gallery/<%=tempDto.getFileName1()%>" onerror="this.src='<%=request.getContextPath()%>/images/No_Image.jpg'" style="width:100%; height:200px">
          <div class="caption">
            <p><%=tempDto.getTitle()%></p>
          </div>
        </a>
      </div>
    </div>
   <%} %>
   </div>    
  </div>
</div>

	 <div class="form-group" style="float:right"> 
	  <button type="button" onclick="goWrite()"   	class="btn btn-primary">글쓰기</button>
	</div>

<!--  페이징 처리  -->
<%=Pager.makeTag(request, 9, totalCount)%>

			</section>
		</div>
	</div>


<%@include file="/include/bottom.jsp" %>


</body>
</html>


<script>

//페이지 이동용 함수 
function goPage(page)
{
	var frm = document.mform;
	//새로 변경된 페이지 정보를 저장
	frm.pg.value = page;
	frm.cmd.value="list";
	frm.action="<%=contextPath%>/gallery.do";
	frm.submit();
}

function  goWrite()
{
	writer='<%=(String)session.getAttribute("userid")%>';

	if(writer=='null' || writer==''){
		alert("로그인 후 작성해주세요");
		$("#contents").focus();
		return false;
	}
	var frm = document.mform;
	frm.cmd.value="write";
	frm.sel.value="";
	frm.pg.value=1;
	frm.key.value="";
	frm.action="<%=contextPath%>/gallery.do";
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
	frm.action="<%=contextPath%>/gallery.do";
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
	frm.action="<%=contextPath%>/gallery.do";
	frm.submit();
}
</script>