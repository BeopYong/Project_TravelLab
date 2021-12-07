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
	public int getNo() {
		// TODO Auto-generated method stub
		return super.getNo();
	}
	@Override
	public void setNo(int no) {
		// TODO Auto-generated method stub
		super.setNo(no);
	}
	@Override
	public int getOrderCode() {
		// TODO Auto-generated method stub
		return super.getOrderCode();
	}
	@Override
	public void setOrderCode(int order_code) {
		// TODO Auto-generated method stub
		super.setOrderCode(order_code);
	}
	@Override
	public String getMemberId() {
		// TODO Auto-generated method stub
		return super.getMemberId();
	}
	@Override
	public void setMemberId(String memberId) {
		// TODO Auto-generated method stub
		super.setMemberId(memberId);
	}
	@Override
	public int getTotalBill() {
		// TODO Auto-generated method stub
		return super.getTotalBill();
	}
	@Override
	public void setTotalBill(int totalBill) {
		// TODO Auto-generated method stub
		super.setTotalBill(totalBill);
	}
	@Override
	public Date getPaymentDate() {
		// TODO Auto-generated method stub
		return super.getPaymentDate();
	}
	@Override
	public void setPaymentDate(Date paymentDate) {
		// TODO Auto-generated method stub
		super.setPaymentDate(paymentDate);
	}
	@Override
	public String toString() {
		return "Payment [productName=" + productName + ", quantity=" + quantity + "]";
	}
	
	
}
