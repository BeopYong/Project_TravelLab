package com.tlab.mvc.product.model.dao;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import static com.tlab.mvc.common.JdbcTemplate.*;

import com.tlab.mvc.member.model.dao.MemberDao;
import com.tlab.mvc.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	//기본 생성자에서 클래스 객체로 빌드패스를 통해 properties 가져오기
	public ProductDao() {
		String filepath = MemberDao.class.getResource("/product-query.properties").getPath();
		System.out.println(filepath);
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public List<Product> randomProductFoodList(Connection conn, Map<String, Integer> param) {
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("randomProductList");
		ResultSet rs = null;
		List<Product> foodList = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, param.get("301"));
			pstmt.setInt(2, param.get("end"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setNo(rs.getInt("no"));
				product.setRegion(rs.getString("region"));
				product.setP_category(rs.getInt("p_category"));
				product.setP_name(rs.getString("p_name"));
				product.setP_content(rs.getString("p_content"));
				product.setP_stock(rs.getInt("p_stock"));
				product.setUnit_price(rs.getInt("unit_price"));
				product.setValid(rs.getString("valid"));
				product.setReg_date(rs.getDate("reg_date"));
				
				foodList.add(product);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
			
		return foodList;
	}
	
	public List<Product> randomProductPlaceList(Connection conn, Map<String, Integer> param) {
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("randomProductList");
		ResultSet rs = null;
		List<Product> placeList = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, param.get("302"));
			pstmt.setInt(2, param.get("end"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setNo(rs.getInt("no"));
				product.setRegion(rs.getString("region"));
				product.setP_category(rs.getInt("p_category"));
				product.setP_name(rs.getString("p_name"));
				product.setP_content(rs.getString("p_content"));
				product.setP_stock(rs.getInt("p_stock"));
				product.setUnit_price(rs.getInt("unit_price"));
				product.setValid(rs.getString("valid"));
				product.setReg_date(rs.getDate("reg_date"));
				
				placeList.add(product);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
			
		return placeList;
	}

}
