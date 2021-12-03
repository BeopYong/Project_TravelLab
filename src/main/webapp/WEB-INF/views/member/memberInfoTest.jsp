<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <title>Enroll</title>
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
          <h1 class="main-name">Enrollment</h1>
        </div>
          <div class="row">
            <!--<div class="signUpForm" onselectstart="return false">-->
            <div class="signUpForm">
                <form 
                	name="checkIdDuplicateFrm" 
					action="<%= request.getContextPath() %>/member/memberEnroll"
					method="POST"
					>
				<!-- <form action="javascript:alert('제출성공');" name="signUpForm" method="POST"> -->
                	    
                <fieldset id="signUpForm">
                  <div class="wrap-input100">
                    <span class="label-input100">Id *</span>
                    <input class="input100" type="text" name="memberId" id="memberId" required placeholder="Enter your Id">
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="idConfirm">&nbsp; </span>
                  </div> 
                  <div class="wrap-input100 ">
                    <span class="label-input100">Password *</span>
                    <input class="input100" type="password" name="password" id="password" required placeholder="Enter your password">
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="passwordConfirm1">&nbsp; </span>
                  </div> 
                  <div class="wrap-input100">
                    <span class="label-input100">PasswordCheck  *</span>
                    <input class="input100" type="password" name="passwordChk" id="passwordChk" required placeholder="Check your password">
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="passwordConfirm2">&nbsp; </span>
                  </div> 
                  <div class="wrap-input100">
                    <span class="label-input100">Name  *</span>
                    <input class="input100" type="text" name="memberName" id="memberName" required placeholder="Enter your Name">
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="memberNameConfirm">&nbsp; </span>
                  </div>  
                  <div class="wrap-input100" data-validate="Name is required">
                      <span class="label-input100">PhoneNumber  *</span>
                      <input class="input100" type="text" name="tel" id="tel" required placeholder="Enter your phone number">
                      <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="telConfirm">&nbsp; </span>
                  </div>
                  <div class="wrap-input100">
                    <span class="label-input100">Email  *</span>
                    <input class="input100" type="text" name="email" id="email" required placeholder="Enter your email addess">
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="emailConfirm">&nbsp; </span>
                  </div>
                  <div class="wrap-input100 ">
                    <span class="label-input100">PayCode</span>
                    <input class="input100" type="text" name="payCode" id="payCode" placeholder="Enter your payCode">
                    <span class="focus-input100"></span>
                  </div>
                  <div>
                    <span class="confirm" id="paycodeConfirm">&nbsp; </span>
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
                  <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                    <button class="contact100-form-btn" id="resetButton" onclick="location.href='<%= request.getContextPath()%>/';">
                      <span>
                        Return
                      </span>
                    </button>
                  </div>
                  
                  <div>
                    <span>&nbsp;</span>
                  </div>
                  <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                    <button class="contact100-form-btn" id="resetButton" onclick="location.href='<%= request.getContextPath()%>/';">
                      <span>
                        Return
                      </span>
                    </button>
                  </div>
                  
                  <div>
                    <span>&nbsp;</span>
                  </div>
                  <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                    <button class="contact100-form-btn" id="resetButton" onclick="location.href='<%= request.getContextPath()%>/';">
                      <span>
                        
                      </span>
                    </button>
                  </div>
                  
                </fieldset>
                </form>  
            </div>
          </div>
        </div>
      </div>
    </div> 
	<div ></div>
</body>
</html>