package com.tlab.mvc.cart.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.tlab.mvc.cart.model.exception.CartException;
import com.tlab.mvc.cart.model.vo.Cart;
import com.tlab.mvc.product.model.dao.ProductDao;
import com.tlab.mvc.product.model.exception.ProductExcpetion;

public class CartDao {
	
    private Properties prop = new Properties();
    
    //기본 생성자에서 클래스 객체로 빌드패스를 통해 properties 가져오기
    public CartDao() {
        String filepath = ProductDao.class.getResource("/cart-query.properties").getPath();
        System.out.println(filepath);
        try {
            prop.load(new FileReader(filepath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	

	public int insertCart(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCartList");
		int result = 0;
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cart.getProduct_name());
			pstmt.setInt(2, cart.getQuantity());
			pstmt.setInt(3, cart.getProduct_bill());
			pstmt.setString(4, cart.getMember_id());
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			throw new CartException("장바구니 등록 오류.", e);
		} finally {
			close(pstmt);
		}
		return result;

	}
	}


