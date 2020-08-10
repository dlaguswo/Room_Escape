package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MainDAO;
import com.DTO.ThemaDTO;
import com.Util.DBCPConn;

public class MainServlet extends HttpServlet {

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
		MainDAO dao = new MainDAO(conn);

		String uri = req.getRequestURI();
		String url;

//======================================================================================================================================
		if(uri.indexOf("main.do")!=-1) {


			//페이징===========================================================
			
			//처음 시작
			int currentPage = 1;
			int numPerPage = 9;

			//Main.jsp에서 넘어온 pageNum 받기
			String pageNum = req.getParameter("pageNum");

			if(pageNum!=null) {	//처음 실행이 아니면
				currentPage = Integer.parseInt(pageNum);
			}else {	//처음 실행이면
				pageNum = "1";
			}

			//현재 페이지로 뽑아올 데이터 시작과 끝 구하기
			//1페이지 -> 1~9
			//2페이지 -> 10~18
			//3페이지 -> 19~27
			//각 페이지당 테마 데이터 9개씩
			int start = (currentPage-1)*numPerPage + 1;
			int end = currentPage*numPerPage;

			//테마 9개씩 lists에 담기
			List<ThemaDTO> lists = dao.getList(start, end);

			//left,right
			//화살표 3페이지 순환 돌리기
			int prePageNum;
			int nextPageNum;

			//left(왼쪽 화살표) 세팅
			if(pageNum=="1" || pageNum.equals("1")) {	//현재페이지가 1페이지이면
				prePageNum = 3;	//left는 3페이지
			}else {	//이외에는
				prePageNum = Integer.parseInt(pageNum)-1;	//left는 현재페이지-1
			}

			//right(오른쪽 화살표) 세팅
			if(pageNum=="3" || pageNum.equals("3")) {	//현재페이지가 3페이지이면
				nextPageNum = 1;	//right는 1페이지
			}else {	//이외에는
				nextPageNum = Integer.parseInt(pageNum)+1;	//right는 현재페이지+1
			}
			
			req.setAttribute("currentPage", currentPage);	//페이징
			req.setAttribute("prePageNum", prePageNum);	//페이징
			req.setAttribute("nextPageNum", nextPageNum);	//페이징
			
			//페이징===========================================================

			
			//테마 이미지 파일 경로
			String imagePath = cp + "/data/img/";
			
			req.setAttribute("imagePath", imagePath);	//이미지경로
			req.setAttribute("lists", lists);	//테마 8개 담긴 메인리스트
			req.setAttribute("msg", req.getParameter("msg"));	//로그인 상태에서 예약이 없을 때, 스크립트로 창 띄우기
			
			//포워딩
			url = "/Main.jsp";
			forward(req, resp, url);


//======================================================================================================================================
		}else if(uri.indexOf("main_ok.do")!=-1) {

			//Main.jsp에서 넘어오는 DATA 받기
			String chain = req.getParameter("chain");	//지점
			String[] thema = req.getParameterValues("thema");	//테마
			String level = req.getParameter("level");	//난이도
			
			
			//검색시 선택한 지점,테마,난이도로 해당되는 테마 다 가져오기
			List<ThemaDTO> listsT = dao.getReadData(thema, level, chain);
			req.setAttribute("listsT", listsT);

			//테마 이미지 파일 경로
			String imagePath = cp + "/data/img/";

			req.setAttribute("imagePath", imagePath);	//이미지경로

			//포워딩
			url = "/Main_ok.jsp";
			forward(req, resp, url);


//======================================================================================================================================
		}else if(uri.indexOf("intro.do")!=-1) {

			url = "/Intro.jsp";
			forward(req, resp, url);
			
//======================================================================================================================================
		}





	}


}