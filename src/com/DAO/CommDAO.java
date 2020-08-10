package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DTO.CommDTO;

public class CommDAO {

	private Connection conn;

	public CommDAO(Connection conn) {
		this.conn = conn;
	}


	// 자유게시판 댓글 maxNum 가져오기
	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(co_num), 0) from comm@link_test";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				maxNum = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return maxNum;

	}


	// 댓글 테이블에 DATA INSERT
	public int insertData(CommDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into comm@link_test(co_num, bo_num, id, co_content, co_created) ";
			sql += "values(?, ?, ?, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCo_num());
			pstmt.setInt(2, dto.getBo_num());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getCo_content());	

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}


	// num으로 해당 게시글에 남겨진 댓글 가져오기
	public List<CommDTO> getLists(int num) {
		
		List<CommDTO> lists = new ArrayList<CommDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select co_num, bo_num, id, ";
			sql += "to_char(co_created, 'YYYY-MM-DD') co_created, co_content ";
			sql += "from comm@link_test where bo_num = ? order by co_num desc) data) ";

			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CommDTO dto = new CommDTO();
				
				dto.setCo_num(rs.getInt("co_num"));
				dto.setBo_num(rs.getInt("bo_num"));
				dto.setId(rs.getString("id"));
				dto.setCo_content(rs.getString("co_content"));
				dto.setCo_created(rs.getString("co_created"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lists;
		
	}

	// 댓글 수정
	public int updateData(CommDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update comm@link_test set co_content = ? where co_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCo_content());
			pstmt.setInt(2, dto.getCo_num());
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	// 댓글 삭제
	public int deleteData(int num) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete comm@link_test where co_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
}
