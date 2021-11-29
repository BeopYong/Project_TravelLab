<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<title>Contact V4</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"> 
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/enrollUtil.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/enroll.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Enrollment
				</span>
				<div class="wrap-input100 validate-input" data-validate="Name is required">
					<span class="label-input100">Id <sup>*</sup></span>
					<input class="input100" type="text" name="memberId" id="_memberId" placeholder="Enter your id">
					<!-- <input type="button" value="아이디중복검사" onclick="checkIdDuplicate();"/> -->
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input" data-validate="Name is required">
					<span class="label-input100">Password <sup>*</sup></span>
					<input class="input100" type="password" name="_password" id="_password" placeholder="Enter your Password">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input" required>
					<span class="label-input100">PasswordCheck <sup>*</sup></span>
					<input class="input100" type="password" name="passwordCheck" placeholder="Confirm your Password">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input" data-validate="Name is required">
					<span class="label-input100">Name <sup>*</sup></span>
					<input class="input100" type="text" name="memberName" id="memberName" placeholder="Enter your name">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					<span class="label-input100">Email <sup>*</sup></span>
					<input class="input100" type="text" name="email" id="email" placeholder="Enter your email addess">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="Name is required">
					<span class="label-input100">PhoneNumber<sup>*</sup></span>
					<input class="input100" type="tel" name="tel" id="tel" placeholder="Enter your phone number">
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button class="contact100-form-btn">
							<input type="submit" value="가입" >
							<input type="reset" value="취소">
							<!-- <span>
								Submit
								<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
							</span> -->
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>



	<div id="dropDownSelect1"></div>
<script>
$(document.memberEnrollFrm).submit((e) => {
	
	//memberId
	const $memberId = $(_memberId);
	//아이디는 영문자/숫자  4글자이상만 허용 
	if(!/^\w{4,}$/.test($memberId.val())){
		alert("아이디는 최소 4자리이상이어야 합니다.");
		return false;
	}
	
	//memberId 중복검사
	const $idValid = $(idValid);
	if($idValid.val() == 0){
		alert("아이디 중복 검사해주세요.");
		return false;
	}
	
	//password
	const $password = $(_password);
	const $passwordCheck = $(passwordCheck);
	
	if(!/^[a-zA-Z0-9!@#$+/=]{4,}$/.test($password.val())){
		alert("유효한 패스워드를 입력하세요.");
		return false;
	}
	if($password.val() != $passwordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		return false;
	}
	
	//memberName
	const $memberName = $(memberName);
	if(!/^[가-힣]{2,}$/.test($memberName.val())){
		alert("이름은 한글 2글자 이상이어야 합니다.");
		return false;
	}
	
	//phone
	const $tel= $(tel);
	if(!/^010[0-9]{8}$/.test($tel.val())){
		alert("유효한 전화번호가 아닙니다.");
		return false;
	}
	return true;
});

</script>


<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath() %>/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>
