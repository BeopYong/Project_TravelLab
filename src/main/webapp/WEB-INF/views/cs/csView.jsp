<%@page import="com.tlab.mvc.cs.model.vo.CsComment" %>
<%@page import="com.tlab.mvc.cs.model.vo.CsAttachment"%>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.cs.model.vo.Cs"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>고객센터 문의사항</title>

<%
	Cs cs = (Cs) request.getAttribute("cs");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cs.css" />
<div class="container">
	<div class="row">
	<h2>고객센터</h2>
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<tr>
			<th>글번호</th>
			<td><%= cs.getNo() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= cs.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= cs.getWriter() %></td>
		</tr>
		
<% 
	List<CsAttachment> attachments = cs.getAttachments();
	if (attachments != null && !attachments.isEmpty()) {
		for(int i = 0; i < attachments.size(); i++){
			CsAttachment attach = attachments.get(i);
%>
		<tr>
			<th>첨부파일<%= i + 1 %></th>
			<td>
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<img alt="첨부파일" src="<%=request.getContextPath() %>/images/file.png" width=16px>
				<a href="<%= request.getContextPath() %>/cs/fileDownload?no=<%= attach.getNo() %>"><%= attach.getOriginalFilename() %></a>
			</td>
		</tr>
<% 
		}
	} 
%>
		<tr>
			<th>내 용</th>
			<td>
				<%= cs.getContent() %> 
			</td>
		</tr>
		<% 	if(
				loginMember != null && 
				(
				  loginMember.getMemberId().equals(cs.getWriter())
				  || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
				)
			){ %>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateCs()">
				<input type="button" value="삭제하기" onclick="deleteCs()">
			</th>
		</tr>
		<% 	} %>
	</table>
	
	<hr style="margin-top:30px;" />	
    
	<div class="comment-container">
        <div class="comment-editor">
            <form 
            	action="<%=request.getContextPath()%>/cs/csCommentEnroll" 
            	method="post" 
            	name="csCommentFrm">
                <input type="hidden" name="csNo" value="<%= cs.getNo() %>" />
                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />    
				<textarea name="content" cols="100" rows="3"></textarea>
                <button type="submit" id="btn-comment-enroll1">등록</button>
            </form>
        </div>
		
		<!--table#tbl-comment-->
<% 
	List<CsComment> commentList = (List<CsComment>) request.getAttribute("commentList"); 
	if(commentList != null && !commentList.isEmpty()){
%>
		<table id="tbl-comment">
<%
		for(CsComment cc : commentList){
			boolean removable = 
					loginMember != null && 
					(
					  loginMember.getMemberId().equals(cc.getWriter())
					  || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
					);

			if(cc.getCommentLevel() == 1){
%>
			<tr class="level1">
				<td>
					<sub class="comment-writer"><%= cc.getWriter() %></sub>
					<sub class="comment-date"><%= cc.getRegDate() %></sub>
					<br />
					<%-- 댓글내용 --%>
					<%= cc.getContent() %>
				</td>
				<td>
					<button class="btn-reply" value="<%= cc.getNo() %>">답글</button>
<% if(removable){ %>
					<button class="btn-delete" value="<%= cc.getNo() %>">삭제</button>
<% } %>

				</td>
			</tr>
<%
			} else {
%>
			<tr class="level2">
				<td>
					<sub class="comment-writer"><%= cc.getWriter() %></sub>
					<sub class="comment-date"><%= cc.getRegDate() %></sub>
					<br />
					<%-- 대댓글내용 --%>
					<%= cc.getContent() %>
				</td>
				<td>
<% if(removable){ %>
					<button class="btn-delete" value="<%= cc.getNo() %>">삭제</button>
<% } %>

				</td>
			</tr>
<%
			}
		}
%>
		</table>
<%
	}
%>
		</div>
	</div>
</div>


<form
	name="csDelFrm"
	method="POST" 
	action="<%= request.getContextPath() %>/cs/csDelete" >
	<input type="hidden" name="no" value="<%= cs.getNo() %>" />
</form>	
<script>
const deleteCs = () => {
	if(confirm("이 게시물을 정말 삭제하시겠습니까?")){
		$(document.csDelFrm).submit();		
	}
};

const updateCs = () => {
	location.href = "<%= request.getContextPath() %>/cs/csUpdate?no=<%= cs.getNo() %>";
};
</script>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
