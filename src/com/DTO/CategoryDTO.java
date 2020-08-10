package com.DTO;

public class CategoryDTO {//테마 카테고리(장르)
	
	private int cate_num;			// 카테고리 번호
	private String cate_name;		// 카테고리 이름
	
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	

}
