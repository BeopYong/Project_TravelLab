<%@page import="com.tlab.mvc.cs.model.vo.Cs"%>
<%@page import="com.tlab.mvc.cs.model.vo.CsAttachment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	Cs cs = (Cs) request.getAttribute("cs");
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" />
<title>고객센터 문의사항</title>
</head>
<body>

	<br />
	<br />
	<br />
	
	<!-- 문의사항 수정 폼 -->
	<div class="container">
		<div class="row">
			<form 
				method="post"
				name="csupdateFrm"
				action="<%=request.getContextPath() %>/cs/csUpdate" 
				enctype="multipart/form-data">
				<input type="hidden" name="no" value="<%= cs.getNo() %>">
				
				<table class="table table-condensed" style="border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="4" style="background-color: #ececec; text-align: center; font-size: 20px;">Travle lab 문의사항</th>
						</tr>
					</thead>
					<tbody>
						<tr>
                            <td style="width: 10px; vertical-align: middle;"><select name="qna" id="qna"><%= cs.getOptions() %>
                                <option value="결제문의">결제문의</option>
                                <option value="상품문의">상품문의</option>
                                <option value="1:1상담">1:1상담</option>
                                <option value="기타">기타</option>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>
                                <option value="공지사항">공지사항</option>
<% } %>
                            </select></td>
							<td colspan="3"><input type="text" class="form-control" placeholder="제목을 입력하세요." name="csTitle" maxlength="50" value="<%= cs.getTitle() %>" required></td>
						</tr>
						<tr>
							<td colspan="4"><textarea class="form-control" placeholder="문의사항을 입력하세요." name="csContent" maxlength="50000" style="height: 350px;" required> <%= cs.getContent() %> </textarea></td>
                        </tr>
<%
	List<CsAttachment> attachments = cs.getAttachments();
	if(attachments != null && !attachments.isEmpty()){ 
%>
	<tr>
		<th>기존 첨부파일</th>
		<td>
<%
		for(CsAttachment attach : attachments){
%>			
			<div style="padding:0; margin:3px;">
				<%= attach.getOriginalFilename() %>
				<label for="delFile<%= attach.getNo() %>">제거</label>
				<input 
					type="checkbox" 
					name="delFile" 
					id="delFile<%= attach.getNo() %>" 
					value="<%= attach.getNo() %>" />
			</div>

<%
		}
%>
		</td>
	</tr>
<% 
	} 
%>
                        <tr>
                            <td colspan="2"><input type="file" name="upFile1"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="file" name="upFile2"></td>
                        </tr> 
					</tbody>
				</table>
				<!-- 버튼 -->
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>