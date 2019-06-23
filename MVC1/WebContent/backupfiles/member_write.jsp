<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원가입</title>
        <!-- BootStrap -->
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
        
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 

	<title>Trend | Responsive Multipurpose Bootstrap Theme</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" type="text/css">

	<!-- Styles -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/owl-carousel/owl.carousel.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/owl-carousel/owl.transitions.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/flexslider/flexslider.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/isotope/isotope.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/magnific-popup/magnific-popup.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Dosis:400,200,300,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- Icon Fonts -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icomoon/style.css" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.min.css" type="text/css">

	<!-- SKIN -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/color-scheme/default-blue.css" type="text/css">


	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
           <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.2/jquery.xdomainrequest.min.js"></script>      
	<![endif]-->
        
        
        
    </head>
    <body>
    <div class="outer-wrapper">
    <form name="mform" id="mform" method="post" action="/MVC1/index.do?cmd=member&job=insert">
    
    <input type = "text" name="idcheck" value="N" id="idCheck">
    
        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
            </div>
            </br></br>
            <div class="col-md-6 col-md-offset-3">
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
        <div class="b-settings-panel">
	<div class="settings-section">
		<span>
		Boxed 
		</span>
		<div class="b-switch">
			<div class="switch-handle"></div>
		</div>
		<span>
		Wide 
		</span>
	</div>
	<hr class="dashed" style="margin: 15px 0px;">
	<h5>Main Background</h5>
	<div class="settings-section bg-list">
		<div class="bg-pattern1"></div>
		<div class="bg-pattern2"></div>
		<div class="bg-pattern6"></div>
		<div class="bg-pattern10"></div>
		<div class="bg-pattern16"></div>
		<div class="bg-pattern4"></div>
		<div class="bg-pattern5"></div>
		<div class="bg-pattern7"></div>
		<div class="bg-pattern9"></div>
		<div class="bg-pattern11"></div>
		<div class="bg-pattern12"></div>
		<div class="bg-pattern13"></div>
		<div class="bg-pattern17"></div>
		<div class="bg-pattern8"></div>
		<div class="bg-pattern14"></div>
		<div class="bg-pattern15"></div>
		<div class="bg-pattern3"></div>
		<div class="bg-pattern18"></div>
	</div>
	<hr class="dashed" style="margin: 15px 0px;">
	<h5>Color Scheme</h5>
	<div class="settings-section color-list">
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/moderate-green.css" style="background: #8ec249"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/vivid-blue.css" style="background: #228dff"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/orange.css" style="background: #fa6900"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/brown.css" style="background: #a68c69"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/yellow.css" style="background: #fabe28"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/violet.css" style="background: #ba01ff"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/strong-cyan.css" style="background: #00b9bd"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/soft-cyan.css" style="background: #4bd5ea"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/red.css" style="background: #ff0104"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/lite-brown.css" style="background: #f3a76d"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/lime-green.css" style="background: #3bdbad"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/light-voilet.css" style="background: #aaa5ff"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/gray-green.css" style="background: #697060"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/gray-cyan.css" style="background: #aeced2"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/de-green.css" style="background: #b6cd71"></div>
		<div data-src="<%=request.getContextPath()%>/css/color-scheme/cream.css" style="background: #e0d6b2"></div>

	</div>
	<div class="btn-settings"></div>
</div>
<!-- END STYLE SWITCHER 
============================================= -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>

<!-- Plugins -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/menu.js"></script>
<script src="<%=request.getContextPath()%>/js/owl-carousel/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/rs-plugin/js/jquery.themepunch.tools.min.js"></script>   
<script src="<%=request.getContextPath()%>/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/js/isotope/isotope.pkgd.js"></script>
<script src="<%=request.getContextPath()%>/js/jflickrfeed.min.js"></script>
<script src="<%=request.getContextPath()%>/js/tweecool.js"></script>
<script src="<%=request.getContextPath()%>/js/flexslider/jquery.flexslider.js"></script>
<script src="<%=request.getContextPath()%>/js/easypie/jquery.easypiechart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.appear.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.inview.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.countdown.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
<script src="<%=request.getContextPath()%>/js/magnific-popup/jquery.magnific-popup.min.js"></script>

<script src="<%=request.getContextPath()%>/js/main.js"></script>
        
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
