package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int no;
	private int magazineNo;
	private String orginalFilename;
	private String renamedFilename;
	/**
	 * 
	 */
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param no
	 * @param magazineNo
	 * @param orginalFilename
	 * @param renamedFilename
	 */
	public Attachment(int no, int magazineNo, String orginalFilename, String renamedFilename) {
		super();
		this.no = no;
		this.magazineNo = magazineNo;
		this.orginalFilename = orginalFilename;
		this.renamedFilename = renamedFilename;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getmagazineNo() {
		return magazineNo;
	}
	public void setmagazineNo(int magazineNo) {
		this.magazineNo = magazineNo;
	}
	public String getOrginalFilename() {
		return orginalFilename;
	}
	public void setOrginalFilename(String orginalFilename) {
		this.orginalFilename = orginalFilename;
	}
	public String getRenamedFilename() {
		return renamedFilename;
	}
	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}
	
	@Override
	public String toString() {
		return "Attachment [no=" + no + ", magazineNo=" + magazineNo + ", orginalFilename=" + orginalFilename
				+ ", renamedFilename=" + renamedFilename + "]";
	}
	
	
	
	
}
