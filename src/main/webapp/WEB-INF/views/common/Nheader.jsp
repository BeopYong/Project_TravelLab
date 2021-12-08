<%@page import="com.tlab.mvc.member.model.service.MemberService"%>
<%@page import="com.tlab.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
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
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>당신의 여행을 응원합니다.</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/blog/">
    <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/css/magazine/bootstrapv.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/product.css" />
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="<%= request.getContextPath() %>/css/magazine/blog.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
    
    <link rel="icon" href="<%= request.getContextPath() %>/images/icons/travel.png">
<!-- javaScript -->
<script> 
$(() => {

<% if(msg != null){ %>	

	alert("<%= msg %>");
	
<% } %>

<%-- 로그인하지 않은 경우만 출력 --%>
<% if(loginMember == null){ %>

	/**
	 * 로그인폼 유효성 검사
	 */
	$(loginFrm).submit((e) => {
		const $memberId = $(memberId);
		const $password = $(password);
		
		if(!/^\w{4,}$/.test($memberId.val())){
			alert("유효한 아이디를 입력하세요.");
			$memberId.select();
			return false;
		}
		if(!/^.{4,}$/.test($password.val())){
			alert("유효한 비밀번호를 입력하세요.");
			$password.select();
			return false;
		}
	});
	
<% } %>

});
</script>
<!-- css -->
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

  </head>
  <!-- head 끝 body 시작 -->
  <body>
    
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="<%= request.getContextPath() %>">Travel Lap</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <!-- 로그인 컨테이너 삽입 -->
        <div class="login-container">
          <% if(loginMember == null){ %>
                    <!-- 로그인폼 시작 -->
                    <form 
                      id="loginFrm" 
                      action="<%= request.getContextPath() %>/member/login"
                      method="POST">
                      <table>
                        <tr>
                          <td><input type="text" name="memberId" id="memberId" placeholder="아이디" tabindex="1" value="<%= saveMemberId != null ? saveMemberId : "" %>"></td>
                          <td><input type="submit" class="btn btn-sm btn-outline-secondary" value="로그인" tabindex="3"></td>
                        </tr>
                        <tr>
                          <td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2"></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td colspan="2">
                            <input type="checkbox" name="saveId" id="saveId" <%= saveMemberId != null ? "checked" : "" %>/>
                            <label for="saveId">아이디저장</label>&nbsp;&nbsp;
                            <input 
                              type="button" 
                              class="btn btn-sm btn-outline-secondary"
                              value="회원가입" 
                              onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
                          </td>
                        </tr>
                      </table>
                    </form>
                    <!-- 로그인폼 끝-->
          <% } else { %>
                    <table id="login">
                      <tr>
                        <td><%= loginMember.getMemberName() %>님, 안녕하세요.</td>
                      </tr>
                      <tr>
                        <td>
                          <input type="button" value="내정보보기" class="btn btn-sm btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/member/myPage';">
                          <input type="button" value="로그아웃" class="btn btn-sm btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/member/memberLogout';">
                        </td>
                      </tr>
                    </table>
          <% } %>
                  </div>
                  <!-- 로그인 컨데이너 끝 -->
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>        
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>">Home</a>
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>/product/productList">Product</a>
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>/magazine/magazineList">Magazine</a>
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>/cs/csList">FAQ</a>
  <% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>	
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>/admin/memberList">회원관리</a>
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>/admin/productList">상품관리</a>
      <a class="p-2 link-secondary" href="<%= request.getContextPath() %>/admin/magazineList">매거진관리</a>
  <% } %>
    </nav>
  </div>
</div>
<!-- 헤더영역 끝 -->