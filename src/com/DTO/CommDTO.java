package com.DTO;

public class CommDTO {//리뷰게시판

	private int co_num; 		// 댓글 번호
	private int bo_num; 		// 게시물 번호
	private String id; 			// 아이디
	private String co_content; 	// 댓글 내용
	private String co_created; 	// 댓글 작성 날짜

	public int getCo_num() {
		return co_num;
	}

	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}

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

	public String getCo_content() {
		return co_content;
	}

	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}

	public String getCo_created() {
		return co_created;
	}

	public void setCo_created(String co_created) {
		this.co_created = co_created;
	}

}
