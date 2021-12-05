package com.tlab.mvc.product.model.vo;

import java.io.Serializable;
import java.util.Objects;

import com.tlab.mvc.common.Attachment;

public class ProductAttachment extends Attachment {
	
	public static final long serialVersionUID = 1L;
	
	private int productNo;

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
	public String getOriginalFilename() {
		// TODO Auto-generated method stub
		return super.getOriginalFilename();
	}

	@Override
	public void setOriginalFilename(String originalFilename) {
		// TODO Auto-generated method stub
		super.setOriginalFilename(originalFilename);
	}

	@Override
	public String getRenamedFilename() {
		// TODO Auto-generated method stub
		return super.getRenamedFilename();
	}

	@Override
	public void setRenamedFilename(String renamedFilename) {
		// TODO Auto-generated method stub
		super.setRenamedFilename(renamedFilename);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(productNo);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
			return false;
		}
		if (!(obj instanceof ProductAttachment)) {
			return false;
		}
		ProductAttachment other = (ProductAttachment) obj;
		return productNo == other.productNo;
	}

	@Override
	public String toString() {
		return "ProductAttachment [productNo=" + productNo + ", toString()=" + super.toString() + "]";
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	
	
	

}
