<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	
	Member loginMember = (Member) session.getAttribute("loginMember");
	
	//쿠키처리
	Cookie[] cookies = request.getCookies();
	String saveMemberId = null;
	if(cookies != null){
		for(Cookie cookie : cookies){
			String name = cookie.getName();
			String value = cookie.getValue();
			System.out.println(name + " = " + value);
			if("saveId".equals(name)){
				saveMemberId = value;
			}
		}
	}
	System.out.println("saveMemberId@header.jsp = " + saveMemberId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>MyInfomation</title>
<meta name="author" content="jimmer" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/enroll.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" />
<style> /* css 캐싱문제로 임시로 부여  */
@charset "UTF-8";
/************
   태그 스타일
  *************/
body {
	margin: 0px;
	font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif,
		"Nanum Barun Gothic", "Nanum Gothic";
	/* font-family: "Apple SD Gothic Neo", "Nanum Barun Gothic", "Nanum Gothic", Verdana, Arial, "Malgun Gothic", Dotum, sans-serif; */
	overflow-y: scroll;
	word-break: keep-all;
	color: #1b1b1b;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-weight: 700;
	text-align: center;
}

h1.main-name {
	font-size: 46px;
	margin-top: 10px;
	margin-bottom: 2px;
	margin-left: 0px;
	margin-right: 0px;
	font-weight: 800;
	letter-spacing: 1px;
	text-align: center;
}

.input100 {
	font-weight: 600;
	color: #ffffff8c;
}

.confirm {
	margin-top: 2px;
	margin-bottom: 2px;
	margin-right: auto;
	font-size: 14px;
}

#signUpButton, #resetButton {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	padding-top: auto;
	padding-bottom: auto;
	/* background: #a64bf4;
    background: -webkit-linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
    background: -o-linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
    background: -moz-linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
    background: linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff); */
	/* -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s; */
	color: white;
	font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
		nanumgothic, dotum, sans-serif;
	font-size: 17px;
	line-height: 20px;
	display: block;
	padding-left: 5px;
	margin-left: auto;
	margin-right: auto;
	padding-right: 0;
	width: 200px;
	overflow: hidden;
	border: 0;
	border-color: transparent;
	margin-bottom: 0px;
	border-radius: 2px;
	background-clip: padding-box;
	text-align: center;
	transition: background-color .75s ease;
	font-weight: 700;
	text-decoration: none;
}

