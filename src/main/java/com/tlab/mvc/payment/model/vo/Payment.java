package com.tlab.mvc.payment.model.vo;

import java.sql.Date;

import com.tlab.mvc.orderlist.model.vo.OrderList;

public class Payment extends OrderList {
	
	private String productName;
	private int quantity;
	
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int no, int orderCode, String memberId, int totalBill, Date paymentDate) {
		super(no, orderCode, memberId, totalBill, paymentDate);
		// TODO Auto-generated constructor stub
	}
	public Payment(String productName, int quantity) {
		super();
		this.productName = productName;
		this.quantity = quantity;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Payment [productName=" + productName + ", quantity=" + quantity + "]";
	}
	
	
}
