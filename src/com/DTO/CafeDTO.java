package com.DTO;

public class CafeDTO {//방탈출 카페
	
	private int cafe_num;			// 카페 번호
	private String cafe_name;		// 카페 이름
	private String addr;			// 카페 주소
	private String cafe_tel;		// 카페 연락처
	private String region;			// 지역
	
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCafe_tel() {
		return cafe_tel;
	}
	public void setCafe_tel(String cafe_tel) {
		this.cafe_tel = cafe_tel;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	

}