.copyright, .reference {
	margin: 0;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: 15px;
	margin-bottom: 7px;
}
/*============컨테이너 제어=============*/
.container-contact100 {
	width: 100%;
	min-height: 100vh;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	padding: 0px;
	background: #a64bf4;
	background: -webkit-linear-gradient(45deg, #00dbde, #fc00ff);
	background: -o-linear-gradient(45deg, #00dbde, #fc00ff);
	background: -moz-linear-gradient(45deg, #00dbde, #fc00ff);
	background: linear-gradient(45deg, #00dbde, #fc00ff);
}

.wrap-contact100 {
	width: 500px;
	background: #fff;
	border-radius: 10px;
	overflow: hidden;
	padding: 42px 0px 25px 0px;
}

.namebox {
	position: relative;
	min-height: 80px;
	margin-top: 10px;
	color: #b300faa2;
	align-content: center;
}

.intro_container {
	width: 500px;
	/* padding-right: 15px;
    padding-left: 15px; */
	padding-bottom: 0px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 10px;
	margin-bottom: 0px;
}

.wrap-input100 {
	width: 100%;
	position: relative;
	border-bottom: 2px solid #d9d9d9;
	padding-bottom: 13px;
	margin-bottom: 2px;
}

.label-input100 {
	font-family: Poppins-Regular;
	font-size: 16px;
	color: #b300faa2;
	line-height: 1;
	padding-left: 0px;
	padding-right: 0px;
}

/*-----------------input제어-----------------*/
input {
	outline: none;
	border: none;
}

input:focus::-webkit-input-placeholder {
	color: transparent;
}

input:focus:-moz-placeholder {
	color: transparent;
}

input:focus::-moz-placeholder {
	color: transparent;
}

input:focus:-ms-input-placeholder {
	color: transparent;
}

input::-webkit-input-placeholder {
	color: #adadad;
}

input:-moz-placeholder {
	color: #adadad;
}

input::-moz-placeholder {
	color: #adadad;
}

input:-ms-input-placeholder {
	color: #adadad;
}

.input100 {
	display: block;
	width: 100%;
	background: transparent;
	font-family: Poppins-Medium;
	font-size: 18px;
	color: #333333;
	line-height: 1.2;
	padding: 0 5px;
}

.label-input100 {
	font-family: Poppins-Regular;
	font-size: 13px;
	color: #666666;
	line-height: 1.5;
	padding-left: 5px;
}

.input100 {
	display: block;
	width: 100%;
	background: transparent;
	font-family: Poppins-Medium;
	font-size: 18px;
	color: #333333;
	line-height: 1.2;
	padding: 0 5px;
}

.focus-input100 {
	position: absolute;
	display: block;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	pointer-events: none;
}

.focus-input100::before {
	content: "";
	display: block;
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 0;
	height: 2px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
	background: #7f7f7f;
}

.input100:focus+.focus-input100::before {
	width: 100%;
}

/*-----------------Button제어-----------------*/
.container-contact100-form-btn {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	padding-top: 13px;
}

.wrap-contact100-form-btn {
	width: 100%;
	display: block;
	color: transparent;
	position: relative;
	z-index: 1;
	border-radius: 25px;
	overflow: hidden;
	margin: 0 auto;
}

.contact100-form-bgbtn {
	position: absolute;
	z-index: -1;
	width: 300%;
	height: 100%;
	background: #a64bf4;
	background: -webkit-linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
	background: -o-linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
	background: -moz-linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
	background: linear-gradient(left, #00dbde, #fc00ff, #00dbde, #fc00ff);
	top: 0;
	left: -100%;
	box-shadow: 12px 12px 2px 1px rgba(0, 0, 255, .2);
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}

.contact100-form-btn {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
	width: 100%;
	height: 50px;
	background-color: transparent;
	font-family: Poppins-Medium;
	font-size: 16px;
	color: #fff;
	line-height: 1.2;
}

.wrap-contact100-form-btn:hover .contact100-form-bgbtn {
	left: 0;
}

.contact100-form-btn i {
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}

.contact100-form-btn:hover i {
	-webkit-transform: translateX(10px);
	-moz-transform: translateX(10px);
	-ms-transform: translateX(10px);
	-o-transform: translateX(10px);
	transform: translateX(10px);
}

/*-----------------Button제어-----------------*/
div.signUpForm {
	min-height: 20px;
	width: 260px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
	padding: 5px 10px 10px 22px;
	/* background-color: #ffffff; */
	border-radius: 4px;
	font-weight: 500;
	color: #b300faa2;
}

.main_container {
	width: 550px;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 10px;
}

#signUpForm {
	margin-left: 10px;
	margin-right: 10px;
	padding: 0px 0px 1px 5px;
	width: 250px;
	border: 1px;
	border-color: transparent;
}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>

<body>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<div class="intro_container">
				<div class="namebox">
					<h1 class="main-name">MyInfo</h1>
				</div>
				<div class="row">
					<!--<div class="signUpForm" onselectstart="return false">-->
					<div class="signUpForm">
						<form name="memberUpdateFrm"
							action="<%= request.getContextPath() %>/member/memberUpdate"
							method="POST">
							<!-- <form action="javascript:alert('제출성공');" name="signUpForm" method="POST"> -->

							<fieldset id="signUpForm">
								<div class="wrap-input100">
									<span class="label-input100">Id *</span> <input
										class="input100" type="text" name="memberId" id="memberId"
										value="<%= loginMember.getMemberId() %>" readonly> <span
										class="focus-input100"></span>
								</div>
								<div>
									<span class="confirm" id="idConfirm">&nbsp; </span>
								</div>
								<div class="wrap-input100">
									<span class="label-input100">Name *</span> <input
										class="input100" type="text" name="memberName" id="memberName"
										value="<%= loginMember.getMemberName() %>" required> <span
										class="focus-input100"></span>
								</div>
								<div>
									<span class="confirm" id="memberNameConfirm">&nbsp; </span>
								</div>
								<div class="wrap-input100" data-validate="Name is required">
									<span class="label-input100">PhoneNumber *</span> <input
										class="input100" type="text" name="tel" id="tel"
										maxlength="11" value="<%=loginMember.getTel() %>" required>
									<span class="focus-input100"></span>
								</div>
								<div>
									<span class="confirm" id="telConfirm">&nbsp; </span>
								</div>
								<div class="wrap-input100">
									<span class="label-input100">Email *</span> <input
										class="input100" type="text" name="email" id="email"
										value="<%= loginMember.getEmail() %>"> <span
										class="focus-input100"></span>
								</div>
								<div>
									<span class="confirm" id="emailConfirm">&nbsp; </span>
								</div>
								<div class="wrap-input100 ">
									<span class="label-input100">PayCode</span> <input
										class="input100" type="text" name="payCode" id="payCode"
										value="<%= loginMember.getPayCode() %>"> <span
										class="focus-input100"></span>
								</div>
								<div>
									<span class="confirm" id="paycodeConfirm">&nbsp; </span>
								</div>
								<div class="wrap-contact100-form-btn">
									<div class="contact100-form-bgbtn"></div>
									<button class="contact100-form-btn" id="signUpButton"
										onclick="updateMember();">
										<span> Update </span>
									</button>
								</div>
								<div>
									<span>&nbsp;</span>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
			
 <%--    const updateMember = () => {
    	// 폼의 action값을 할당후 제출!
    	$(memberUpdateFrm)
    		.attr("action", "<%= request.getContextPath() %>/member/memberUpdate")
    		.submit();
    }; --%>
    
    $(memberUpdateFrm).submit((e) => {
    	
    	//memberName
    	const $memberName = $(memberName);
    	if(!/^[가-힣]{2,}$/.test($memberName.val())){
    		alert("이름은 한글 2글자 이상이어야 합니다.");
    		return false;
    	}
    	
    	//phone
    	const $tel = $(tel);
    	if(!/^010[0-9]{8}$/.test($tel.val())){
    		alert("유효한 전화번호가 아닙니다.");
    		return false;
    	}
    	//email
    	const $email = $(email).val();
    	if(!/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/.test($email.val())){
    		alert("올바르지 않은 이메일 형식입니다.")
    		return false;
    	}
    	//
    	const $payCode =$(payCode).val();
    	if(!/^[0-9]{1,6}$/.test($payCode.val())){
    		alert("잘못된번호입니다.")
    		return false;
    	}
    	return true;
    });
    
    </script>
	<%-- <script src="<%=request.getContextPath() %>/js/enroll.js"></script> --%>
</body>
</html>