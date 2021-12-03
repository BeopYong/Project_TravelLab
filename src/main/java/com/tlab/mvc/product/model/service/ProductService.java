package com.tlab.mvc.product.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import static com.tlab.mvc.common.JdbcTemplate.*;

import com.tlab.mvc.product.model.dao.ProductDao;
import com.tlab.mvc.product.model.vo.Product;

public class ProductService {
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


}
