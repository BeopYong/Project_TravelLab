package com.tlab.mvc.payment.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.payment.model.dao.PaymentDao;
import com.tlab.mvc.payment.model.vo.Payment;

public class PaymentService {
	
	private PaymentDao paymentDao = new PaymentDao();

	public List<Payment> selectAllPayment(Member memberId) {
		Connection conn = getConnection();
		List<Payment> list = paymentDao.selectAllPayment(conn, memberId);
		close(conn);
		return list;
	}

}
