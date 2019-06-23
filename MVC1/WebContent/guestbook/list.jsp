<%@ page language="java"   contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.multi.model.*" %>
<%@page import="com.multi.dto.*" %>
<%@page import="com.multi.common.*" %>
<%@page import="java.net.URLDecoder" %>


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
			
<form name="mform" >
	<input type="hidden" name="cmd"            value="write">
	<input type="hidden" name="pg"             value="0">
	<input type="hidden" name="id"             value="1">
	

	<div class="form-group" style="float:right;"> 
	  <label class="form-check-label"> 	
	   <select class="form-control" id="sel"   name="sel" style="height:40px;">
	    <option value="all"  <%if(sel.equals("all")){%>   selected    <%}%> >전체</option>
	    <option value="1"    <%if(sel.equals("1")){%>     selected    <%}%> >제목</option>
	    <option value="2"    <%if(sel.equals("2")){%>     selected    <%}%> >내용</option>
	    <option value="3"    <%if(sel.equals("3")){%>     selected    <%}%> >글쓴이</option>
	   </select>
	 </label>
	 <label class="form-check-label"> 	
	    <input type="text" class="form-control"    id="key" name="key" value="<%=key%>"
	    style="height:40px;" >
	 </label>
	 <label class="form-check-label"> 	
	   	<button type="button" onclick="goSearch()"  	class="btn btn-primary"
	   	style="height:40px;" >검색</button>
	  </label>
	</div> 
	<div style="clear:left">&nbsp;</div>
</form>

  <h2>답변 게시판</h2>
  
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
        <th>작성일자</th>
        <th>조회수</th>
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
        <td><%=tempDto.getUsername()%></td>
        <td><%=tempDto.getWdate()%></td>
        <td><%=tempDto.getHit()%></td>
      </tr>
<%} %>
    </tbody>
  </table>
  

	 <div class="form-group" style="float:right"> 
	  <button type="button" onclick="goWrite()"   	class="btn btn-primary">글쓰기</button>
	</div>

<!--  페이징 처리  -->
<%=Pager.makeTag(request, 10, totalCount)%>

	
			
			
			</section>
		</div>
	</div>

<%@include file="/include/footer.jsp" %>
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
	frm.action="<%=contextPath%>/guest.do";
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
