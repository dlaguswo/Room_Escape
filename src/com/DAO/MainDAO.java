package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.DTO.ThemaDTO;

public class MainDAO {

	private Connection conn;

	public MainDAO(Connection conn) {
		this.conn = conn;
	}

	
	//메인화면에 뿌릴 테마 9개씩 뽑아오기(별점 높은 순)
	public List<ThemaDTO> getList(int start, int end){

		List<ThemaDTO> lists = new ArrayList<ThemaDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum,data.* from (";
			sql += "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename from thema@link_test where star is not null order by star desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ThemaDTO dto = new ThemaDTO();

				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setCafe_num(rs.getInt("cafe_num"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setPrice(rs.getInt("price"));
				dto.setStar(rs.getDouble("star"));
				dto.setImagefilename(rs.getString("imagefilename"));

				lists.add(dto);

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}


	//검색된 조건에 해당하는 데이터 가져오기
	public List<ThemaDTO> getReadData(String[] thema, String level, String chain){

		List<ThemaDTO> lists = new ArrayList<ThemaDTO>();

		Statement stmt = null;
		ResultSet rs = null;
		String sql;

		String themaSet = "";

		//테마를 선택했으면
		if(thema!=null) {

			for(String thema1 : thema) {	//선택된 테마들 차례로 집어넣고 콤마로 이어라
				themaSet += thema1 + ",";
			}

			themaSet = themaSet.substring(0, themaSet.length()-1);	//마지막 콤마 지워주기

		}

		try {

			if((themaSet==null||themaSet.equals(""))&&(level==null||level.equals(""))) {//지역만선택
				sql = "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename from ";
				sql += "(select * from thema@link_test where cafe_num in (select cafe_num from cafe@link_test where region=" + chain +"))";
			}else if(themaSet==null||themaSet.equals("")){//지역,레벨선택
				sql = "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename from ";
				sql += "(select * from thema@link_test where cafe_num in (select cafe_num from cafe@link_test where region=" + chain +"))";
				sql += "where the_level='" + level + "'";
			}else if(level==null||level.equals("")) {//지역,테마선택
				sql = "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename from ";
				sql += "(select * from thema@link_test where cafe_num in (select cafe_num from cafe@link_test where region=" + chain +"))";
				sql += "where cate_num in (" + themaSet + ")";
			}else {//모두선택
				sql = "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename from ";
				sql += "(select * from thema@link_test where cafe_num in (select cafe_num from cafe@link_test where region=" + chain +"))";
				sql += "where cate_num in (" + themaSet + ") and the_level='" + level + "'";
			}
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {//검색된 테마들 LIST에 담기

				ThemaDTO dto = new ThemaDTO();

				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setCafe_num(rs.getInt("cafe_num"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setPrice(rs.getInt("price"));
				dto.setStar(rs.getDouble("star"));
				dto.setImagefilename(rs.getString("imagefilename"));

				lists.add(dto);

			}

			stmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

/*
	//필요없음
	public List<ThemaDTO> getListMain_ok(int start, int end){

		List<ThemaDTO> lists = new ArrayList<ThemaDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum,data.* from (";
			sql += "select the_num,the_name,cafe_num,the_level,cate_num,playtime,price,star,imagefilename from thema@link_test order by the_num desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ThemaDTO dto = new ThemaDTO();

				dto.setThe_num(rs.getInt("the_num"));
				dto.setThe_name(rs.getString("the_name"));
				dto.setCafe_num(rs.getInt("cafe_num"));
				dto.setThe_level(rs.getString("the_level"));
				dto.setCate_num(rs.getInt("cate_num"));
				dto.setPlaytime(rs.getString("playtime"));
				dto.setPrice(rs.getInt("price"));
				dto.setStar(rs.getString("star"));
				dto.setImagefilename(rs.getString("imagefilename"));

				lists.add(dto);

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}


	//필요없음
	//전체 데이터 개수
	public int getDataCount() {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select NVL(count(*),0) from thema";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				dataCount = rs.getInt(1);
			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}
	*/






}
