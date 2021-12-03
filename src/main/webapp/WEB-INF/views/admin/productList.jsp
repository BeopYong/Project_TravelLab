<%@page import="com.tlab.mvc.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Product> list = (List<Product>) request.getAttribute("list");
System.out.println("productList@productList.jsp" + list);
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

div#search-cateCode {
	display: <%=searchType == null || "cateCode".equals(searchType) ? "inline-block" : "none"%>;
}

div#search-gdsName {
	display: <%="gdsName".equals(searchType) ? "inline-block" : "none"%>;
}
</style>

<section id="memberList-container">
	<h2>상품관리</h2>

	<div id="search-container">
		<label for="searchType">검색타입 :</label> <select id="searchType">
			<option value="cateCode"
				<%="cateCode".equals(searchType) ? "selected" : ""%>>지역번호</option>
			<option value="gdsName"
				<%="gdsName".equals(searchType) ? "selected" : ""%>>상품명</option>
		</select>
		<div id="search-cateCode" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/productFinder">
				<input type="hidden" name="searchType" value="cateCode" /> <input
					type="text" name="searchKeyword"
					value="<%="cateCode".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 지역번호를 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
		<div id="search-gdsName" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/productFinder">
				<input type="hidden" name="searchType" value="gdsName" /> <input
					type="text" name="searchKeyword"
					value="<%="gdsName".equals(searchType) ? searchKeyword : ""%>"
					size="25" placeholder="검색할 상품명을 입력하세요." />
				<button type="submit">검색</button>
			</form>
		</div>
	</div>


	<table id="tbl-member">
		<thead>
			<tr>
				<th style="table-layout: fixed">지역번호</th>
				<th style="table-layout: fixed">상품카테고리</th>
				<th style="table-layout: fixed">상품명</th>
				<th style="table-layout: fixed">재고</th>
				<th style="table-layout: fixed">단위가격</th>
				<th style="table-layout: fixed">유효</th>
				<th style="table-layout: fixed">등록날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Product product : list) {
			%>
			<tr>
				<td width="40px" style="table-layout: fixed"><%=product.getRegion()%></td>
				<td width="40px" style="table-layout: fixed"><%=product.getP_category()%></td>
				<td width="100px" style="table-layout: fixed"><%=product.getP_name()%></td>
				<td width="40px" style="table-layout: fixed"><%=product.getP_stock()%></td>
				<td width="40px" style="table-layout: fixed"><%=product.getUnit_price()%></td>
				<td width="40px" style="table-layout: fixed"><%=product.getValid()%></td>
				<td width="100px" style="table-layout: fixed"><%=product.getReg_date()%></td>
				<%-- <td style="table-layout: fixed">
					<form 
						name="memberRoleUpdateFrm"
						action="<%= request.getContextPath() %>/admin/memberRoleUpdate"
						method="POST">
						<input type="hidden" name="memberId" value="<%= product.getP_name() %>" />
						<select name="memberRole" class="member-role">
							<option value="<%= MemberService.USER_ROLE%>" 
								<%= MemberService.USER_ROLE.equals(member.getMemberRole()) ? "selected" : "" %>>일반</option>
							<option value="<%= MemberService.SELLER_ROLE%>" 
								<%= MemberService.SELLER_ROLE.equals(member.getMemberRole()) ? "selected" : "" %>>사업자</option>
						</select>
					</form>
				</td> --%>
				<%-- <td style="table-layout: fixed">
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
				</td> --%>
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






