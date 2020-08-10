package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DTO.PostDTO;

public class PostDAO {

	private Connection conn;

	public PostDAO(Connection conn) {
		this.conn = conn;
	}

	
	//자유게시판 게시글 MaxNum값 구하기
	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(bo_num), 0) from post";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				maxNum = rs.getInt(1); // 첫 번째 결과값(게시글 Max 번호)을 int형으로 maxNum에 넣어줌
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return maxNum;
		
	}

	
	// 자유 게시판 글쓰기하면 DATA INSERT
	public int insertData(PostDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into post(bo_num, id, bo_subject, bo_content, bo_imagename, bo_created, hit) ";
			sql += "values(?, ?, ?, ?, ?, sysdate, 0)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBo_num());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getBo_subject());
			pstmt.setString(4, dto.getBo_content());
			pstmt.setString(5, dto.getBo_imagename());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	
	// 전체데이터(게시물) 출력(페이지마다 개수 제한)
	public List<PostDTO> getLists(int start, int end, String searchKey, String searchValue) {
		
		List<PostDTO> lists = new ArrayList<PostDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		// 조회된 순서대로 순번을 매김
		try {
			
			searchValue = "%" + searchValue + "%";
			
			if(!searchKey.equals("total")) {
				
				sql = "select * from (";
				sql += "select rownum rnum, data.* from (";
				sql += "select bo_num, id, bo_subject, bo_content, bo_imagename, ";
				sql += "to_char(bo_created, 'YYYY-MM-DD') bo_created, hit, (SELECT COUNT(*) FROM COMM B WHERE B.BO_NUM=A.BO_NUM) cnt ";
				sql += "from post A where " + searchKey + " like ? order by bo_num desc) data) "; // num(게시물 번호)가 높을 수록 최신 게시물 따라서 내림차순 정렬
				sql += "where rnum >= ? and rnum <= ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
			} else {
				
				sql = "select * from (";
				sql += "select rownum rnum, data.* from (";
				sql += "select bo_num, id, bo_subject, bo_content, bo_imagename, ";
				sql += "to_char(bo_created, 'YYYY-MM-DD') bo_created, hit, (SELECT COUNT(*) FROM COMM B WHERE B.BO_NUM=A.BO_NUM) cnt ";
				sql += "from post A where id like ? OR bo_subject like ? OR bo_content like ? order by bo_num desc) data) "; // num(게시물 번호)가 높을 수록 최신 게시물 따라서 내림차순 정렬
				sql += "where rnum >= ? and rnum <= ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
				pstmt.setString(2, searchValue);
				pstmt.setString(3, searchValue);
				pstmt.setInt(4, start);
				pstmt.setInt(5, end);
				
			}
				
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				PostDTO dto = new PostDTO();
				dto.setBo_num(rs.getInt("bo_num"));
				dto.setId(rs.getString("id"));
				dto.setBo_subject(rs.getString("bo_subject"));
				dto.setBo_content(rs.getString("bo_content"));
				dto.setBo_imagename(rs.getString("bo_imagename"));
				dto.setBo_created(rs.getString("bo_created"));
				dto.setHit(rs.getInt("hit"));
				dto.setCnt(rs.getInt("cnt"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lists;
		
	}
	
	
	// 전체 데이터(게시물) 개수
	public int getDataCount(String searchKey, String searchValue) {
		
		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			
			if(searchValue == null) { // 검색 X
				
				sql = "select nvl(count(*), 0) from post";
				pstmt = conn.prepareStatement(sql);
				
			} else if(searchKey.equals("total") || !searchValue.equals("")) { // 전체 Select, 검색 O
				
				searchValue = "%" + searchValue + "%";
				
				sql = "select nvl(count(*), 0) from post ";
				sql += "where id like ? OR bo_subject like ? OR bo_content like ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
				pstmt.setString(2, searchValue);
				pstmt.setString(3, searchValue);
				
			}else { // 전체 x, 검색 o
				
				sql = "select nvl(count(*), 0) from post ";
				sql += "where " + searchKey + " like ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
				
			}			
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dataCount = rs.getInt(1);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dataCount;
		
	}

	
	// num으로 조회한 데이터
	public PostDTO getReadData(int num) {
		
		PostDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from post where bo_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				 dto = new PostDTO();
				 
				 dto.setBo_num(rs.getInt("bo_num"));
				 dto.setId(rs.getString("id"));
				 dto.setBo_subject(rs.getString("bo_subject"));
				 dto.setBo_content(rs.getString("bo_content"));
				 dto.setBo_imagename(rs.getString("bo_imagename"));
				 dto.setBo_created(rs.getString("bo_created"));
				 dto.setHit(rs.getInt("hit"));
				 
			 }
			
			 rs.close();
			 pstmt.close();
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
		
	
	// 조회수 증가
	public void updateCount(int num) {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update post set hit = hit + 1 where bo_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 게시물 수정
	public int updateData(PostDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update post set bo_subject = ?, bo_content = ?, bo_imagename = ? where bo_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getBo_subject());
			pstmt.setString(2, dto.getBo_content());
			pstmt.setString(3, dto.getBo_imagename());
			pstmt.setInt(4, dto.getBo_num());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	// 게시물 삭제
	public int deleteData(int num) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete post where bo_num = ?";
			
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
