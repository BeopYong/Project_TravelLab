package com.tlab.mvc.common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
//import org.apache.log4j.Logger;

/**
 * 로깅 및 공통 객체를 상속받아 사용하기 위한 클래스 (선택사항)
 * 
 * @author jimmerland
 */

public class CommonSqlVo {

	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	private Properties prop = new Properties();
//	private Logger log = Logger.getRootLogger();

	public String getQueryString(String pstmt) {
		String query = pstmt.substring(pstmt.indexOf(":") + 1);
		return query;
	}
}
