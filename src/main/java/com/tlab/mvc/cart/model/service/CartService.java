package com.tlab.mvc.cart.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.commit;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;
import static com.tlab.mvc.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.tlab.mvc.cart.model.dao.CartDao;
import com.tlab.mvc.cart.model.vo.Cart;

public class CartService {
	
	private CartDao cartDao = new CartDao();

	public int insertCart(Cart cart) {
		Connection conn = getConnection();
		int result = 0;
		try {
			conn = getConnection();
			result = cartDao.insertCart(conn,cart);
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
