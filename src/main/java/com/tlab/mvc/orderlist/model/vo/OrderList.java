package com.tlab.mvc.orderlist.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OrderList implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int no;
	private int orderCode;
	private String memberId;
	private int totalBill;
	private Date paymentDate;
	
	public OrderList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderList(int no, int orderCode, String memberId, int totalBill, Date paymentDate) {
		super();
		this.no = no;
		this.orderCode = orderCode;
		this.memberId = memberId;
		this.totalBill = totalBill;
		this.paymentDate = paymentDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int order_code) {
		this.orderCode = order_code;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getTotalBill() {
		return totalBill;
	}
	public void setTotalBill(int totalBill) {
		this.totalBill = totalBill;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	@Override
	public String toString() {
		return "OrderList [no=" + no + ", ordeCode=" + orderCode + ", memberId=" + memberId + ", totalBill="
				+ totalBill + ", paymentDate=" + paymentDate + "]";
	}
	
	
	
	
	
	
}
