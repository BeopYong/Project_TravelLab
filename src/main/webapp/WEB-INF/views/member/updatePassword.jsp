<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section id=enroll-container>
		<h2>비밀번호 변경</h2>
		<form 
			name="updatePwdFrm" 
			action="<%=request.getContextPath()%>/member/updatePassword" 
			method="POST" >
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="oldPassword" id="oldPassword" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="newPassword" id="newPassword" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" name="newPasswordCheck" id="newPasswordCheck" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit"  value="변경" />
					</td>
				</tr>
			</table>
		</form>
	</section>

<script>
$(document.updatePwdFrm).submit((e) => {
	//password
	const $oldPassword =$(oldPassword)
	const $newPassword = $(newPassword);
	const $newPasswordCheck = $(newPasswordCheck);
	
	if($oldPassword.val()==$newPassword.val()){
		alert("기존비밀번호와 동일합니다");
		return false;
	}
	
	if(!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/.test($newPassword.val())){
		alert("유효한 패스워드를 입력하세요.");
		return false;
	}
	if($newPassword.val() != $newPasswordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		return false;
	}
	return true;
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
