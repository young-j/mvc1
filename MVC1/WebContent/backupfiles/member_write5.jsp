<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원가입</title>
        
        <!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- 다음이 서비스하는 우편번호를 이용하기 위한 자바스크립트 라이브러리 -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->


    </head>
    <body>
    <form name = "mform" id="mform" method="post" 
    	action="/MVC1/index.do?cmd=member&job=insert">
    	
    	<input type = "text" name="idcheck" value="N" id="idcheck">
    	
        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                    <div class="form-group">
                        <label for="inputUserid">사용자아이디</label>
                        <input type="text" class="form-control" id="userid" 
                        name = "userid"
                        placeholder="아이디를 입력해 주세요">
                        <input type="button" onclick="goDuplicate()"
                        value="아이디 중복 체크"/>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" 
                        name="username"
                        id="inputName" placeholder="이름을 입력해 주세요">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">이메일 주소</label>
                        <input type="email" class="form-control" 
                        name="email"
                        id="inputEmail" placeholder="이메일 주소를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control"
                        name="password"
                        id="inputPassword" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPasswordCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" 
                        name="password1"
                        id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" 
                        name="phone"
                        id="inputMobile" placeholder="휴대폰번호를 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">우편 번호</label>
                        <input type="tel" class="form-control" readonly
                        name="zipcode"
                        id="zipcode" placeholder="우편번호를 입력해 주세요">
                        <input type="button" id="btnZipcode" class="btn btn-primary"
                        	onclick="goPostcode()" value="우편번호검색"/>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputtelNO">주소</label>
                        <input type="text" class="form-control" readonly
                        name="address1"
                        id="address1" placeholder="주소를 입력해 주세요">
                    </div>

                    <div class="form-group">
                        <label for="inputtelNO">상세주소</label>
                        <input type="text" class="form-control" 
                        name="address2"
                        id="address2" placeholder="상세주소를 입력해 주세요">
                    </div>
                    
                    <div class="form-group">
                    <label>약관 동의</label>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" >
                    </label>
                    <a href="#">이용약관</a>에 동의합니다.
                    </div>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
            </div>

        </article>
       </form>
    </body>
</html>

<script>
function goDuplicate() {
	//text 파일 불러오기
	var userid = $("#userid").val();
	console.log("userid : " + userid);
	
	$.ajax({
		url: "<%=request.getContextPath()%>/index.do", // 호출할 파일명
		data:{'cmd':'member', 'job':'idCheck', 'userid':userid},
		method: "POST",
		dataType: "json",	// 내가 받아야 할 결과 형태가 text, html, xml, json
		success:function(data) {
			console.log(data.idcheck);
			if(data.idcheck==true){
				$("#idcheck").val('Y');
				// 입력을 막음
				$("#userid").prop('readonly', true);				
				$("#userid").attr('readonly', true);				
			}
				
			else
				$("#idcheck").val('N');
		},
		error:function(){
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
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
</script>