package com.DTO;

public class ReviewDTO {//리뷰게시판

	private int re_num; 						// 리뷰 번호
	private int the_num; 						// 테마 번호
	private String the_name;					// 테마 이름
	private String id; 							// 작성자
	private String review_content; 				// 후기 내용
	private String review_rated_difficulty; 	// 난이도
	private String review_rated_success; 		// 성공 여부
	private String re_created; 					// 작성일
	private String review_rated_star; 			// 별점

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public int getThe_num() {
		return the_num;
	}

	public void setThe_num(int the_num) {
		this.the_num = the_num;
	}

	public String getThe_name() {
		return the_name;
	}

	public void setThe_name(String the_name) {
		this.the_name = the_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_rated_difficulty() {
		return review_rated_difficulty;
	}

	public void setReview_rated_difficulty(String review_rated_difficulty) {
		this.review_rated_difficulty = review_rated_difficulty;
	}

	public String getReview_rated_success() {
		return review_rated_success;
	}

	public void setReview_rated_success(String review_rated_success) {
		this.review_rated_success = review_rated_success;
	}

	public String getRe_created() {
		return re_created;
	}

	public void setRe_created(String re_created) {
		this.re_created = re_created;
	}

	public String getReview_rated_star() {
		return review_rated_star;
	}

	public void setReview_rated_star(String review_rated_star) {
		this.review_rated_star = review_rated_star;
	}

}
