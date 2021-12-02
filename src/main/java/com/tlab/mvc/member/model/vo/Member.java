package com.tlab.mvc.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Member implements Serializable, HttpSessionBindingListener {

	/**
	 * 기본 사용자 객체
	 * 
	 * @author jimmerland
	 */
	private static final long serialVersionUID = 1L;

	private String memberId;
	private String password;
	private String memberName;
	private String email;
	private int payCode;
	private String tel;
	private String valid;
	private Date regDate;
	private String memberRole;

	// 생성자
	public Member() {
		super();
	}

	// enroll용 생성자
	public Member(String memberId, String password, String memberName, String email, int payCode, String tel) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.email = email;
		this.payCode = payCode;
		this.tel = tel;
	}

	// 로그인용 생성자
	public Member(String memberId, String password) {
		super();
		this.memberId = memberId;
		this.password = password;
	}

	// update용 생성자(login필터거치는 서블릿에서만 사용)
	public Member(String memberId, String memberName, int payCode, String email, String tel) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.payCode = payCode;
		this.email = email;
		this.tel = tel;
	}
	// admin용 생성자

	public Member(String memberId, String password, String memberName, String email, String tel, String valid,
			Date regDate, String memberRole) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.email = email;
		this.tel = tel;
		this.valid = valid;
		this.regDate = regDate;
		this.memberRole = memberRole;
	}

	// 전체 정보 입력 생성자
	public Member(String memberId, String password, String memberName, String email, int payCode, String tel,
			String valid, Date regDate) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.email = email;
		this.payCode = payCode;
		this.tel = tel;
		this.valid = valid;
		this.regDate = regDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(memberId, memberName, password);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		return Objects.equals(memberId, other.memberId) && Objects.equals(memberName, other.memberName)
				&& Objects.equals(password, other.password);
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getValid() {
		return valid;
	}

	public void setValid(String valid) {
		this.valid = valid;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("SesseionBinding(Bound) : "+memberName+" 로그인");
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println("SesseionBinding(Unbound) : "+memberName+" 로그아웃");
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", email="
				+ email + ", payCode=" + payCode + ", tel=" + tel + ", valid=" + valid + ", regDate=" + regDate
				+ ", memberRole=" + memberRole + "]";
	}

}
