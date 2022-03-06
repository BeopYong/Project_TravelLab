<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<section id=enroll-container>
	<h2>회원 정보</h2>
	<form id="memberUpdateFrm" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memberId" id="memberId"
					value="<%=loginMember.getMemberId()%>" readonly></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="memberName" id="memberName"
					value="<%=loginMember.getMemberName()%>" required><br>
				</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="email" placeholder="abc@gmail.com"
					name="email" id="email" value="<%=loginMember.getEmail()%>"><br>
				</td>
			</tr>
			<tr>
				<th>결제정보</th>
				<td><input type="text" placeholder="213221" name="payCode"
					id="payCode" value="<%=loginMember.getPayCode()%>"><br>
				</td>
			</tr>

			<tr>
				<th>휴대폰</th>
				<td><input type="tel" placeholder="(-없이)01012345678" name="tel"
					id="tel" maxlength="11" value="<%=loginMember.getTel()%>" required><br>
				</td>
			</tr>
		</table>
		<input type="button" onclick="updateMember();" value="정보수정" /> <input
			type="button" onclick="updatePassword();" value="비밀번호 변경" />
		<%-- <input type="button" onclick="location.href='<%= request.getContextPath() %>/member/updatePassword';" value="비밀번호 변경"/> --%>
		<input type="button" onclick="deleteMember();" value="탈퇴" />
	</form>
</section>
<!-- 회원탈퇴폼 : POST /member/memberDelete 전송을 위해 시각화되지 않는 폼태그 이용 -->
<form name="memberDelFrm"
	action="<%=request.getContextPath()%>/member/memberDelete"
	method="POST">
	<input type="hidden" name="memberId"
		value="<%=loginMember.getMemberId()%>" />
</form>

<script>
/**
 * 회원정보 수정폼 제출
 * POST /mvc/member/memberUpdate -> redirect(중복요청방지 - URL변경)
 *  /member/memberView페이지로 리다이렉트할 것!
 */
 
const updateMember = () => {
	// 폼의 action값을 할당후 제출!
	$(memberUpdateFrm)
		.attr("action", "<%=request.getContextPath()%>/member/memberUpdate")
		.submit();
};
const updatePassword = () => {
	//다른 경로 요청
	$(memberUpdateFrm)
		.attr("action","<%=request.getContextPath()%>/member/updatePassword")
		.attr("method","GET")
		.submit();
}

const deleteMember = () => {
	// 폼의 action값을 할당후 제출!
	const deleteChk = confirm("Confirm your secession")
	$(memberUpdateFrm)
		.attr("action", "<%=request.getContextPath()%>/member/memberDelete")
		.submit();
};

/**
 * #memberUpdateFrm 유효성검사
 * - 비번 영문자/숫자 4글자이상
 * - 이름 한글 2글자 이상
 * - 전화번호 숫자확인
 */
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
	return true;
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
