package com.tlab.mvc.orderlist.model.service;

import static com.tlab.mvc.common.JdbcTemplate.close;
import static com.tlab.mvc.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.orderlist.model.dao.OrderListDao;
import com.tlab.mvc.orderlist.model.vo.OrderList;

public class OrderListService {
	
	private OrderListDao orderListDao = new OrderListDao();

	
	public List<OrderList> selectAllOrderList(Member memberId) {
		Connection conn = getConnection();
		List<OrderList> orderList = orderListDao.selectAllOrderList(conn, memberId);
		close(conn);
		return orderList;
	}



}
