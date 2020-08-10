package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MypageDAO;
import com.DAO.ThemaDAO;
import com.DTO.MypageDTO;
import com.DTO.ReviewDTO;
import com.DTO.ThemaDTO;
import com.Util.CustomInfo;
import com.Util.DBCPConn;


public class ThemaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn = DBCPConn.getConnection();
		ThemaDAO dao = new ThemaDAO(conn);
		MypageDAO mdao = new MypageDAO(conn);
		
		String uri = req.getRequestURI();
		String url;

//======================================================================================================================================
		if(uri.indexOf("thema.do")!=-1) {
					
			
			//Main.do,Main_ok에서 넘어오는 the_num 받기
			int the_num = Integer.parseInt(req.getParameter("the_num"));
			
			//the_num으로 해당 테마정보 가져오기
			ThemaDTO dto = dao.setThemaDto(the_num);
			req.setAttribute("dto", dto);

			//같은 지점의 다른 테마들 가져오기
			List<ThemaDTO> lists = dao.getAnotherThema(dao.getCafeNum(the_num));
			req.setAttribute("lists", lists);
			
			//the_num으로 해당 테마에 달린 리뷰list 가져오기
			List<ReviewDTO> reviews = dao.getLists(the_num);
			req.setAttribute("reviews", reviews);            
			
			//이미지 파일 경로
			String imagePath = cp + "/data/img/";
			req.setAttribute("imagePath", imagePath);
			
			//찜하기 중복방지
			String dpage = req.getParameter("dpage");
	        req.setAttribute("dpage", dpage);
	         
	        HttpSession session = req.getSession();
	         
	        CustomInfo info = (CustomInfo) session.getAttribute("CustomInfo");
	         
	        if(info!=null) {
	         
	           if(mdao.mySelectData(info.getId(), the_num)==1) {
	            
	              req.setAttribute("xpage", 1);
	           }
	         
	        }
			
			//포워딩
			url = "/Thema.jsp";
			forward(req, resp, url);
					

//======================================================================================================================================	
		}else if(uri.indexOf("mypage.do")!=-1) {
			
			String id = req.getParameter("id");
			
			List<ReviewDTO> myreview = mdao.myPageLists(id);
			req.setAttribute("myreview", myreview);
			
			String imagePath = cp + "/data/img/";
			req.setAttribute("imagePath", imagePath);
			
			List<ThemaDTO> W_list = mdao.getWishList(id);
			req.setAttribute("W_list", W_list);
			
			List<ThemaDTO> P_list = mdao.getPlayList(id);
			req.setAttribute("P_list", P_list);
			
			String the_num = req.getParameter("the_num");
			req.setAttribute("the_num", the_num);
			
			HttpSession session = req.getSession();
	        CustomInfo info = (CustomInfo) session.getAttribute("CustomInfo");
	         
	        ThemaDTO dto = mdao.mainYeyak(info.getTel());
	        req.setAttribute("mainYeyak", dto);
			
			url = "/Mypage.jsp";
			forward(req, resp, url);
			
			
//======================================================================================================================================	
		}else if(uri.indexOf("mypage_in.do")!=-1) {
			
			String the_num = req.getParameter("the_num");
			System.out.println(the_num);
			
			MypageDTO dto = new MypageDTO();
			dto.setMy_num(mdao.getMaxNum()+1);
			dto.setId(req.getParameter("id"));
			dto.setThe_num(Integer.parseInt(the_num));
			
			mdao.insertWishData(dto);

			url = cp + "/esct/thema.do?the_num=" + the_num;
			resp.sendRedirect(url);
			
			
//======================================================================================================================================			
		}else if(uri.indexOf("mypage_de.do")!=-1) {
			
			String the_num = req.getParameter("the_num");
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("CustomInfo");
			
			mdao.myWishDeleteData(info.getId(), the_num);
			
			System.out.println(info.getId());
			System.out.println(the_num);
			
			url = cp + "/esct/mypage.do?id=" + info.getId();
			resp.sendRedirect(url);
			

//======================================================================================================================================			
		}else if(uri.indexOf("reviewWrite_ok.do")!=-1) {
			
			
			//Thema.jsp에서 넘어오는 the_num 받기
			String the_num = req.getParameter("the_num");
			
			//Thema.jsp에서 리뷰 남길때 선택되는 값들 받고 세팅
			ReviewDTO dto = new ReviewDTO();
			
			dto.setId(req.getParameter("id"));	//아이디
			dto.setRe_num(dao.getMaxNum()+1);	//리뷰 번호
			dto.setThe_name(req.getParameter("the_name"));	//테마 이름
			
			dto.setThe_num(Integer.parseInt(the_num));	//테마 번호
			dto.setReview_rated_difficulty(req.getParameter("review_rated_difficulty"));	//체감난이도
			dto.setReview_rated_success(req.getParameter("review_rated_success"));	//성공여부
			dto.setReview_rated_star(req.getParameter("review_rated_star"));	//별점
			dto.setReview_content(req.getParameter("review_content"));	//리뷰 내용
			
			//리뷰 작성하면 리뷰 테이블에 DATA INSERT
			dao.insertData(dto);
			
			//테마 테이블에서 해당 테마에 저장되어 있는 평균 별점 가져오기
			double star = dao.themaLoadStarData(Integer.parseInt(the_num));
			
			double setStar;
			
			if(star!=0) {	//리뷰가 하나라도 있어서 별점이 있으면
			
				setStar = (star + Integer.parseInt(req.getParameter("review_rated_star")))/2.0;
				
			}else {		//첫번째 별점 부여일 경우 (리뷰가 하나도 없으면)
				
				setStar = Integer.parseInt(req.getParameter("review_rated_star"));
				
			}
			
			//테마 테이블에 계산된 새 별점 UPDATE
			dao.themaUpdateStarData(Integer.parseInt(the_num),setStar);
			
			//REDIRECT
			url = cp + "/esct/thema.do?the_num=" + the_num;
			resp.sendRedirect(url);
			
			
//======================================================================================================================================	
		}else if(uri.indexOf("reviewWrite_de.do")!=-1) {
			
			
			//Thema.jsp에서 넘어오는 the_num 받기
			String the_num = req.getParameter("the_num");
			String tpage = req.getParameter("tpage");
			
			//Thema.jsp에 리뷰list에서 넘어오는 리뷰 번호 받기
			int re_num = Integer.parseInt(req.getParameter("re_num"));
			
			//리뷰 번호로 리뷰 테이블에서 DATA DELETE
			dao.reviewDeleteData(re_num);
			
			if(tpage!=null) {
				
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("CustomInfo");
				
				url = cp + "/esct/mypage.do?id=" + info.getId();
				
				resp.sendRedirect(url);
				
			}else {
				
				//REDIRECT
				url = cp + "/esct/thema.do?the_num=" + the_num;
				resp.sendRedirect(url);
				
			}
			
			
					
//======================================================================================================================================	
		}




		
		


	}

}
