package com.tlab.mvc.product.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import static com.tlab.mvc.common.JdbcTemplate.*;

import com.tlab.mvc.product.model.dao.ProductDao;
import com.tlab.mvc.product.model.vo.Product;

public class ProductService {
	private ProductDao productDao = new ProductDao();

	

	public List<Product> randomProductList(Map<String, Integer> param) {
		Connection conn = getConnection();
		List<Product> list = productDao.randomProductList(conn, param);
		close(conn);
		
		return list;
	}

}
