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
    <form name="mform" id="mform" method="post" action="/MVC1/index.do?cmd=member&job=insert">
    
    <input type = "hidden" name="idcheck" value="N" id="idCheck">
    
        <article class="container">
            <div class="col-md-6 col-md-offset-3">
            <h2>회원가입</h2><br><br>
					<form method="post">
						<div class="form-group">
							<label>사용자 아이디</label>
							<label class="sr-only" for="userid"></label>
							<input type="text" class="form-control" 
		                        name="userid"
		                        id="userid" placeholder="아이디를 입력하세요">
		                        <div class="space10"></div>
		                        <input type="button" name="idCheck"
		                        id="idCheck" onclick="goDuplicate()"
		                        value="아이디 중복 체크" class="button btn-md pull-left" />
		                        <div class="space20"></div>			                        
						</div>
						<div class="form-group">
						</br></br>
							<label>성명</label>
							<label class="sr-only" for="username"></label>
							<input type="text" class="form-control"
			                        name="username"
			                        id="inputName" placeholder="이름을 입력해 주세요">
						</div>
						<div class="form-group">
							<label>이메일</label>
							<label class="sr-only" for="email"></label>
							<input type="email" class="form-control"
		                        name="email"
		                        id="email" placeholder="이메일 주소를 입력해주세요">
						</div>
						<div class="form-group">
								<label>비밀번호</label>
								<label class="sr-only" for="password"></label>
								<input type="password" class="form-control"
		                        name="password"
		                        id="inputPassword" placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="form-group">
								<label>비밀번호 확인</label>
								<input type="password" class="form-control"
		                        name="password2"
		                        id="password2" placeholder="한번더 입력 해 주세요">		                        
							
						</div>
						<div class="form-group">						
						<label>휴대폰 번호</label>
							<label class="sr-only" for="phone"></label>
							<input type="tel" class="form-control"
	                        name="phone"
	                        id="phone" placeholder="휴대폰번호를 입력해 주세요">
						</div>
						<div class="form-group">
						<label>우편번호</label>
							<label class="sr-only" for="zipcode"></label>
							<input type="text" class="form-control" readonly
                        		name="zipcode"
                        		id="zipcode" placeholder="우편번호를 입력해 주세요">
                        		<div class="space10"></div>	
                        		<input type="button" id="btnZipcode" class="button btn-md pull-left"
                       			onclick="goPostcode()" value="우편번호검색" />
						</div>
						<div class="form-group">
						</br></br>
						<label>주소</label>
							<label class="sr-only" for="address1"></label>
							<input type="text" class="form-control" readonly
		                        name="address1"
		                        id="address1" placeholder="주소를 입력해 주세요">
						</div>
						
						<div class="form-group">
						<label>상세주소</label>
							<label class="sr-only" for="address2"></label>
							<input type="text" class="form-control"
	                        name="address2"
	                        id="address2" placeholder="상세주소를 입력해 주세요">
						</div>

						<div class="space20"></div>
						<div class="form-group text-center">
                        <button type="button" id="join-submit" class="button btn-md pull-left"
                   			value="등록하기" onclick="goWrite()">
                       	  	회원가입<i class="fa fa-check spaceLeft"></i>                     
                       	</button>
                        <button type="submit" class="button btn-md pull-right">
                            	가입취소<i class="fa fa-times spaceLeft"></i>
                      	</button>
                    </div>
						
					</form>
					</br></br></br>
					
				</div>
	       </article>
        </form>
        </div>
			
			
			
			</section>
		</div>
	</div>


<%@include file="/include/bottom.jsp" %>


</body>
</html>
<script>
function goDuplicate(){
	
	var userid = $("#userid").val();
	console.log("userid : " + userid);
	var frm= document.mform;	
	
	$.ajax({
	      url: "<%=request.getContextPath()%>/index.do",    //호출할 파일명. 같은 폴더에 두어야 좋다.
	      data:{'cmd':'member', 'job':'idCheck', 'userid':userid},
	      method: "POST",
	      dataType: "json",      //받아내야 할 결과 형태 : text, html, xml, json
	      success:function(data){ //성공시 data가 json 객체를 받아옴.
	         console.log(data.idcheck);   //브라우저에서 f12로 확인, 디버깅
	        if( frm.userid.value.length<4)
	     		{
	     		alert('아이디가 너무 짧습니다. 4자 이상으로 해주세요.');
	     		frm.userid.focus();
	     		return false;
	     	}
	        else if( data.idcheck == true) {
	            alert("사용가능한 아이디입니다.");
	            $("#idCheck").val('Y');
	            //disabled - 중복확인 이후에 아예 입력을 막음
	            $("#userid").prop('readonly', true); //*****************************
	            $("#userid").attr('readonly', true); //*****************************
	         }
	        else {
	            alert("이미 존재하는 아이디입니다.");
	            $("#idCheck").val('N');
	         }
	      },
	      error:function(){      //실패시
	         console.log("데이터 로딩 실패");
	      }
	   });
}


//우편번호를 위한 자바스크립트 함수
 function goPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : 
                	   data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
                document.getElementById("address2").value = data.jibunAddress;
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

 function goWrite()
 {
 	var frm= document.mform;
 	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 	var email = document.getElementById("email");
 	
 	if( frm.idcheck.value!='Y')
 	{
 		alert('아이디 중복체크를 해주세요.');
 		frm.idcheck.focus();
 		return false;
 	}
 	
 	if( frm.username.value.length==0)
 	{
 		alert('이름을 입력해주세요.');
 		frm.username.focus();
 		return false;
 	}
 	
 	if( frm.email.value.length==0)
 	{
 		alert('이메일을 입력해주세요.');
 		frm.eamil.focus();
 		return false;
 	}
 	
 	if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

 	
 	if( frm.password.value.length<4)
 	{
 		alert('패스워드는 4글자 이상으로 해주세요');
 		frm.password.focus();
 		return false;
 	}
 	if( frm.password.value!=frm.password2.value)
 	{
 		alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
 		frm.password.focus();
 		return false;
 	}
 	if( frm.address1.value.length==0)
 	{
 		alert('주소를 입력해주세요.');
 		frm.address1.focus();
 		return false;
 	}
 	if( frm.address2.value.length==0)
 	{
 		alert('상세주소를 입력해주세요.');
 		frm.address2.focus();
 		return false;
 	}
 	
 	frm.action="<%=request.getContextPath()%>/index.do?cmd=member&job=writeOK";
 	frm.method="post";
 	frm.submit();
 	
 }
 
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}

</script>