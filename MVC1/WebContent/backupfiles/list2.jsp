<%@ page language="java" 
  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.multi.model.*" %>
<%@page import="com.multi.common.*" %>
<%@page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>방명록</h2>
  <p>방문을 환영합니다</p>
  <table class="table">
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
//파라미터 처리하기 
String key=Util.encoding(request.getParameter("key"));
String sel=Util.nullTo(request.getParameter("sel"));
String contextPath=request.getContextPath();

int totalCount = (int)request.getAttribute("totalCount");
System.out.println("전체데이터개수 : " + totalCount);

List<GuestbookDto> list = (List<GuestbookDto>)request.getAttribute("list");
for(int i=0; i<list.size(); i++){
	GuestbookDto tempDto = list.get(i);
%>
      <tr>
        <td><%=tempDto.getId()%></td>
        <td>
        <a href="/<%=contextPath%>/guest.do?cmd=view&id=<%=tempDto.getId()%>">
        <%=tempDto.getTitle()%>
        </a>
        </td>
        <td><%=tempDto.getWriter()%></td>
        <td><%=tempDto.getWriter()%></td>
        <td><%=tempDto.getWdate()%></td>
      </tr>
<%} %>
    </tbody>
  </table>
  
</div>

<%
int pgSize=10;
//전체페이지 개수 
int pageCount = (int)Math.ceil((double)totalCount/pgSize);
System.out.println("pageCount : "+pageCount);

//페이지그룹 문제 해결 
int pageGroupSize=10; //한 화면에 5개 페이지가
int pageGroupStart; //그룹내의 시작 페이지
int pageGroupEnd;//그룹내의 종료 페이지 

/*
pg = 17
그룹사이즈가 5 이면 1,2,3,4,5
                   6,7,8,9,10
                   11,12,13,14,15
                   16,17,18,19,20
         pg/5 -> 3*5=15+1
pageGroupStart = pg/pgGroupSize * pgGroupSize
                +1 ;
pageGroupEnd = pageGroupStart+ (pgGroupSize-1)
         
                   
*/
int pg=1;
if( request.getParameter("pg")!=null)
{
	pg = Integer.parseInt(
			 request.getParameter("pg"));
}

pageGroupStart = (pg-1)/pageGroupSize 
                 * pageGroupSize+1;
pageGroupEnd = pageGroupStart+ (pageGroupSize-1);
if( pageCount< pageGroupEnd)
	pageGroupEnd=pageCount;
//마지막 페이지 보다 더 많은 페이지 생성하면 안된다

System.out.println("pageGroupStart: "+ pageGroupStart);
System.out.println("pageGroupEnd: "+ pageGroupEnd);

//현재 17-10 = 7>=0?  true
//6    6-10>=0?  false
//현재 페이지 앞에 적어도 열개페이지 이상있을때
//앞으로 이동가능하다 
boolean hasPrevios=pg-pageGroupSize>0;
//현재 페이지 + 10 가 전체페이지개수보다 작을때
//true 이다 
boolean hasNext = pageGroupStart+pageGroupSize<pageCount;
%>
<div class="form-group" style="width:100%;text-align:center"> 
	 <ul class="pagination">
	 	<li class="page-item"><a class="page-link" href="javascript:goPage('1')">&lt;&lt;</a></li>
	 	
	 	<%if(hasPrevios){%>
	    <li class="page-item"><a class="page-link" href="javascript:goPage('<%=pageGroupStart-1%>')">&lt;</a></li>
	    <%}else{%>
	    <li class="page-item"><a class="page-link" href="javascript:goPage('1')">&lt;</a></li>
	    <%}%>
	    <%
	    int i;
	    for(i=pageGroupStart; i<=pageGroupEnd; i++){ 
	    %>
	    <li class="page-item"><a class="page-link" href="javascript:goPage('<%=i%>')"><%=i%></a></li>
	    <%}%>	    
	    
	    <%if(hasNext){%>
	    <li class="page-item"><a class="page-link" href="javascript:goPage('<%=pageGroupEnd+1%>')">&gt;</a></li>
	    <%}else{%>
	    <li class="page-item"><a class="page-link" href="javascript:goPage('<%=pageCount%>')">&gt;</a></li>
	    <%}%>
	    <li class="page-item"><a class="page-link" href="javascript:goPage('<%=pageCount%>')">&gt;&gt;</a></li>
	  </ul>  
</div> 

<form name="mform" >
	<input type="hidden" name="cmd" 
	            value="write">
	<input type="hidden" name="pg" 
	            value="1">
	

<div class="form-group"> 
  	<button type="button" onclick="goWrite()" 
   	class="btn btn-primary">글쓰기</button>
   	
   	
   <select class="form-control" id="sel" 
               name="sel">
    <option value="all"
      <%if(sel.equals("all")){%>
      selected 
      <%}%>
     >전체</option>
    <option value="1"
     <%if(sel.equals("1")){%>
      selected 
      <%}%>
    >제목</option>
    <option value="2"
    <%if(sel.equals("2")){%>
      selected 
      <%}%>
    >내용</option>
    <option value="3"
     <%if(sel.equals("3")){%>
      selected 
      <%}%>
    >글쓴이</option>
   </select>
  
   <input type="text" class="form-control" 
        id="key" name="key" value="<%=key%>">
   	<button type="button" onclick="goSearch()" 
   	class="btn btn-primary">검색</button>
</div> 
</form>
</body>
</html>

<script>

//페이지 이동용 함수 
function goPage(page)
{
	var frm = document.mform;
	//새로 변경된 페이지 정보를 저장
	frm.pg.value = page;
	frm.cmd.value="";
	frm.action="/MVC1/guest.do";
	frm.submit();
}

function  goWrite()
{
	var frm = document.mform;
	frm.cmd.value="write";
	frm.sel.value="";
	frm.pg.value=1;
	frm.key.value="";
	frm.action="/MVC1/guest.do";
	frm.submit();
}

function goSearch()
{
	//get 방식으로 서버로 보낼때는 
	//한글은 반드시 인코딩을 해서 보내야 
	//안깨진다 
	
	/*var test="김정훈웬수";
	console.log(test);
	test = encodeURI(test);
	console.log("인코딩후 : " + test);
	console.log("디코딩후 : " + 
			     decodeURI(test));
	*/
	var key = document.getElementById("key").value;
	key = encodeURI(key);//인코딩 
	var frm = document.mform;
	frm.method="get";
	frm.cmd.value="list";
	frm.key.value=key;
	frm.action="/MVC1/guest.do";
	frm.submit();
}

</script>



