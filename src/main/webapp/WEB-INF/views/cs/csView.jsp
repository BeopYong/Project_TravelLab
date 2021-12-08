<%@page import="com.tlab.mvc.cs.model.vo.CsComment" %>
<%@page import="com.tlab.mvc.cs.model.vo.CsAttachment"%>
<%@page import="java.util.List"%>
<%@page import="com.tlab.mvc.cs.model.vo.Cs"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerr.jsp"%>

<style>
div.comment-container button#btn-comment-enroll1 {width:60px; height:50px; color:white; background:#3300ff; position:relative; top:-20px;}

table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse;} 
table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
table#tbl-comment button.btn-reply{display:none;}
table#tbl-comment tr:hover {background:lightgray;}
table#tbl-comment tr:hover button.btn-reply{display:inline;}
table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
table#tbl-comment sub.comment-date {color:tomato; font-size:10px}

table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}

table#tbl-comment textarea{margin: 4px 0 0 0;}
table#tbl-comment button.btn-comment-enroll2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}

table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment tr:hover button.btn-delete{display:inline;}

@font-face {
    font-family: 'paybooc-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}  
</style>

<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />
<title>고객센터</title>

<%
	Cs cs = (Cs) request.getAttribute("cs");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cs.css" />
<section id="board-container">
<div class="row">
	<table id="tbl-board-view">
	<br />
	<h2 style="font-family: 'paybooc-Bold';">고객센터</h2>
	<br />
	<table class="table .table" style="text-align: center; border: 1px solid #dddddd">
		<tr>
			<th style="text-align: center; background-color: #d6dde8">글번호</th>
			<td style="background-color: #ffffff;"><%= cs.getNo() %></td>
		</tr>
		<tr>
			<th style="text-align: center; background-color: #d6dde8">글제목</th>
			<td style="background-color: #ffffff;"><%= cs.getTitle() %></td>
		</tr>
		<tr>
			<th style="text-align: center; background-color: #d6dde8">작성자</th>
			<td style="background-color: #ffffff;"><%= cs.getWriter() %></td>
		</tr>
		
<% 
	List<CsAttachment> attachments = cs.getAttachments();
	if (attachments != null && !attachments.isEmpty()) {
		for(int i = 0; i < attachments.size(); i++){
			CsAttachment attach = attachments.get(i);
%>
		<tr>
			<th style="background-color: #d6dde8">첨부파일</th>
			<td>
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<a href="<%= request.getContextPath() %>/cs/fileDownload?no=<%= attach.getNo() %>"><%= attach.getOriginalFilename() %></a>
			</td>
		</tr>
<% 
		}
	} 
%>
		<tr>
			<th style="text-align: center; background-color: #d6dde8; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<td colspan="2" style="height: 200px; text-align: left; background-color: #ffffff;">
				<%= cs.getContent() %>
			</td>
		</tr>
	</table>
		<% 	if(
				loginMember != null && 
				(
				  loginMember.getMemberId().equals(cs.getWriter())
				  || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
				)
			){ %>
		<tr>
			<%-- 작성자와 관리자만 마지막행 삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<!-- <input type="button" value="수정하기" onclick="updateCs()">  -->
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
            	name="csCommentFrm"
            	>
                <input type="hidden" name="csBoardno" value="<%= cs.getNo() %>" />
                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />    
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<textarea name="content" cols="60" rows="3" style="width: 80%;"></textarea>
				&nbsp; &nbsp; &nbsp; 
                <button type="submit" id="btn-comment-enroll1" style="vertical-align: middle;">등록</button>
            </form>
        </div>
		<!--게시판 댓글!-->
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
			<!-- 댓글 -->
			<tr class="level1">
				<td>
					<sub class="comment-writer"><%= cc.getWriter() %></sub>
					<sub class="comment-date"><%= cc.getRegDate() %></sub>
					<br /><br />
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
%>          <!-- 대댓글 -->
			<tr class="level2">
				<td>
					<sub class="comment-writer"><%= cc.getWriter() %></sub>
					<sub class="comment-date"><%= cc.getRegDate() %></sub>
					<br /><br />
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
</section>

<form
	name="csDelFrm"
	method="POST" 
	action="<%= request.getContextPath() %>/cs/csDelete" >
	<input type="hidden" name="no" value="<%= cs.getNo() %>" />
</form>	
<form 
	action="<%= request.getContextPath() %>/cs/csCommentDelete" 
	name="csCommentDelFrm"
	method="POST">
	<input type="hidden" name="no" />
	<input type="hidden" name="csBoardno" value="<%= cs.getNo() %>"/>
</form>

<script>
$(".btn-delete").click(function(){
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		var $frm = $(document.csCommentDelFrm);
		var no = $(this).val();
		$frm.find("[name=no]").val(no);
		$frm.submit();
	}
});	

/**
 * 대댓글 
 */
$(".btn-reply").click((e) => {
<% if(loginMember == null){ %>
	loginAlert();
	return;
<% } %>

	const commentRef = $(e.target).val();
	console.log(commentRef);
	
	const tr = `<tr>
	<td colspan="2" style="text-align:left">
		<form 
			action="<%=request.getContextPath()%>/cs/csCommentEnroll" 
			method="post">
		    <input type="hidden" name="csBoardno" value="<%= cs.getNo() %>" />
		    <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
		    <input type="hidden" name="commentLevel" value="2" />
		    <input type="hidden" name="commentRef" value="\${commentRef}" />    
			<textarea name="content" cols="60" rows="2"></textarea>
		    <button type="submit" class="btn-comment-enroll2">등록</button>
		</form>
	</td>
</tr>`;
	console.log(tr);
	
	// e.target인 버튼태그의 부모tr을 찾고, 다음 형제요소로 추가
	const $baseTr = $(e.target).parent().parent();
	const $tr = $(tr);
	
	$tr.insertAfter($baseTr)
		.find("form")
		.submit((e) => {
			const $content = $("[name=content]", e.target);
			if(!/^(.|\n)+$/.test($content.val())){
				alert("댓글을 작성해주세요.");
				e.preventDefault();
			}
		});
		
	
	// 클릭이벤트핸들러 제거
	$(e.target).off("click");
	
});



$("[name=content]", document.csCommentFrm).focus((e) => {

<% if(loginMember == null){ %>
	loginAlert();
	return;
<% } %>

});

$(document.csCommentFrm).submit((e) => {
<% if(loginMember == null){ %>
	loginAlert();
	return false;
<% } %>

	const $content = $("[name=content]", e.target);
	if(!/^(.|\n)+$/.test($content.val())){
		alert("댓글을 작성해주세요.");
		e.preventDefault();
	}

});

const loginAlert = () => {
	alert("로그인후 사용가능합니다.");
	$(memberId).focus();
};


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
