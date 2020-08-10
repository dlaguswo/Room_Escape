package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DTO.CafeDTO;
import com.DTO.ReviewDTO;
import com.DTO.ThemaDTO;
import com.DTO.ThemaTimeDTO;

public class ThemaDAO {

	private Connection conn;

	public ThemaDAO(Connection conn) {
		this.conn = conn;
	}


	//the_num으로 해당 테마 정보 가져오기
	public ThemaDTO setThemaDto(int the_num) {

		ThemaDTO dto = new ThemaDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename,the_story ";
			sql += "from thema@link_test where the_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, the_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setCafe_num(rs.getInt("cafe_num"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setPrice(rs.getInt("price"));
				dto.setStar(rs.getDouble("star"));
				dto.setImagefilename(rs.getString("imagefilename"));
				dto.setThe_story(rs.getString("the_story"));

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}


	//카페 번호로 카페 정보 가져오기
	public CafeDTO setCafeDto(int cafe_num) {

		CafeDTO dto = new CafeDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select cafe_num,cafe_name,addr,cafe_tel,region ";
			sql += "from cafe@link_test where cafe_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cafe_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto.setCafe_num(rs.getInt("cafe_num"));
				dto.setCafe_name(rs.getString("cafe_name"));
				dto.setAddr(rs.getString("addr"));
				dto.setCafe_tel(rs.getString("cafe_tel"));

				if(rs.getInt("region")!=0) {
					dto.setRegion("강남");
				}else {
					dto.setRegion("홍대");
				}

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}


	/*
	//필요없음
	//the_num으로 ThemaTimeDTO 세팅
	public List<ThemaTimeDTO> setThemaTimeDto(int the_num) {

		List<ThemaTimeDTO> lists = new ArrayList<ThemaTimeDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select the_num,time ";
			sql += "from thematime@link_test where the_num=? order by time";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, the_num);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ThemaTimeDTO dto = new ThemaTimeDTO();

				dto.setThe_num(rs.getInt("the_num"));
				dto.setTime(rs.getString("time"));

				lists.add(dto);

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	*/


	//같은 지점의 다른 테마들 가져오기
	public List<ThemaDTO> getAnotherThema(int cafe_num){

		List<ThemaDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select the_num,the_name,imagefilename from thema@link_test where cafe_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafe_num);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				ThemaDTO dto = new ThemaDTO();
				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setImagefilename(rs.getString("imagefilename"));
				System.out.println(dto.getImagefilename());

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}


	//the_num으로 해당 카페 번호 가져오기
	public int getCafeNum(int the_num) {

		int num = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select cafe_num from thema@link_test where the_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, the_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				num = rs.getInt("cafe_num");

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return num;

	}


	//the_num으로 해당 테마에 달린 리뷰list 가져오기
	public List<ReviewDTO> getLists(int the_num){

		List<ReviewDTO> lists = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from review@link_test where the_num=? order by re_num desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, the_num);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				ReviewDTO dto = new ReviewDTO();
				dto.setRe_num(rs.getInt("re_num"));
				dto.setThe_num(rs.getInt("the_num"));
				dto.setId(rs.getString("id"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_rated_difficulty(rs.getString("review_rated_difficulty"));
				dto.setReview_rated_success(rs.getString("review_rated_success"));
				dto.setRe_created(rs.getString("re_created"));
				dto.setReview_rated_star(rs.getString("review_rated_star"));
				lists.add(dto);

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}


	//리뷰테이블에서 maxNum 가져오기 (리뷰 번호 부여)
	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(re_num), 0) from review@link_test";

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


	//리뷰 작성하면 리뷰 테이블에 DATA INSERT
	public int insertData(ReviewDTO dto) {

	      int result = 0;
	      PreparedStatement pstmt = null;
	      String sql;

	      try {

	         sql = "insert into review@link_test(re_num, the_name, the_num, id, review_content, review_rated_difficulty, review_rated_success, re_created, review_rated_star) ";
	         sql += "values(?,?, ?, ?, ?, ?, ?, sysdate, ?)";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, dto.getRe_num());
	         pstmt.setString(2, dto.getThe_name());
	         pstmt.setInt(3, dto.getThe_num());
	         pstmt.setString(4, dto.getId());
	         pstmt.setString(5, dto.getReview_content());
	         pstmt.setString(6, dto.getReview_rated_difficulty());
	         pstmt.setString(7, dto.getReview_rated_success());         
	         pstmt.setString(8, dto.getReview_rated_star());

	         result = pstmt.executeUpdate();

	         pstmt.close();

	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return result;

	   }


	//테마 테이블에서 해당 테마에 저장되어 있는 평균 별점 가져오기
	public int themaLoadStarData(int the_num) {

		int star = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select star from thema@link_test where the_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, the_num);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				star = rs.getInt("star");

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return star;

	}


	//테마 테이블에 계산된 새 별점 UPDATE
	public int themaUpdateStarData(int the_num,double star) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "update thema@link_test set star=? where the_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, star);
			pstmt.setInt(2, the_num);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//리뷰 번호로 리뷰 테이블에서 DATA DELETE
	public int reviewDeleteData(int re_num) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "delete review@link_test where re_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_num);
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}









}
