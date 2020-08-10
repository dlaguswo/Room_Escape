package com.DTO;

public class MypageDTO {//마이페이지
	
	private int my_num;		//인덱스
	private String id;		//아이디
	private int the_num;	//테마 번호
	private int wish_play;	//찜(0) 또는 기록(1)
	

	public int getMy_num() {
		return my_num;
	}
	public void setMy_num(int my_num) {
		this.my_num = my_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getThe_num() {
		return the_num;
	}
	public void setThe_num(int the_num) {
		this.the_num = the_num;
	}
	public int getWish_play() {
		return wish_play;
	}
	public void setWish_play(int wish_play) {
		this.wish_play = wish_play;
	}
	
}
