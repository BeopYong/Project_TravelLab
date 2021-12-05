package com.tlab.mvc.product.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.commit;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;
import static com.tlab.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.product.model.dao.ProductDao;
import com.tlab.mvc.product.model.vo.Product;
import com.tlab.mvc.product.model.vo.ProductAttachment;
import com.tlab.mvc.product.model.vo.ProductEntity;

public class ProductService {
	public static final String VALID_Y = "Y";
	public static final String VALID_N = "N";
	
	private ProductDao productDao = new ProductDao();

	public List<Product> randomProductFoodList(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Product> list = productDao.randomProductFoodList(conn, param);
		close(conn);
		
		return list;
	}

	public List<Product> randomProductPlaceList(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Product> list = productDao.randomProductPlaceList(conn, param);
		close(conn);
		
		return list;
		
	}
	
	public List<Product> productFoodList(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Product> list = productDao.productFoodList(conn, param);
		close(conn);
		
		return list;
	}

	public int selectTotalFoodList(Map<String, Integer> param) {
		Connection conn = getConnection();
		int totalCount = productDao.selectTotalFoodList(conn, param);
		close(conn);
		return totalCount;
	}

	public List<Product> productPlaceList(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Product> list = productDao.productPlaceList(conn, param);
		close(conn);
		
		return list;
	}
	
	public int selectTotalPlaceList(Map<String, Integer> param) {
		Connection conn = getConnection();
		int totalCount = productDao.selectTotalPlaceList(conn, param);
		close(conn);
		return totalCount;
	}
	
	/**
	 * 첨부파일 있으면 insertBoard랑 insertAttachment*n 이 하나로 묶여서 트랜잭션 처리 되어야 함.
	 * @param product
	 * @return
	 */
	public int insertProduct(Product product) {
		Connection conn = getConnection();
		int result = 0;
		try {
			conn = getConnection();
			result = productDao.insertProduct(conn,product);
			
			//product_no 조회 : select seq_product_no.currval from dual
			int product_no = productDao.selectLastProductNo(conn);
			System.out.println("product_no = " + product_no);
			
			List<ProductAttachment> productAttachments = product.getAttachments();
			if(productAttachments != null) {
				//insert into attachment values(seq_product_attachment_no.nextval, product_no, originalFilename, renamed_filename )
				for(ProductAttachment pAtt : productAttachments) {
					pAtt.setProductNo(product_no); //FK 컬럼값 설정
					result = productDao.insertProductAttachment(conn, pAtt);
				}
			}
	
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Product selectOneProduct(int no) {
		Connection conn = getConnection();
		Product product = productDao.selectOneProduct(conn, no);
		close(conn);
		
		return product;
	}

	public List<ProductEntity> selectAllProduct(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<ProductEntity> list = productDao.selectAllProduct(conn, param);
		close(conn);
		return list;
	}

	public int selectTotalProductCount() {
		Connection conn = getConnection();
		int totalCount = productDao.selectTotalProductCount(conn);
		close(conn);
		return totalCount;
	}

	public List<ProductEntity> searchProduct(Map<String, Object> searchParam) {
		Connection conn = getConnection();
		List<ProductEntity> list = productDao.searchProduct(conn, searchParam);
		close(conn);
		return list;
	}

	public int updateProductValid(ProductEntity product) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = productDao.updateProductValid(conn, product);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}

		return result;
	}

	public int updateProductStock(ProductEntity product) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = productDao.updateProductStock(conn, product);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}

		return result;
	}

	public List<ProductAttachment> selectAttachmentByProductNo(int productNo) {
		Connection conn = getConnection();
		List<ProductAttachment> attachments = productDao.selectAttachmentByProductNo(conn, productNo);
		close(conn);
		return attachments;
	}

	public int deleteProduct(int productNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = productDao.deleteBoard(conn, productNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
}
