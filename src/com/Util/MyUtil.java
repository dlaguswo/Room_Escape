package com.Util;

public class MyUtil {
	
	
	//전체 페이지 수 구하기
	//numPerPage : 한 페이지에 표시할 데이터 갯수
	//dataCount : 전체 데이터 갯수
	public int getPageCount(int numPerPage, int dataCount) {
		
		int totalPage = 0;
		
		totalPage = dataCount / numPerPage;
		
		if(dataCount%numPerPage != 0) {
			totalPage++;
		}
		
		return totalPage;
		
	}
	
	
	//페이징 처리
	//currentPage : 현재 표시할 페이지
	//totalPage : 전체 페이지 수
	//listUrl : 링크를 설정할 url (list.jsp)
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5;
		int currentPageSetup; //◀이전(표시할 첫 페이지-1)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)
			return "";
		
		//list.jsp
		//list.jsp?searchKey="name"&searchValue="배수지"
		if(listUrl.indexOf("?")!=-1) {	//넘어오는 listUrl에 ?가 있으면
			listUrl = listUrl + "&";
		}else {
			listUrl = listUrl + "?";
		}
		
		
		//◀이전 얘가 미리 가지고 있는 값 세팅
		//0또는 5의배수
		//0 : 1~5페이지 / 5 : 6~10페이지 / 10 : 11~15페이지 / 15 : 16~20페이지
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		 
		if(currentPage%numPerBlock == 0) {	//5의 배수인 페이지는 5씩 빼주어야 함
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		
		//◀이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
							// \" : 역슬러쉬 뒤에오는 따옴표는 진짜 따옴표가 아니라 문자다~	
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
			
		}
		
		
		//바로가기 페이지 / 6 7 8 9 10
		page = currentPageSetup + 1;
		
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock)) {
			
			if(page==currentPage) {
				
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color="Fuchsia">6</font>&nbsp;
				
			}else {
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				///<a href="list.jsp?pageNum=7">7</a>&nbsp;
			}
			
			page++;
			
		}
		
		
		//다음▶
		if(totalPage - currentPageSetup > numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">다음▶</a>&nbsp;
			
		}
		
		return sb.toString();
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
