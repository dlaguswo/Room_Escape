package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DTO.MypageDTO;
import com.DTO.ReviewDTO;
import com.DTO.ThemaDTO;

public class MypageDAO {

	Connection conn;

	public MypageDAO(Connection conn) {
		this.conn = conn;
	}


	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select NVL(Max(my_num),0) from mypage@link_test";

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

	public int insertWishData(MypageDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "insert into mypage@link_test (my_num,id,the_num,wish_play) values (?,?,?,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getMy_num());
			pstmt.setString(2, dto.getId());
			pstmt.setInt(3, dto.getThe_num());

			result = pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int insertPlayData(MypageDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "insert into mypage@link_test (my_num,id,the_num,wish_play) values (?,?,?,1)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getMy_num());
			pstmt.setString(2, dto.getId());
			pstmt.setInt(3, dto.getThe_num());

			result = pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public List<ReviewDTO> myPageLists(String id){
		List<ReviewDTO> lists = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt;
		ResultSet rs;
		try {
			String sql = "select * from review@link_test where id=? order by re_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				ReviewDTO dto = new ReviewDTO();
				dto.setRe_num(rs.getInt("re_num"));
				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
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

	public List<ThemaDTO> getWishList(String id) {

		ThemaDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		List<ThemaDTO> lists = new ArrayList<>();

		try {

			sql = "select my_num,A.the_num,the_name,the_level,cate_num,playtime,price,star,imagefilename,the_story from "
					+ "thema@link_test A INNER JOIN mypage@link_test B on A.the_num = b.the_num where id=? and wish_play=0 order by my_num desc";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				dto = new ThemaDTO();

				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setPrice(rs.getInt("price"));
				dto.setImagefilename(rs.getString("imagefilename"));
				dto.setThe_story(rs.getString("the_story"));


				lists.add(dto);
			}


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}

	public List<ThemaDTO> getPlayList(String id) {

		ThemaDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		List<ThemaDTO> lists = new ArrayList<>();

		try {

			sql = "select my_num,A.the_num,the_name,the_level,cate_num,playtime,price,star,imagefilename,the_story from "
					+ "thema@link_test A INNER JOIN mypage@link_test B on A.the_num = b.the_num where id=? and wish_play=1 order by my_num desc";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				dto = new ThemaDTO();

				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setPrice(rs.getInt("price"));
				dto.setImagefilename(rs.getString("imagefilename"));
				dto.setThe_story(rs.getString("the_story"));


				lists.add(dto);
			}


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}


	public int myDeleteData(String id, String the_num) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "delete mypage@link_test where id=? and the_num=? and wish_play=1";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, the_num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int myWishDeleteData(String id, String the_num) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "delete mypage@link_test where id=? and wish_play=0 and the_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, the_num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int mySelectData(String id,int the_num) {

		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select id,the_num,wish_play from mypage@link_test where id =? and the_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, the_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				result = 1;

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}


		return result;

	}

	public ThemaDTO mainYeyak(String tel) {

		ThemaDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {

			sql = "select imagefilename,the_name,the_level,playtime,the_story,the_num from thema@link_test"
					+ " where the_num = (select the_num from yeyak@link_test where ye_tel=?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);
			rs = pstmt.executeQuery();

			if(rs.next()) {         
				dto = new ThemaDTO();

				dto.setImagefilename(rs.getString("imagefilename"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setThe_story(rs.getString("the_story"));
				dto.setThe_num(rs.getInt("the_num"));         
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}


	public int myAllDeleteData(String id) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql = null;

		try {

			sql = "delete mypage@link_test where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}





}
