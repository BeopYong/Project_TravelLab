
$("#memberId").focusin(function() {
	$(".confirm").html("&nbsp;");
});

$("#memberId").focusout(function() {
	var memberId = $("#memberId").val();
	var text = $("#idConfirm");

	const regExp1 = /^[a-z][a-z\d]{3,11}$/;
	const regExp1sub = /^[a-z]/;
	const regExp1sub2 = /[0-9]/;


	if (memberId == "") {
		idConfirm.innerText = "필수 입력사항입니다";
		text.css("color", "red");
		return false;
	}
	else if (!regExp1sub.test(memberId)) {
		idConfirm.innerText = "아이디 시작은 소문자로 해주세요.";
		text.css({
			"color": "red",
			"font-size": "14px"
		});
		return false;
	}
	else if (!regExp1sub2.test(memberId)) {
		idConfirm.innerText = "아이디에는 숫자가 포함되야합니다.";
		text.css({
			"color": "red",
			"font-size": "14px"
		});
		return false;
	}
	else if (!regExp1.test(memberId)) {
		idConfirm.innerText = "영문,숫자포함 4~12자리(소문자시작)";
		text.css({
			"color": "red",
			"font-size": "14px"
		});
		return false;
	}
	else if (regExp1.test(memberId)) {

		$.ajax({
			url: "<%= request.getContextPath() %>/member/checkIdDuplicateByAjax",
			dataType: "json",
			data: {
				memberId: $(memberId).val()
			},
			success(data) {
				console.log(data);
				if (data == null) {
					idConfirm.innerText = "사용가능한 아이디입니다.";
					text.css({ "color": "blue", "font-size": "14px" });
					return true;
				} else {
					idConfirm.innerText = "사용중인 아이디입니다.";
					text.css({ "color": "red", "font-size": "14px" });
					return false;
				}
			},
			error: console.log
		});
		
		idConfirm.innerText = "db조회에러. 잠시 후 다시 이용해주세요";
		text.css({
			"color": "red",
			"font-size": "14px"
		});
		return false;
	}

});

//정규표현식 참고
//https://beagle-dev.tistory.com/114


const $password1Valid = $("#password");
$password1Valid.focusout(function() {
	var password1 = $("#password").val();
	var text = $("#passwordConfirm1");
	const regExp2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
	if (!regExp2.test(password1)) {
		passwordConfirm1.innerText = "숫자/문자/특수문자/포함된 8~15자리";
		text.css({
			"color": "red",
			"font-size": "14px"
		});
	}
	else if (regExp2.test(password1)) {
		passwordConfirm1.innerText = "사용가능합니다.";
		text.css({
			"color": "blue",
			"font-size": "14px"
		});
	}
});

$("#passwordChk").focusout(function() {
	var password1 = $("#password").val();
	var password2 = $("#passwordChk").val();
	const text = $("#passwordConfirm2");
	if (password1 == "") {
		passwordConfirm2.innerText = "비밀번호를 입력해 주세요.";
		text.css("color", "red");
	}
	else if (password1 != password2) {
		passwordConfirm2.innerText = "비밀번호가 일치하지 않습니다.";
		text.css("color", "red");
	}
	else if (password1 == password2) {
		passwordConfirm2.innerText = "비밀번호가 일치합니다.";
		text.css({
			"color": "blue",
			"font-size": "14px"
		});
	}
	$("#passwordConfirm1").html("&nbsp;");
});

$("#memberName").focusin(function() {
	$(".confirm").html("&nbsp;");
});

$("#memberName").focusout(function() {
	var memberName = $("#memberName").val();
	var text = $("#memberNameConfirm");
	var regExp3 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣][ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,3}$/;
	if (memberName == "") {
		memberNameConfirm.innerText = "필수 입력사항입니다";
		text.css("color", "red");
	}
	else if (!regExp3.test(memberName)) {
		memberNameConfirm.innerText = "한글 2글자이상 4글자 이하입니다";
		text.css({
			"color": "red",
			"font-size": "14px"
		});
	}
	else if (regExp3.test(memberName)) {
		memberNameConfirm.innerText = "사용가능합니다";
		text.css({
			"color": "blue",
			"font-size": "16px"
		});
	}
});


$("#email").focusin(function() {
	$(".confirm").html("&nbsp;");
});

$("#email").focusout(function() {

	var userEmail = $("#email").val();
	var text = $("#emailConfirm");
	const regExp4 = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
	if (userEmail == "") {
		emailConfirm.innerText = "필수 입력사항입니다";
		text.css("color", "red");
	}
	else if (!regExp4.test(userEmail)) {
		emailConfirm.innerText = "올바르지 않은 이메일입니다.";
		text.css("color", "red");
	}
	else if (regExp4.test(userEmail)) {
		emailConfirm.innerText = "사용가능한 이메일입니다.";
		text.css({
			"color": "blue",
			"font-size": "14px"
		});
	}
});

