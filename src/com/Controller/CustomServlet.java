package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAO;
import com.DAO.CustomDAO;
import com.DAO.MypageDAO;
import com.DTO.CustomDTO;
import com.DTO.YeYakDTO;
import com.Util.CustomInfo;
import com.Util.DBCPConn;

public class CustomServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn =DBCPConn.getConnection();
	    CustomDAO dao = new CustomDAO(conn);
	    BookDAO bdao = new BookDAO(conn);
	    MypageDAO mdao = new MypageDAO(conn);

		String uri = req.getRequestURI();
		String url;

		
//======================================================================================================================================
		if(uri.indexOf("Login.do")!=-1) {

			//Thema.jsp에서 넘어온 DATA 받기
			//댓글 입력시 로그인 화면으로 넘어오니까
			String the_num = req.getParameter("the_num");
			req.setAttribute("the_num", the_num);
			
			//PostList.jsp에서 넘어온 DATA 받기
			//자유게시판에서 글쓰기 누르면 로그인으로 넘어오니까
			String cpage = req.getParameter("cpage");
			req.setAttribute("cpage", cpage);
			
			//포워딩
			url="/Login.jsp";
			forward(req, resp, url);

			
//======================================================================================================================================
		}else if(uri.indexOf("Login_ok.do")!=-1){

			
			//Login.jsp에서 넘어온 DATA 받기
			String id= req.getParameter("id");
			String pwd = req.getParameter("pwd");

			//해당 아이디로 회원정보 가져오기
			CustomDTO dto = dao.getReadData(id);

			//회원정보가 없거나 패스워드가 틀리면
			if(dto==null||!dto.getPwd().equals(pwd)) {

				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요");

				url = "/Login.jsp";	//메세지와 함께 로그인창으로 보내기
				forward(req, resp, url);
				return;	

			}
			
			//세션 생성
			HttpSession session = req.getSession();

			//세션에 올릴 DATA(로그인된 회원정보) 세팅
			CustomInfo info = new CustomInfo();

			info.setId(dto.getId());
			info.setName(dto.getName());
			info.setTel(dto.getTel());
			
			//세션에 DATA(로그인된 회원정보) 올리기
			session.setAttribute("CustomInfo", info);

			if(req.getParameter("the_num")!=null) {	//테마 아티클에서 댓글입력 -> 로그인으로 넘어온경우
				
				String the_num = req.getParameter("the_num");
				
				url = cp + "/esct/thema.do?the_num=" + the_num;
				resp.sendRedirect(url);
				
			}else if(req.getParameter("cpage")!=null ){	//자유게시판 리스트에서 글쓰기 -> 로그인으로 넘어온경우
				
				url = cp + "/escp/postList.do";
				resp.sendRedirect(url);	
				
			}else {
			
			url = cp+"/escm/main.do";
			resp.sendRedirect(url);
			
			}
			

			
//======================================================================================================================================
		}else if(uri.indexOf("find.do")!=-1) {
			
			url ="/find.jsp";
			forward(req, resp, url);
			
//======================================================================================================================================
		}else if(uri.indexOf("find_ok.do")!=-1) {

			
			//find.jsp에서 넘어온 DATA 받기
			String id = req.getParameter("id");
			String tel = req.getParameter("tel");

			//해당 아이디로 회원정보 가져오기
			CustomDTO dto = dao.getReadData(id);
			
			//회원정보가 없거나 전화번호가 틀리면
			if(dto==null||!dto.getTel().equals(tel)) {

				req.setAttribute("message", "아이디 또는 전화번호를 정확히 입력하세요");

				url = "/find.jsp";	//메세지와 함께 비밀번호찾기 창으로 보내기
				forward(req, resp, url);
				return;
				
			}
			
			//조회한 비밀번호 가지고 로그인 창으로 보내기
			req.setAttribute("message", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호는 [&nbsp;" + dto.getPwd() +"&nbsp;] 입니다");

			url = "/Login.jsp";
			forward(req, resp, url);
			
			
//======================================================================================================================================
		}else if(uri.indexOf("Logout.do")!=-1) {
			
			//세션 생성, 세션에 올려져 있는 DATA 지우기
			HttpSession session = req.getSession();
			session.removeAttribute("CustomInfo");
			session.invalidate();

			//REDIRECT
			url = cp + "/escm/main.do";
			resp.sendRedirect(url);
			
			
//======================================================================================================================================
		}else if(uri.indexOf("customJoin.do")!=-1){

			url = "/Join.jsp";
			forward(req, resp, url);

//======================================================================================================================================
		}else if(uri.indexOf("customJoin_ok.do")!=-1) {

			
			//Join.jsp에서 넘어온 DATA 받아서 세팅하기
			CustomDTO dto = new CustomDTO();

			dto.setId(req.getParameter("id"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setName(req.getParameter("name"));
			dto.setBirth(req.getParameter("birth"));
			dto.setTel(req.getParameter("tel"));
			dto.setGender(req.getParameter("gender"));

			//세팅된 정보 회원 테이블에 INSERT
			int result = dao.insertData(dto);
			
			if(result!=0) {	//회원가입 성공
				
				//REDIRECT
				url = cp + "/escm/main.do";
				resp.sendRedirect(url);
				
			}else {	//회원가입 실패
				
				req.setAttribute("MSG", "이미 등록되어 있습니다.");
				
				url = "/Join.jsp";
				forward(req, resp, url);
				
			}

			


//======================================================================================================================================
		}else if(uri.indexOf("updated.do")!=-1) {


			//세션 생성, 세션에 올려져 있는 DATA 받기
			HttpSession session = req.getSession();
			CustomInfo info =(CustomInfo)session.getAttribute("CustomInfo");

			/*
			//필요없음
			if(info==null) {	//로그인 되어있지 않으면

				url = "/Join.jsp";
				forward(req, resp, url);
				return;
				
			}
			*/
			
			//로그인 되어있는 아이디로 회원정보 가져오기
			CustomDTO dto = dao.getReadData(info.getId());

			//회원정보 가지고 회원정보 수정 창으로 보내기
			req.setAttribute("dto", dto);

			url = "/updated.jsp";
			forward(req, resp, url);


//======================================================================================================================================
		}else if(uri.indexOf("updated_ok.do")!=-1) {

			
			//세션 생성, 세션에 올려져 있는 DATA 받기
			HttpSession session = req.getSession();
			CustomInfo info =(CustomInfo)session.getAttribute("CustomInfo");

			//updated.jsp에서 넘어온 DATA(수정할 회원정보) 받아서 세팅하기
			CustomDTO dto = new CustomDTO();
			
			dto.setPwd(req.getParameter("pwd"));
			dto.setName(req.getParameter("name"));
			dto.setBirth(req.getParameter("birth"));
			dto.setGender(req.getParameter("gender"));
			dto.setTel(req.getParameter("tel"));
			dto.setId(req.getParameter("id"));			

			//로그인 된 해당 아이디의 회원 정보 수정 (CUSTOM 테이블에서)
			dao.updateData(dto, info.getId());

			//=============================================
			//회원정보 수정시 세션 다시 세팅
			
			//세션 생성, 세션에 올려져 있는 DATA 지우기
			session.removeAttribute("CustomInfo");
			session.invalidate();
			HttpSession session1 = req.getSession();
			
			//세션에 올릴 DATA(로그인된 회원정보) 세팅
			CustomInfo info1 = new CustomInfo();
			info1.setId(dto.getId());
			info1.setName(dto.getName());
			info1.setTel(dto.getTel());
			
			//세션에 DATA(로그인된 회원정보) 올리기
			session1.setAttribute("CustomInfo", info1);
			//=============================================

			//REDIRECT
			url = cp + "/escm/main.do";
			resp.sendRedirect(url);
		
			
//======================================================================================================================================
		}else if(uri.indexOf("deleteId.do")!=-1){
	         
	         HttpSession session = req.getSession();
	         CustomInfo info = (CustomInfo) session.getAttribute("CustomInfo");
	         
	         int result = bdao.checkLogData(info.getTel());
	         
	         
	         if(result==1){	//해당 아이디로 예약된 정보가 있으면
	        	 
	        	YeYakDTO dto = bdao.getReadLogData(info.getTel());

				req.setAttribute("ye_num", dto.getYe_num());
				req.setAttribute("ye_name", dto.getYe_name());
				req.setAttribute("ye_tel", dto.getYe_tel());
				req.setAttribute("the_num", dto.getThe_num());
				req.setAttribute("the_name", dto.getThe_name());
				req.setAttribute("inwon", dto.getInwon());
				req.setAttribute("ye_price", dto.getYe_price());
				req.setAttribute("ye_date", dto.getYe_date());
				req.setAttribute("ye_time", dto.getYe_time());
	            req.setAttribute("msg1", 1);
	            
	            url = "/Book_ck.jsp";
	            forward(req, resp, url);
	            
	         }else {	//해당 아이디로 예약된 정보가 없으면

	         mdao.myAllDeleteData(info.getId()); //마이페이지에 기록 전체 삭제
	         dao.deleteData(info.getId());//회원 삭제
	        
	         //세션에 올라와있는 DATA 삭제
	         session.removeAttribute("CustomInfo");
			 session.invalidate();
	         
	         url = cp + "/Index.jsp";
	         resp.sendRedirect(url);
	         
	         }
	       
	         
//======================================================================================================================================
		}

		
		
		
	}


}



