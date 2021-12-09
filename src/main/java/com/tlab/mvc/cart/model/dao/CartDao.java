package com.tlab.mvc.cart.model.dao;

import static com.tlab.mvc.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.tlab.mvc.cart.model.exception.CartException;
import com.tlab.mvc.cart.model.vo.Cart;
import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.orderlist.model.exception.OrderListException;
import com.tlab.mvc.orderlist.model.vo.OrderList;
import com.tlab.mvc.product.model.dao.ProductDao;
import com.tlab.mvc.product.model.exception.ProductExcpetion;

public class CartDao {

	private Properties prop = new Properties();

	// 기본 생성자에서 클래스 객체로 빌드패스를 통해 properties 가져오기
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

	public List<Cart> selectAllCartList(Connection conn, Member memberId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMyCartList");
		ResultSet rset = null;
		List<Cart> list = new ArrayList<>();
		try {
			// 1.pstmt객체생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId.getMemberId());
			// 2.실행
			rset = pstmt.executeQuery();
			// 3.rset처리 : 하나의 레코드 -> vo객체하나 -> list에 추가
			while (rset.next()) {
				Cart cart = new Cart();
				cart.setNo(rset.getInt("no"));
				cart.setProduct_name(rset.getString("product_name"));
				cart.setQuantity(rset.getInt("quantity"));
				cart.setMember_id(rset.getString("member_id"));
				cart.setProduct_bill(rset.getInt("product_bill"));
				list.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
