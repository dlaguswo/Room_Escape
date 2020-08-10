package com.DTO;

public class YeYakDTO {//예약 완료된 정보
	
	private int ye_num;			// 예약 번호
	private String ye_name;		// 예약자 이름
	private String ye_tel;		// 예약자 번호
	private int the_num;		// 테마 번호(참조)
	private String the_name;	// 테마 이름
	private int inwon;			// 인원수
	private int ye_price;		// 예약 금액
	private String ye_date;		// 예약 날짜
	private String ye_time;		// 예약 시간
	
	public String getYe_time() {
		return ye_time;
	}
	public void setYe_time(String ye_time) {
		this.ye_time = ye_time;
	}
	public String getThe_name() {
		return the_name;
	}
	public void setThe_name(String the_name) {
		this.the_name = the_name;
	}
	
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	public int getYe_price() {
		return ye_price;
	}
	public void setYe_price(int ye_price) {
		this.ye_price = ye_price;
	}
	public int getYe_num() {
		return ye_num;
	}
	public void setYe_num(int ye_num) {
		this.ye_num = ye_num;
	}
	public String getYe_name() {
		return ye_name;
	}
	public void setYe_name(String ye_name) {
		this.ye_name = ye_name;
	}
	public String getYe_tel() {
		return ye_tel;
	}
	public void setYe_tel(String ye_tel) {
		this.ye_tel = ye_tel;
	}
	public int getThe_num() {
		return the_num;
	}
	public void setThe_num(int the_num) {
		this.the_num = the_num;
	}
	public String getYe_date() {
		return ye_date;
	}
	public void setYe_date(String ye_date) {
		this.ye_date = ye_date;
	}
	
	

}
