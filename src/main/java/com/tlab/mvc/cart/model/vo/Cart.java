package com.tlab.mvc.cart.model.vo;

public class Cart {
	
	int no;
	String product_name;
	int quantity;
	int product_bill;
	String member_id;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int no, String product_name, int quantity, int product_bill, String member_id) {
		super();
		this.no = no;
		this.product_name = product_name;
		this.quantity = quantity;
		this.product_bill = product_bill;
		this.member_id = member_id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProduct_bill() {
		return product_bill;
	}
	public void setProduct_bill(int product_bill) {
		this.product_bill = product_bill;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "Cart [no=" + no + ", product_name=" + product_name + ", quantity=" + quantity + ", product_bill="
				+ product_bill + ", member_id=" + member_id + "]";
	}
	
	
	
	

}
