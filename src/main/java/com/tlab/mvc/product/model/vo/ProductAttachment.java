package com.tlab.mvc.product.model.vo;

import java.io.Serializable;

public class ProductAttachment implements Serializable {
	
	public static final long serialVersionUID = 1L;
	
	private int no; 
	private int productNo;
	private String originalFilename;
	private String renamedFilename;
	
	//기본 생성자
	public ProductAttachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//파라미터 생성자
	public ProductAttachment(int no, int productNo, String originalFilename, String renamedFilename) {
		super();
		this.no = no;
		this.productNo = productNo;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
	}
	
	//getter, setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getRenamedFilename() {
		return renamedFilename;
	}
	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}
	
	//override toString
	@Override
	public String toString() {
		return "ProductAttachment [no=" + no + ", productNo=" + productNo + ", originalFilename=" + originalFilename
				+ ", renamedFilename=" + renamedFilename + "]";
	}
	
	

}
