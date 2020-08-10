package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DTO.CustomDTO;

public class CustomDAO {

	private Connection conn;

	public CustomDAO(Connection conn) {
		this.conn = conn;

	}


	//회원가입
	//회원 정보 DATA INSERT
	public int insertData(CustomDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into custom@link_test (id,pwd,name,birth,gender,tel) ";
			sql+= "values (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());		
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getTel());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//해당 아이디의 회원정보 수정
	public int updateData(CustomDTO dto, String _id) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update custom@link_test set id = ?, pwd=?, name=?, birth=?, gender=?, tel=? where id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getTel());
			pstmt.setString(7, _id);


			result = pstmt.executeUpdate();

			pstmt.close();

			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getBirth());
			System.out.println(dto.getGender());
			System.out.println(dto.getTel());


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;



	}


	//해당 아이디로 회원정보 가져오기
	public CustomDTO getReadData(String id) {

		CustomDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql="select id,pwd,name,tel,gender,to_char(birth,'YYYY-MM-DD') birth";
			sql+=" from custom@link_test where id=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new CustomDTO();

				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}


	//해당 아이디의 회원정보 전체 삭제
	public int deleteData(String id) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql="delete custom@link_test where id =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			result = pstmt.executeUpdate();

			pstmt.close();


			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}





}



