<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Member> list = (List<Member>) request.getAttribute("list");
System.out.println("memberList@memberList.jsp" + list);
String searchType = request.getParameter("searchType");
String searchKeyword = request.getParameter("searchKeyword");
/* HttpSession session = request.getSession(); */
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 관리자용 admin.css link -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/memberList.css" />
<style>
section#content {
	background-color: #FAFDFF;
	float: left;
	width: 940px;
	min-height: 500px;
}

div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
	border-radius: 10px;
	background-color: #B6EAE4;
}

div#search-memberId {
	display: <%=searchType == null || "memberId".equals(searchType) ? "inline-block" : "none"%>;
}

div#search-memberName {
	display: <%="memberName".equals(searchType) ? "inline-block" : "none"%>;
}
</style>
<section id="memberList-container">
	<h2>회원관리</h2>

	<div id="search-container">
		<label for="searchType">검색타입 :</label> <select id="searchType">
			<option value="memberId"
				<%="memberId".equals(searchType) ? "selected" : ""%>>아이디</option>
			<option value="memberName"
				<%="memberName".equals(searchType) ? "selected" : ""%>>회원명</option>
		</select>
		<div id="search-memberId" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="memberId" /> <input
					type="text" name="searchKeyword"
					value="<%="memberId".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 아이디를 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-memberName" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="memberName" /> <input
					type="text" name="searchKeyword"
					value="<%="memberName".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 이름을 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
	</div>


	<table id="tbl-member">
		<thead>
			<tr>
				<th class="member-id" style="table-layout: fixed">아이디</th>
				<th class="member-name" style="table-layout: fixed">이름</th>
				<th style="table-layout: fixed">회원권한</th>
				<th style="table-layout: fixed">이메일</th>
				<th style="table-layout: fixed">전화번호</th>
				<th style="table-layout: fixed">유효</th>
				<th style="table-layout: fixed">가입일</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Member member : list) {
			%>
			<tr>
				<td width="100px" style="table-layout: fixed"><%=member.getMemberId()%></td>
				<td width="40px" style="table-layout: fixed"><%=member.getMemberName()%></td>
				<td style="table-layout: fixed">
					<form 
						name="memberRoleUpdateFrm"
						action="<%= request.getContextPath() %>/admin/memberRoleUpdate"
						method="POST">
						<input type="hidden" name="memberId" value="<%= member.getMemberId() %>" />
						<select name="memberRole" class="member-role">
							<option value="<%= MemberService.USER_ROLE%>" 
								<%= MemberService.USER_ROLE.equals(member.getMemberRole()) ? "selected" : "" %>>일반</option>
							<option value="<%= MemberService.SELLER_ROLE%>" 
								<%= MemberService.SELLER_ROLE.equals(member.getMemberRole()) ? "selected" : "" %>>사업자</option>
						</select>
					</form>
				</td>
				<td width="180px" style="table-layout: fixed"><%=member.getEmail() != null ? member.getEmail() : ""%></td>
				<td style="table-layout: fixed"><%=member.getTel()%></td>
				<td style="table-layout: fixed">
					 <form name="memberValidUpdateFrm"
						action="<%=request.getContextPath()%>/admin/memberValidUpdate"
						method="POST">
						<input type="hidden" name="memberId"
							value="<%=member.getMemberId()%>" /> 
						<select name="memberValid" class="member-valid">
							<option value="<%=MemberService.VALID_Y%>"
								<%=MemberService.VALID_Y.equals(member.getValid()) ? "selected" : ""%>>Y</option>
							<option value="<%=MemberService.VALID_N%>"
								<%=MemberService.VALID_N.equals(member.getValid()) ? "selected" : ""%>>N</option>
						</select>
					</form> 
				</td>	
				<%-- <td><%=member.getValid()%></td> --%>
				<td style="table-layout: fixed"><%=member.getRegDate()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div id="pageBar">
		<%=request.getAttribute("pagebar")%>
	</div>
</section>

<script>
/**
 * 검색 div 노출
 */

$(searchType).change((e) => {
	$(".search-type").hide();
	
	const v = $(e.target).val();
	$("#search-" + v).css("display", "inline-block");
});


$(".member-valid").change((e) => {
	const $select = $(e.target);
	const memberValid = $select.val();
	console.log(memberValid);
	if(confirm(`회원의 권한을 [\${memberValid}]로 변경하시겠습니까?`)){
		const $frm = $select.parent();
		$frm.submit();
	}
	else {
		// selected 초기값으로 복원
		$select.children("[selected]").prop("selected", true);
	}
});



 $(".member-role").change((e) => {
		const $select = $(e.target);
		const memberRole = $select.val();
		console.log(memberRole);
		if(confirm(`회원의 권한을 [\${memberRole}]로 변경하시겠습니까?`)){
			const $frm = $select.parent();
			$frm.submit();
		}
		else {
			// selected 초기값으로 복원
			$select.children("[selected]").prop("selected", true);
		}
	});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>






