<%@page import="com.tlab.mvc.cs.model.vo.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" />
<title>고객센터</title>
</head>
<body>
	<div>
		<br />
		<h1 style="margin-left: 50px">고객센터</h1>
		<br />
		<p align="center">Q&A 1:1문의 트래블 랩 서비스의 오류, 장애, 기타 공지사항을 안내드립니다.</p>
	</div>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #cecece; text-align: center; width:15%;">번호</th>
						<th style="background-color: #cecece; text-align: center;">제목</th>
						<th style="background-color: #cecece; text-align: center;">작성자</th>
						<th style="background-color: #cecece; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
<%
		List<Cs> list = (List<Cs>) request.getAttribute("list");
		for (Cs cs : list) {
%>
					<tr>
						<td><%=cs.getNo()%></td>
						<td>[<%=cs.getOptions()%>] 
						<a href="<%=request.getContextPath()%>/cs/csView?no=<%=cs.getNo()%>"><%= cs.getTitle()%></a>
						</td>
						<td><%=cs.getWriter()%></td>
						<td><%=cs.getRegDate()%></td>
					</tr>
<%
		 }
%>
				</tbody>
			</table>
		</div>
		
<% if(loginMember != null){ %>
		<input type="button" value="글쓰기" class="btn btn-default"
			onclick="location.href='<%=request.getContextPath()%>/cs/csForm'" />
<% } %>	

	</div>
	<div id='pageBar'><%=request.getAttribute("pagebar")%></div>
	</section>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>