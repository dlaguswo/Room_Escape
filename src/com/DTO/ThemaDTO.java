package com.DTO;

public class ThemaDTO {//테마 정보
	
	private int the_num;			// 테마 번호
	private String the_name;		// 테마 이름
	private int cafe_num;			// 카페 번호(참조)
	private String cafe_name;		// 카페 이름
	private String the_level;		// 난이도
	private int cate_num;			// 카테고리 번호(참조)
	private String playtime;		// 플레이시간
	private int price;				// 가격
	private double star;			// 평점
	private String imagefilename;	// 이미지파일
	private String the_story;
	
	
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
	public int getCafe_num() {
		return cafe_num;
	}
	public void setCafe_num(int cafe_num) {
		this.cafe_num = cafe_num;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getThe_level() {
		return the_level;
	}
	public void setThe_level(String the_level) {
		this.the_level = the_level;
	}
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getPlaytime() {
		return playtime;
	}
	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getImagefilename() {
		return imagefilename;
	}
	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}
	public String getThe_story() {
		return the_story;
	}
	public void setThe_story(String the_story) {
		this.the_story = the_story;
	}
	
	
	
	
	
	

}
