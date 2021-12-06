package com.tlab.mvc.orderlist.model.dao;

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

import com.tlab.mvc.member.model.vo.Member;
import com.tlab.mvc.orderlist.model.exception.OrderListException;
import com.tlab.mvc.orderlist.model.vo.OrderList;

public class OrderListDao {

    private Properties prop = new Properties();
    
    //기본 생성자에서 클래스 객체로 빌드패스를 통해 properties 가져오기
    public OrderListDao() {
        String filepath = OrderListDao.class.getResource("/order-list.properties").getPath();
        System.out.println(filepath);
        try {
            prop.load(new FileReader(filepath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	public List<OrderList> selectAllOrderList(Connection conn, Member memberId) {
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectMyOrderList");
        ResultSet rset = null;
        List<OrderList> orderList = new ArrayList<>();
        try {
            // 1.pstmt객체생성
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId.getMemberId());
            // 2.실행
            rset = pstmt.executeQuery();
            // 3.rset처리 : 하나의 레코드 -> vo객체하나 -> list에 추가
            while (rset.next()) {
            	OrderList order = new OrderList();
            	order.setNo(rset.getInt("no"));
            	order.setOrderCode(rset.getInt("order_code"));
            	order.setMemberId(rset.getString("member_id"));
            	order.setTotalBill(rset.getInt("total_bill"));
            	order.setPaymentDate(rset.getDate("payment_date"));
            	orderList.add(order);
            }
        } catch (SQLException e) {
            throw new OrderListException("조회 오류", e);
        } finally {
            close(rset);
            close(pstmt);
        }
        return orderList;
	}

}