$("#tel").focusin(function() {
	$(".confirm").html("&nbsp;");
});

$("#tel").focusout(function() {

	var tel = $("#tel").val();
	var text = $("#telConfirm");
	const regExp5 = /^010[0-9]{8}$/;
	if (tel == "") {
		telConfirm.innerText = "필수 입력사항입니다";
		text.css("color", "red");
	}
	else if (!regExp5.test(tel)) {
		telConfirm.innerText = "유효한 전화번호가 아닙니다.";
		text.css("color", "red");
	}
	else if (regExp5.test(tel)) {
		telConfirm.innerText = "사용가능한 전화번호 입니다.";
		text.css({
			"color": "blue",
			"font-size": "14px"
		});
	}

});
$(document.signUpform).submit((e) => {
	//가입완료
	alert("가입완료");
	saveMember();
});

const saveMember = () => {
	const $memberId = $(memberId);
	const $password = $(password);
	const $memberName = $(memberName);
	const $tel = $(tel);
	const $email = $(email);

	if ($memberId.val() == "" || $password.val() == "" ||
		$memberName.val() == "" || $tel.val() == "" ||
		$email.val() == "")
		return;

	// 1. 사용자입력값을 MemberMap객체생성
	const mb = new MemberMap($memberId.val(), $password.val(),
		$memberName.val(), $tel.val(), $email.val());
	// 2. localStorage에 추가 : 배열로 관리
	const members = JSON.parse(localStorage.getItem("members")) || [];
	members.push(mb);
	console.log(members);

	localStorage.setItem("members", JSON.stringify(members));
	// 3.초기화
	$memberId.val('');
	$password.val('');
	$memberName('');
	$tel('');
	$email('');

};

class MemberMap {
	constructor(memberId, password, memberName, tel, email) {
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.tel = tel;
		this.email = email;
		this.datetime = Date.now(); // unix time 밀리초
	}
}

function regExp(regExp, el) {
	if (regExp.test(el.value))
		return true;
	//적합한 문자열이 아닌 경우
	el.value = "";
	el.focus();
	return false;
}

function signUpCheck() {
	var memberId = document.getElementById("memberId");
	var password = document.getElementById("password");
	var passwordChk = document.getElementById("passwordChk");
	var memberName = document.getElementById("memberName");
	var tel = document.getElementById("tel");
	var email = document.getElementById("email");

	//1.아이디검사
	//첫글자는 반드시 영소문자로 이루어지고, 
	//숫자가 하나이상 포함되어야함.
	//아이디의 길이는 4~12글자사이

	var regExp1 = /^[a-z][a-z\d]{3,11}$/;
	var regExp2 = /[0-9]/;
	if (!regExpTest(regExp1
		, memberId
		, "아이디는 영소문자로 시작하는 4~12글자입니다."))
		return false;
	if (!regExpTest(regExp2
		, memberId
		, "아이디는 숫자를 하나이상 포함하세요."))
		return false;

	//2.비밀번호 확인 검사
	//숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 
	//전체길이검사 /^.{8,15}$/
	//숫자하나 반드시 포함 /\d/ 
	//영문자 반드시 포함 /[a-zA-Z]/
	//특수문자 반드시 포함  /[\*!&]/

	var regExpArr = [/^.{8,15}$/, /\d/, /[a-zA-Z]/, /[\*!&]/];

	for (let i = 0; i < regExpArr.length; i++) {
		if (!regExpTest(regExpArr[i], password, "비밀번호는 8~15자리 숫자/문자/특수문자를 포함해야합니다.")) {
			return false;
		}
	}

	if (!isEqualpassword()) {
		return false;
	}

	//3.이름검사
	//한글2글자 이상만 허용. [가-힣] 으로 해도되긴 하지만 자음만(ㄱㄴㄷㄹ)있으면 필터링이 안됨
	var regExp3 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
	if (!regExpTest(regExp3, memberName, "한글2글자이상 입력하세요."))
		return false;

	//4.전화번호검사
	var regExp5 = /^010[0-9]{8}$/;
	if (!regExpTest(regExp5, tel, "유효한 전화번호가 아닙니다."))
		return false;

	//5.이메일 검사
	// 4글자 이상(\w = [a-zA-Z0-9_], [\w-\.]) @가 나오고
	// 1글자 이상(주소). 글자 가 1~3번 반복됨
	if (!regExpTest(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/, email, "이메일 형식에 어긋납니다."))
		return false;

	document.signUpform.submit();

}

function isEqualpassword() {
	if (password.value == passwordChk.value) {
		return true;
	}
	else {
		alert("비밀번호가 일치하지 않습니다.");
		password.select();
		return false;
	}
}

function regExpTest(regExp, el, msg) {
	if (regExp.test(el.value))
		return true;
	//적합한 문자열이 아닌 경우
	alert(msg);
	el.value = "";
	el.focus();
	return false;
}