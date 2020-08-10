package com.DTO;

public class PostDTO {// 자유게시판

	private int bo_num; 			// 게시물 번호
	private String id; 				// 작성자 아이디
	private String bo_subject; 		// 제목
	private String bo_content;	 	// 내용
	private String bo_imagename; 	// 이미지 
	private String bo_created; 		// 작성일
	private int hit; 				// 조회수
	private int cnt; 				// 댓글 수

	public int getBo_num() {
		return bo_num;
	}

	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBo_subject() {
		return bo_subject;
	}

	public void setBo_subject(String bo_subject) {
		this.bo_subject = bo_subject;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public String getBo_imagename() {
		return bo_imagename;
	}

	public void setBo_imagename(String bo_imagename) {
		this.bo_imagename = bo_imagename;
	}

	public String getBo_created() {
		return bo_created;
	}

	public void setBo_created(String bo_created) {
		this.bo_created = bo_created;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


}
