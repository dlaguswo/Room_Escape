package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAO;
import com.DAO.MypageDAO;
import com.DAO.ThemaDAO;
import com.DTO.CafeDTO;
import com.DTO.MypageDTO;
import com.DTO.ThemaDTO;
import com.DTO.ThemaTimeDTO;
import com.DTO.YeYakDTO;
import com.Util.CustomInfo;
import com.Util.DBCPConn;

public class BookServlet extends HttpServlet{

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
		ThemaDAO daoT = new ThemaDAO(conn);
		BookDAO daoB = new BookDAO(conn);
		MypageDAO mdao = new MypageDAO(conn);

		String uri = req.getRequestURI();
		String url;

//======================================================================================================================================
		if(uri.indexOf("bookmain.do")!=-1) {

			
			//Thema.jsp에서 넘어온 the_num
			int the_num = Integer.parseInt(req.getParameter("the_num"));
			
			Calendar cal = Calendar.getInstance();

			//BookMain.jsp에서 selected되서 넘어온 년,월,일
			String yearSel = req.getParameter("yearSel");
			String monthSel = req.getParameter("monthSel");
			String dateSel = req.getParameter("dateSel");

			//2020-10-10
			String nalja = yearSel + "-" + monthSel + "-" + dateSel;

			//the_num,날짜에 따라 예약 가능한 시간만 가져오기
			List<ThemaTimeDTO> listsTT = daoB.getUnbookedTime(nalja, the_num);
			req.setAttribute("listsTT", listsTT);

			if(monthSel!=null) {//BookMain에서 월이 선택 됬으면

				int year = Integer.parseInt(yearSel);//년 받고
				int month = Integer.parseInt(monthSel);//월 받고

				//표시할 달력 세팅
				cal.set(year, month-1,1);

				//선택된 년,월에 따라 마지막 일 구하기
				//2020년2월 -> 29일
				int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				req.setAttribute("endDay", endDay);
				
				//마지막으로 년,월,일,날짜 보내서 뿌려주기
				req.setAttribute("year", year);
				req.setAttribute("month", month);
				req.setAttribute("date", dateSel);
				
				//BookMain -> bookmain_ok.do 로 이동
				req.setAttribute("nalja", nalja);

			}else {

				yearSel = "1";
				monthSel = "1";
				dateSel = "1";

			}

			//the_num으로 해당 테마 정보 가져오기
			ThemaDTO dtoT = daoT.setThemaDto(the_num);
			req.setAttribute("dtoT", dtoT);
			
			//해당 테마의 카페번호로 카페 정보 가져오기 
			CafeDTO dtoC = daoT.setCafeDto(dtoT.getCafe_num());
			req.setAttribute("dtoC", dtoC);
			
			//the_num 보내기
			req.setAttribute("the_num", the_num);
			
			/*
			//필요없음
			//the_num으로 해당 테마 뿌려줄 시간 가져오기
			List<ThemaTimeDTO> lists = daoT.setThemaTimeDto(the_num);
			req.setAttribute("lists", lists);
			*/
					
			//포워딩
			url = "/BookMain.jsp";
			forward(req, resp, url);


//======================================================================================================================================
		}else if(uri.indexOf("bookmain_ok.do")!=-1) {


			//BookMain.jsp에서 넘어온 DATA
			int the_num = Integer.parseInt(req.getParameter("the_num"));
			String the_name = req.getParameter("the_name");
			String nalja = req.getParameter("nalja");
			String ye_time = req.getParameter("ye_time");
			int inwon = Integer.parseInt(req.getParameter("inwon"));
			int ye_price = Integer.parseInt(req.getParameter("ye_price"));
			String ye_name = req.getParameter("ye_name");
			String ye_tel = req.getParameter("ye_tel");
			
			if(daoB.checkLogData(ye_tel)!=0) {	// 해당 전화번호로 예약된 정보가 있으면
				
				//전화번호랑 msg여부 보내기
				url = cp + "/escb/book_ok.do?ye_tel=" + ye_tel + "&msg=1";
				resp.sendRedirect(url);
				
			}else {	//	해당 전화번호로 예약된 정보가 없으면
				
				//예약완료 처리
				YeYakDTO dtoY = new YeYakDTO();

				dtoY.setThe_num(the_num);
				dtoY.setThe_name(the_name);
				dtoY.setYe_time(ye_time);
				dtoY.setInwon(inwon);
				dtoY.setYe_price(ye_price);
				dtoY.setYe_name(ye_name);
				dtoY.setYe_tel(ye_tel);
				dtoY.setYe_date(nalja);
				dtoY.setYe_num(daoB.getMaxNum()+1);

				//YEYAK 테이블에 DATA INSERT
				daoB.insertData(dtoY);
				
				//세션 생성, 세션에 올라져 있는 DATA 받기
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("CustomInfo");
			
				if(info!=null) {	//로그인이 되어있으면
		
					MypageDTO mdto = new MypageDTO();
					
					mdto.setId(info.getId());
					mdto.setMy_num(mdao.getMaxNum()+1);
					mdto.setThe_num(the_num);
		
					//마이페이지 테이블에 DATA INSERT
					mdao.insertPlayData(mdto);
					
					//예약을 하면 해당 테마가 찜목록에서 지워지도록
					mdao.myWishDeleteData(info.getId(), req.getParameter("the_num"));
					
				}

				//REDIRECT
				url = cp + "/escm/main.do";
				resp.sendRedirect(url);

				
			}
			
			
//======================================================================================================================================
		}else if(uri.indexOf("book.do")!=-1) {

			
			//세션생성, 세션에 올라온 DATA 받기
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("CustomInfo");

			if(info!=null) {	//로그인을 했을때

				String tel = info.getTel();

				if(daoB.checkLogData(tel)!=1) {	//로그인된 회원의 전화번호로 예약된 정보가 없으면

					url = cp + "/escm/main.do?msg=none";
					resp.sendRedirect(url);

				}else {	//로그인된 회원의 전화번호로 예약된 정보가 있으면

					YeYakDTO dto = daoB.getReadLogData(tel);

					req.setAttribute("ye_num", dto.getYe_num());
					req.setAttribute("ye_name", dto.getYe_name());
					req.setAttribute("ye_tel", dto.getYe_tel());
					req.setAttribute("the_num", dto.getThe_num());
					req.setAttribute("the_name", dto.getThe_name());
					req.setAttribute("inwon", dto.getInwon());
					req.setAttribute("ye_price", dto.getYe_price());
					req.setAttribute("ye_date", dto.getYe_date());
					req.setAttribute("ye_time", dto.getYe_time());
					
					url = "/Book_ck.jsp";	//바로 예약 정보 띄우는 창으로 보내기
					forward(req, resp, url);
					
				}

			}else {	//로그인을 안했을때

				url = "/Book.jsp";	//예약 확인 창으로 보내기
				forward(req, resp, url);

			} 


//======================================================================================================================================
		}else if(uri.indexOf("book_ok.do")!=-1) {

			
			//Book.jsp 또는 bookmain_ok.do에서 넘어오는 DATA 받기
			String ye_tel = req.getParameter("ye_tel");
			String msg = req.getParameter("msg");
			
			if(msg!=null) {	//bookmain_ok.do에서 넘어온것 / 예약했는데 또 예약하려 할 때 / 중복예약 하려할때
				
				YeYakDTO dto = daoB.getReadLogData(ye_tel);

				req.setAttribute("ye_num", dto.getYe_num());
				req.setAttribute("ye_name", dto.getYe_name());
				req.setAttribute("ye_tel", dto.getYe_tel());
				req.setAttribute("the_num", dto.getThe_num());
				req.setAttribute("the_name", dto.getThe_name());
				req.setAttribute("inwon", dto.getInwon());
				req.setAttribute("ye_price", dto.getYe_price());
				req.setAttribute("ye_date", dto.getYe_date());
				req.setAttribute("ye_time", dto.getYe_time());
				req.setAttribute("msg", msg);	//중복예약 확인용

				url = "/Book_ck.jsp";	//바로 예약 정보 띄우는 창으로 보내기
				forward(req, resp, url);
				
			}else {	//Book.jsp에서 넘어온것 / 제대로 된 예약 / 중복예약 아닌것
				
				//Book.jsp에서 넘어온 DATA 받기
				int ye_num = Integer.parseInt(req.getParameter("ye_num"));
				String ye_name = req.getParameter("ye_name");
				
				if(daoB.checkLogData(ye_num,ye_name,ye_tel)!=1) {	//해당 전화번호로 예약된 정보가 없으면

					req.setAttribute("MSG", "예약정보가 일치하지 않습니다");

					url = "/Book.jsp";	//메세지와 함께 예약확인 창으로 보내기
					forward(req, resp, url);

				}else {	//해당 전화번호로 예약된 정보가 있으면

					YeYakDTO dto = daoB.getReadLogData(ye_tel);

					req.setAttribute("ye_num", dto.getYe_num());
					req.setAttribute("ye_name", dto.getYe_name());
					req.setAttribute("ye_tel", dto.getYe_tel());
					req.setAttribute("the_num", dto.getThe_num());
					req.setAttribute("the_name", dto.getThe_name());
					req.setAttribute("inwon", dto.getInwon());
					req.setAttribute("ye_price", dto.getYe_price());
					req.setAttribute("ye_date", dto.getYe_date());
					req.setAttribute("ye_time", dto.getYe_time());

					url = "/Book_ck.jsp";	//바로 예약 정보 띄우는 창으로 보내기
					forward(req, resp, url);

				}
				
			}
			
			
			

//======================================================================================================================================
		}else if(uri.indexOf("book_de.do")!=-1) {

			
			//Book.jsp에서 넘어온 DATA 받기
			String tel = req.getParameter("ye_tel");
			
			//Mypage.jsp에서 hidden으로 넘어온 check값 받기
			String check = req.getParameter("check");
			
			System.out.println("check : " + check);
	
			//예약 취소
			//이름으로 예약 정보 삭제
			daoB.deleteData(tel);
			
			//세션 생성, 세션에 올라져있는 DATA 받기
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("CustomInfo");
			
			if(info!=null) {//로그인이 되어있으면
	            
	            String the_num = req.getParameter("the_num");
	            
	            //마이페이지 테이블에서 DATA DELETE
	            mdao.myDeleteData(info.getId(),the_num);
	            
	         }
			
			if(check!=null) {	//마이페이지로 돌아가기 (마이페이지에서 예약삭제했을때)
				
				url = cp + "/esct/mypage.do?id=" + info.getId();
				resp.sendRedirect(url);
				
			}else {	//메인으로 돌아가기
				
				//REDIRECT
				url = cp + "/escm/main.do";
				resp.sendRedirect(url);
				
			}
			
			

			
			

//======================================================================================================================================
		}else if(uri.indexOf("searchBookNum.do")!=-1) {

			//포워딩
			url = "/SearchBookNum.jsp";
			forward(req, resp, url);

//======================================================================================================================================
		}else if(uri.indexOf("searchBookNum_ok.do")!=-1) {	


			//SearchBookNum.jsp에서 넘어오 DATA 받기
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");

			if(daoB.searchData(name,tel)!=1) {	//해당 전화번호로 예약된 정보가 없으면

				req.setAttribute("MSG", "예약정보가 없습니다");

				url = "/Book.jsp";
				forward(req, resp, url);

			}else {	//해당 전화번호로 예약된 정보가 있으면

				YeYakDTO dto = daoB.getReadLogData(tel);
				
				/*
				//필요 없음
				req.setAttribute("ye_num", dto.getYe_num());
				req.setAttribute("ye_name", dto.getYe_name());
				req.setAttribute("ye_tel", dto.getYe_tel());
				req.setAttribute("the_num", dto.getThe_num());
				req.setAttribute("the_name", dto.getThe_name());
				req.setAttribute("inwon", dto.getInwon());
				req.setAttribute("ye_price", dto.getYe_price());
				req.setAttribute("ye_date", dto.getYe_date());
				req.setAttribute("ye_time", dto.getYe_time());
				*/
				
				//조회한 예약번호 가지고 예약 확인창으로 보내기
				req.setAttribute("MSG", "예약번호는&nbsp; " + dto.getYe_num() + "번&nbsp; 입니다");

				url = "/Book.jsp";	
				forward(req, resp, url);
				
			}

			
//======================================================================================================================================
		}









	}
}
