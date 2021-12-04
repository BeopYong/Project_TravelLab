package com.tlab.mvc.product.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.commit;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;
import static com.tlab.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.tlab.mvc.product.model.dao.ProductDao;
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

}
