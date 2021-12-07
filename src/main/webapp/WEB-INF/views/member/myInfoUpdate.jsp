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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <title>MyInfomation</title>
  <meta name="author" content="jimmer"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/enroll.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" />
<style>
</style>
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>

  <body>
   <div class="container-contact100" >
    <div class="wrap-contact100">
      <div class="intro_container">
        <div class="namebox">
          <h1 class="main-name">MyInfo</h1>
        </div>
          <div class="row">
            <!--<div class="signUpForm" onselectstart="return false">-->
            <div class="signUpForm">
                <form 
                	name="memberUpdateFrm" 
					action="<%= request.getContextPath() %>/member/memberUpdate"
					method="POST"
					>
				<!-- <form action="javascript:alert('제출성공');" name="signUpForm" method="POST"> -->
                	    
                <fieldset id="signUpForm">
                  <div class="wrap-input100">
                    <span class="label-input100">Id *</span>
                    <input class="input100" type="text" name="memberId" id="memberId" value="<%= loginMember.getMemberId() %>" readonly>
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="idConfirm">&nbsp; </span>
                  </div> 
                  <div class="wrap-input100">
                    <span class="label-input100">Name  *</span>
                    <input class="input100" type="text" name="memberName" id="memberName" value="<%= loginMember.getMemberName() %>" required>
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="memberNameConfirm">&nbsp; </span>
                  </div>  
                  <div class="wrap-input100" data-validate="Name is required">
                      <span class="label-input100">PhoneNumber  *</span>
                      <input class="input100" type="text" name="tel" id="tel" maxlength="11" value="<%=loginMember.getTel() %>" required>
                      <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="telConfirm">&nbsp; </span>
                  </div>
                  <div class="wrap-input100">
                    <span class="label-input100">Email  *</span>
                    <input class="input100" type="text" name="email" id="email" value="<%= loginMember.getEmail() %>">
                    <span class="focus-input100"></span>
                  </div>
				  <div>
                    <span class="confirm" id="emailConfirm">&nbsp; </span>
                  </div>
                  <div class="wrap-input100 ">
                    <span class="label-input100">PayCode</span>
                    <input class="input100" type="text" name="payCode" id="payCode" value="<%= loginMember.getPayCode() %>">
                    <span class="focus-input100"></span>
                  </div>
				  <div>
                    <span class="confirm" id="paycodeConfirm">&nbsp; </span>
                  </div>
                  <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                    <button class="contact100-form-btn" id="signUpButton" onclick="updateMember();">
                      <span>
                        Update
                      </span>
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