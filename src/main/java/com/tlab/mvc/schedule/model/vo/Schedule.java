package com.tlab.mvc.schedule.model.vo;

import java.sql.Date;

public class Schedule {

	private int no;
	private int orderNum;
	private String item;
	private String memberId;
	private Date regDate;

	public Schedule() {
		super();
	}

	public Schedule(int orderNum, String item) {
		super();
		this.orderNum = orderNum;
		this.item = item;
	}

	public Schedule(int orderNum, String item, String memberId, Date regDate) {
		super();
		this.orderNum = orderNum;
		this.item = item;
		this.memberId = memberId;
		this.regDate = regDate;
	}

	public Schedule(int orderNum, String item, String memberId) {
		super();
		this.orderNum = orderNum;
		this.item = item;
		this.memberId = memberId;
	}

	public Schedule(int no, int orderNum, String item, String memberId, Date regDate) {
		super();
		this.no = no;
		this.orderNum = orderNum;
		this.item = item;
		this.memberId = memberId;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Schedule [no=" + no + ", orderNum=" + orderNum + ", item=" + item + ", memberId=" + memberId
				+ ", regDate=" + regDate + "]";
	}

}
