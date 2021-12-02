package com.tlab.mvc.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MemberDtoTest implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<String> meberFieldList;

	
	public MemberDtoTest() {
		super();
	}
	
	public MemberDtoTest(List<String> meberFieldList) {
		super();
		this.meberFieldList = meberFieldList;
	}

	public List<String> getMeberFieldList() {
		return meberFieldList;
	}

	public void setMeberFieldList(ArrayList<String> meberFieldList) {
		this.meberFieldList = meberFieldList;
	}


	@Override
	public String toString() {
		
		return 	this.meberFieldList.stream().map(v->v.toString()).collect(Collectors.joining(","));
	}
	
	
	// 1,2,3,4,5,6,7,8,9
	// no,memberId,password,memberName,email,payCode,tel,valid,regDate

	//	private int no;
	//	private String memberId;
	//	private String password;
	//	private String memberName;
	//	private String email;
	//	private int payCode;
	//	private String tel;
	//	private String valid;
	//	private Date regDate;
		
	
	
}
