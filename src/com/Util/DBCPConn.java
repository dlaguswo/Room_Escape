package com.Util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	
	//DBCP (DataBase Connection Pool)
	//데이터베이스와 연결된 커넥션을 미리 만들어서 POOL영역에
	//저장해 두고 있다가 필요할 때 가져다 쓰고 다시 POOL영역에 반환한다
	//DBConn은 자바 메모리에 DB위치정보 저장해서 연결하는 거고
	//DBCP는 서버(Tomcat) 자체 메모리에 DB위치정보 저장해놓는 것...?

	private static Connection conn = null;
	
	public static Connection getConnection() {
		
		if(conn==null) {
			
			try {
				
				//이름과 객체를 바인딩
				Context ctx = new InitialContext();
				
				//web.xml에서 환경 설정을 찾음
				Context evt = (Context)ctx.lookup("java:/comp/env");
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
				
				conn = ds.getConnection();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		}
		
		return conn;
		
	}
	
	
	public static void close() {
		
		if(conn!=null) {
			
			try {
				
				if(!conn.isClosed())
					conn.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		}
		
		conn = null;
		
	}
	
	
}
