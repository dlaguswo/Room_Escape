package com.Controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CommDAO;
import com.DAO.PostDAO;
import com.DTO.CommDTO;
import com.DTO.PostDTO;
import com.Util.CustomInfo;
import com.Util.DBCPConn;
import com.Util.FileManager;
import com.Util.MyUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String cp = request.getContextPath();

		Connection conn = DBCPConn.getConnection();
		PostDAO dao = new PostDAO(conn);
		CommDAO daoc = new CommDAO(conn);
		MyUtil util = new MyUtil();

		String uri = request.getRequestURI();
		String url = "";

		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "imageData";
		String imagePath = cp + "/imageData";

		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}


//======================================================================================================================================
		if(uri.indexOf("postList.do") != -1) {
			
			//PostList.jsp에서 넘어오는 pageNum받기
			String pageNum = request.getParameter("pageNum");

			int currentPage = 1;
			if(pageNum != null) {	//처음 실행이 아니면
				currentPage = Integer.parseInt(pageNum);
			} else {	//처음 실행이면
				pageNum = "1";
			}

			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");

			if(searchValue != null){	//	검색
				
				if(request.getMethod().equalsIgnoreCase("get")){ // GET 방식으로 데이터 전송시
					searchValue = URLDecoder.decode(searchValue, "UTF-8"); // searchValue의 한글 깨짐을 방지하기 위해 URLDecoder.decode로 decode
				}
				
			} else { // 검색 안함 	
				
				searchKey = "total";
				searchValue = "";
				
			}

			int dataCount = dao.getDataCount(searchKey, searchValue); // 게시물 개수
			int numPerPage = 10; // 한 페이지당 게시물 10개
			int totalPage = util.getPageCount(numPerPage, dataCount); // 전체 페이지

			//마지막 페이지 지워지는거 방지
			if(currentPage > totalPage) {
				currentPage = totalPage;
			}

			//가져올 DATA의 시작과 끝 번호 세팅
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			//뿌려줄 데이터 가져와서 lists에 담기
			List<PostDTO> lists = dao.getLists(start, end, searchKey, searchValue);

			// 검색(기능을 사용할 경우 get방식의 주소에 추가로 적용) -> ?searchKey=key값&searchValue=value값			
			String param = "";
			
			if(!searchValue.equals("")){ 	
				param = "?searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			// 글 내용 보기 주소 정리
			String articleUrl = cp + "/escp/postArticle.do";
			
			if(param.equals("")){ // 검색 안함
				articleUrl += "?pageNum=" + currentPage;
			} else{ // 검색 실행
				articleUrl += param + "&pageNum=" + currentPage;
				System.out.println(articleUrl);
			}

			// 페이징 처리
			String listUrl = "postList.do" + param;	
			String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);

			// 포워딩할 데이터
			request.setAttribute("lists", lists);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("articleUrl", articleUrl);
			request.setAttribute("pageIndexList", pageIndexList);
			request.setAttribute("dataCount", dataCount);

			//포워딩
			url = "/PostList.jsp";
			forward(request, response, url);


//======================================================================================================================================
		} else if(uri.indexOf("postArticle.do") != -1) {
			
			//PostList.jsp에서 넘어오는 DATA 받기
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");

			// 검색
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");

			
			if(searchValue != null){ // 검색 결과가 있음 
				
				if(request.getMethod().equalsIgnoreCase("get")){ // GET 방식으로 데이터 전송시
					searchValue = URLDecoder.decode(searchValue, "UTF-8"); // searchValue의 한글 깨짐을 방지하기 위해 URLDecoder.decode로 decode
				}
				
			} else { // 검색 안함 	
				
				searchKey = "total";
				searchValue = "";
				
			}

			String param = "pageNum=" + pageNum;
			if(!searchValue.equals("")){ 	
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			// 조회수 업데이트
			Cookie[] cookieFromRequest = request.getCookies();
			HttpSession session = request.getSession();
			String cookieValue = null;
			for(int i = 0 ; i<cookieFromRequest.length; i++) {
				// 요청정보로부터 쿠키를 가져온다.
				cookieValue = cookieFromRequest[0].getValue();	// 테스트라서 추가 데이터나 보안사항은 고려하지 않으므로 1번째 쿠키만 가져옴	
			}

			// 쿠키 세션 입력
			if (session.getAttribute(num +":cookie") == null) {
				
				session.setAttribute(num +":cookie", num + ":" + cookieValue);
				
			} else {
				
				session.setAttribute(num +":cookie ex", session.getAttribute(num +":cookie"));
				
				if (!session.getAttribute(num +":cookie").equals(num  + ":" + cookieValue)) {
					session.setAttribute(num +":cookie", num  + ":" + cookieValue);
				}
				
			}

			// 조회수 카운트
			if (!session.getAttribute(num +":cookie").equals(session.getAttribute(num +":cookie ex"))) {
				dao.updateCount(num);
			}
			
			PostDTO dto = dao.getReadData(num);
			
			if(dto == null) {
				url = cp + "/escp/list.do";
				response.sendRedirect(url);
			}
			
			dto.setBo_content(dto.getBo_content().replaceAll("\n", "<br>"));	
			
			List<CommDTO> lists = daoc.getLists(num);
			
			request.setAttribute("dto", dto);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("imagePath", imagePath);
			request.setAttribute("params", param);
			request.setAttribute("lists", lists);
			
			url = "/PostArticle.jsp";
			forward(request, response, url);

//======================================================================================================================================
		} else if(uri.indexOf("postWrite.do") != -1) {
			
			url = "/PostWrite.jsp";
			forward(request, response, url);

//======================================================================================================================================
		} else if(uri.indexOf("postWrite_ok.do") != -1) {
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload") != null) {
				
				PostDTO dto = new PostDTO();
				dto.setBo_num(dao.getMaxNum() + 1);
				dto.setId(mr.getParameter("id"));
				dto.setBo_subject(mr.getParameter("bo_subject"));
				dto.setBo_content(mr.getParameter("bo_content"));
				dto.setBo_imagename(mr.getFilesystemName("upload"));				
				dao.insertData(dto);
				
			} else {
				
				PostDTO dto = new PostDTO();
				dto.setBo_num(dao.getMaxNum() + 1);
				dto.setId(mr.getParameter("id"));
				dto.setBo_subject(mr.getParameter("bo_subject"));
				dto.setBo_content(mr.getParameter("bo_content"));
				dto.setBo_imagename("");				
				dao.insertData(dto);
				
			}
			
			url = "/escp/postList.do";
			forward(request, response, url);

//======================================================================================================================================
		} else if(uri.indexOf("postUpdate.do") != -1) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");

			// 검색 
			if(searchValue != null){ 
				if(request.getMethod().equalsIgnoreCase("get")){ // GET 방식으로 데이터 전송시
					searchValue = URLDecoder.decode(searchValue, "UTF-8"); // searchValue의 한글 깨짐을 방지하기 위해 URLDecoder.decode로 decode
				}
			} else { // 검색 안함 	
				searchKey = "total";
				searchValue = "";
			}

			PostDTO dto = dao.getReadData(num);

			String params = "pageNum=" + pageNum;
			if(!searchValue.equals("")) {
				params = "&searchKey=" + searchKey;
				params += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			request.setAttribute("dto", dto);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("searchKey", searchKey);
			request.setAttribute("searchValue", searchValue);
			request.setAttribute("params", params);
			request.setAttribute("imagePath", imagePath);
			url = "/PostUpdate.jsp";
			forward(request, response, url);

//======================================================================================================================================
		} else if(uri.indexOf("postUpdate_ok.do") != -1) {
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;			
			MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload") != null) { // 파일 업로드가 있을 때
				
				if(mr.getParameter("exist_upload") != null) {
					FileManager.doFileDelete(mr.getParameter("exist_upload"), path);
				}
				
				PostDTO dto = new PostDTO();
				dto.setId(mr.getParameter("id"));
				dto.setBo_subject(mr.getParameter("bo_subject"));
				dto.setBo_content(mr.getParameter("bo_content"));
				dto.setBo_imagename(mr.getFilesystemName("upload"));
				dto.setBo_num(Integer.parseInt(mr.getParameter("num")));
				dao.updateData(dto);

			} else { // 파일 업로드가 없을 때 
				
				if(mr.getParameter("exist_upload") != null) { // 기존 이미지 파일이 존재
					System.out.println("1번:" + mr.getParameter("exist_upload"));
					PostDTO dto = new PostDTO();
					dto.setId(mr.getParameter("id"));
					dto.setBo_subject(mr.getParameter("bo_subject"));
					dto.setBo_content(mr.getParameter("bo_content"));
					dto.setBo_imagename(mr.getParameter("exist_upload"));				
					dto.setBo_num(Integer.parseInt(mr.getParameter("num")));
					dao.updateData(dto);		
				} else { // 기존 이미지 파일이 존재하지 않음
					System.out.println("2번:" + mr.getParameter("exist_upload"));
					PostDTO dto = new PostDTO();
					dto.setId(mr.getParameter("id"));
					dto.setBo_subject(mr.getParameter("bo_subject"));
					dto.setBo_content(mr.getParameter("bo_content"));
					dto.setBo_imagename("");				
					dto.setBo_num(Integer.parseInt(mr.getParameter("num")));
					dao.updateData(dto);		
				}
				
			}
			
			String pageNum = mr.getParameter("pageNum");
			String searchKey = mr.getParameter("searchKey");
			String searchValue = mr.getParameter("searchValue");
			String params = "pageNum=" + pageNum;
			
			if(!searchValue.equals("")) {
				params = "&searchKey=" + searchKey;
				params += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			url = cp + "/escp/postList.do?" + params;
			response.sendRedirect(url);

//======================================================================================================================================
		} else if(uri.indexOf("postDelete.do") != -1) {
			
			
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			PostDTO dto = dao.getReadData(num);
			FileManager.doFileDelete(dto.getBo_imagename(), path);
			
			dao.deleteData(num);

			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");

			// 검색 
			if(searchValue != null){ 
				
				if(request.getMethod().equalsIgnoreCase("get")){ // GET 방식으로 데이터 전송시
					searchValue = URLDecoder.decode(searchValue, "UTF-8"); // searchValue의 한글 깨짐을 방지하기 위해 URLDecoder.decode로 decode
				}
				
			} else { // 검색 안함 	
				
				searchKey = "total";
				searchValue = "";
				
			}

			String params = "pageNum=" + pageNum;
			
			if(!searchValue.equals("")) {
				params = "&searchKey=" + searchKey;
				params += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			url = cp + "/escp/postList.do?" + params;
			response.sendRedirect(url);

//======================================================================================================================================
		} else if(uri.indexOf("comment.do") != -1) {
			
			CommDTO dto = new CommDTO();
			
			dto.setCo_num(daoc.getMaxNum() + 1);
			dto.setBo_num(Integer.parseInt(request.getParameter("bo_num")));
			dto.setId(request.getParameter("id"));
			dto.setCo_content(request.getParameter("comment_box"));
			
			daoc.insertData(dto);
			
			String pageNum = request.getParameter("pageNum");
			String bo_num = request.getParameter("bo_num");
			String params = "pageNum=" +  pageNum + "&num=" + bo_num;
			
			url = "/escp/postArticle.do?" + params;
			
			forward(request, response, url);

//======================================================================================================================================
		} else if(uri.indexOf("comment_delete.do") != -1) { 
			
			int bo_num = Integer.parseInt(request.getParameter("num"));
			int co_num = Integer.parseInt(request.getParameter("co_num"));
			String pageNum = request.getParameter("pageNum");
			
			String params = "pageNum=" +  pageNum + "&num=" + bo_num;
			
			daoc.deleteData(co_num);
			
			url = "/escp/postArticle.do?" + params;
			forward(request, response, url);

//======================================================================================================================================
		}








	}

}
