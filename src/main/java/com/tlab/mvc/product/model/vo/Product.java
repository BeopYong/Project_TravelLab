package com.tlab.mvc.product.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.tlab.mvc.magazine.model.vo.Attachment;

public class Product extends ProductEntity implements Serializable {
	
	public static final long serialVersionUID = 1L;
	
	private int attachCount; //첨부파일 수
	private List<Attachment> attachments; //하나의 게시물은 여러 개의 첨부파일을 가질 수 있음!

	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int no, String region, int p_category, String p_name, String p_content, Date p_day, int p_stock,
			int unit_price, String valid, Date reg_date) {
		super(no, region, p_category, p_name, p_content, p_day, p_stock, unit_price, valid, reg_date);
		// TODO Auto-generated constructor stub
	}
	
	public int getAttachCount() {
		return attachCount;
	}
	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}
	public List<Attachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	@Override
	public String toString() {
		return "Product [attachCount=" + attachCount + ", attachments=" + attachments + ", toString()="
				+ super.toString() + "]";
	}

	
}
