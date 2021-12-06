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
  <title>DeleteMember</title>
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
          <h1 class="main-name">DelLogin</h1>
        </div>
          <div class="row">
            <!--<div class="signUpForm" onselectstart="return false">-->
            <div class="signUpForm">
                <form 
                	name="checkMemberFrm" 
					action="<%= request.getContextPath() %>/member/memberDelete"
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
                  <div class="wrap-input100 ">
                    <span class="label-input100">Password *</span>
                    <input class="input100" type="password" name="password" id="password" required >
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span>&nbsp;</span>
                  </div>
                  <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                    <button class="contact100-form-btn" id="signUpButton" onclick="signUpCheck();">
                      <span>
                        SignUp
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
    
/* 	    $(document.signUpForm).submit((e) => {
	    	return true;
	    	saveMember();
	    });
	 */
	    function signUpCheck() {
	    	//document.signUpForm.submit();
	    	return true;
	    }
		
    </script>
	<%-- <script src="<%=request.getContextPath() %>/js/enroll.js"></script> --%>
  </body>
</html>