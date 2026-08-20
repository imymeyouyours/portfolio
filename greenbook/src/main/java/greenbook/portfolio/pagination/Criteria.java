package greenbook.portfolio.pagination;

import lombok.Data;

@Data
public class Criteria {
	//현재 페이지
	private int page; 
	//한 페이지 당 컨텐츠 갯수
	private int perPageNum;
	
	private int type;
	private String search;
	private String re_catagory;
	private String sort;
	private String country;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.search = "";
		this.type = 0;
		re_catagory = "";
		sort = "basic";
		country = "";
	}
	
	/* 쿼리문에서 limit에 사용되는 인덱스를 계산하는 getter */
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
}