package com.tlab.mvc.payment.model.dao;

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

import com.tlab.mvc.member.model.dao.MemberDao;
import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.payment.model.vo.Payment;

public class PaymentDao {
	
	private Properties prop = new Properties();
	
	public PaymentDao() {

		String filepath = PaymentDao.class.getResource("/payment-query.properties").getPath();
		System.out.println(filepath);
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Payment> selectAllPayment(Connection conn, Member memberId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllPayment");
		ResultSet rset = null;
		List<Payment> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId.getMemberId());

			rset = pstmt.executeQuery();
			while (rset.next()) {
				Payment payment = new Payment();
				payment.setMemberId(rset.getString("member_id"));
				payment.setOrderCode(rset.getInt("order_code"));
				payment.setProductName(rset.getString("product_name"));
				payment.setQuantity(rset.getInt("quantity"));
				payment.setTotalBill(rset.getInt("total_bill"));
				payment.setPaymentDate(rset.getDate("payment_date"));
				list.add(payment);
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
