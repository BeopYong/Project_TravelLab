package com.tlab.mvc.product.model.vo;

import java.util.Date;

public class Product {

	int no;
	int region;
	int p_category;
	String p_name;
	String p_content;
	Date p_day;
	int p_stock;
	int unit_price;
	String valid;
	Date reg_date;
	
	//기본 생성자
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//파라미터 생성자
	public Product(int no, int region, int p_category, String p_name, String p_content, Date p_day, int p_stock,
			int unit_price, String valid, Date reg_date) {
		super();
		this.no = no;
		this.region = region;
		this.p_category = p_category;
		this.p_name = p_name;
		this.p_content = p_content;
		this.p_day = p_day;
		this.p_stock = p_stock;
		this.unit_price = unit_price;
		this.valid = valid;
		this.reg_date = reg_date;
	}
	
	//getter / setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRegion() {
		return region;
	}
	public void setRegion(int region) {
		this.region = region;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public Date getP_day() {
		return p_day;
	}
	public void setP_day(Date p_day) {
		this.p_day = p_day;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public int getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	//toString
	@Override
	public String toString() {
		return "Product [no=" + no + ", region=" + region + ", p_category=" + p_category + ", p_name=" + p_name
				+ ", p_content=" + p_content + ", p_day=" + p_day + ", p_stock=" + p_stock + ", unit_price="
				+ unit_price + ", valid=" + valid + ", reg_date=" + reg_date + "]";
	}
	
	
	
}
