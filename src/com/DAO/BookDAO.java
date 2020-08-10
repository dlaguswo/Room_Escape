package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DTO.ThemaTimeDTO;
import com.DTO.YeYakDTO;

public class BookDAO {

	Connection conn;

	public BookDAO(Connection conn) {
		this.conn = conn;
	}


	//예약번호 부여할 때 maxNum 가져오기
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select NVL(Max(ye_num),0) from yeyak@link_test";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				maxNum = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}


	//해당 전화번호로 예약된 정보가 있는지 확인
	public int checkLogData(String tel) {

		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select ye_num from yeyak@link_test where ye_tel=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);

			rs = pstmt.executeQuery();

			if(rs.next()) {	//예약 정보가 있으면

				result = 1;

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}



	//해당 이름,예약번호,전화번호로 예약된 정보가 있는지 확인
	public int checkLogData(int ye_num,String ye_name,String ye_tel) {

		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select ye_num from yeyak@link_test where ye_num=? and ye_name=? and ye_tel=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ye_num);
			pstmt.setString(2, ye_name);
			pstmt.setString(3, ye_tel);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {	//예약 정보가 있으면

				result = 1;

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//해당 전화번호로 예약 정보 가져오기
	public YeYakDTO getReadLogData(String ye_tel) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		YeYakDTO dto = null;

		try {

			sql = "select ye_num,ye_name,ye_tel,the_num,the_name,inwon,ye_price,ye_date,ye_time from yeyak@link_test where ye_tel=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ye_tel);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new YeYakDTO();

				dto.setYe_num(rs.getInt("ye_num"));
				dto.setYe_name(rs.getString("ye_name"));
				dto.setYe_tel(rs.getString("ye_tel"));
				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setInwon(rs.getInt("inwon"));
				dto.setYe_price(rs.getInt("ye_price"));
				dto.setYe_date(rs.getString("ye_date"));
				dto.setYe_time(rs.getString("ye_time"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}


	//예약된 전화번호로 예약 정보 삭제
	public int deleteData(String tel) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "delete yeyak@link_test where ye_tel=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	
	//예약번호 찾을때 해당 이름,전화번호로 예약된 정보 있는지 확인
	public int searchData(String name,String tel) {

		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select ye_name from yeyak@link_test where ye_name=? and ye_tel=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);

			rs = pstmt.executeQuery();

			if(rs.next()) {	//예약 정보가 있으면

				result = 1;				
			}		

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//예약 완료 처리
	//예약 확인 누르면 YEYAK 테이블에 DATA INSERT
	public int insertData(YeYakDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into yeyak@link_test (ye_num,ye_name,ye_tel,the_num,the_name,inwon,ye_price,ye_date,ye_time) ";
			sql += "values (?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getYe_num());
			pstmt.setString(2, dto.getYe_name());
			pstmt.setString(3, dto.getYe_tel());
			pstmt.setInt(4, dto.getThe_num());
			pstmt.setString(5, dto.getThe_name());
			pstmt.setInt(6, dto.getInwon());
			pstmt.setInt(7, dto.getYe_price());
			pstmt.setString(8, dto.getYe_date());
			pstmt.setString(9, dto.getYe_time());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//the_num,날짜 받아서 예약 가능한 시간만 뽑아오기
	//해당 테마에 해당 날짜에서 예약되어있는 시간은 출력되지 않도록
	public List<ThemaTimeDTO> getUnbookedTime(String nalja, int the_num) {

		List<ThemaTimeDTO> listsTT = new ArrayList<ThemaTimeDTO>();

		Statement stmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select the_num,time from ";
			sql += "(select the_num,time from thematime@link_test ";
			sql += "where the_num=" + the_num + " and time not in ";
			sql += "(select ye_time from yeyak@link_test where the_num=" + the_num + " and ye_date='" + nalja + "')) order by time";

			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery(sql);

			while(rs.next()) {

				ThemaTimeDTO dtoTT = new ThemaTimeDTO();

				dtoTT.setThe_num(rs.getInt("the_num"));
				dtoTT.setTime(rs.getString("time"));

				listsTT.add(dtoTT);

			}

			stmt.close();
			rs.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return listsTT;

	}






}
