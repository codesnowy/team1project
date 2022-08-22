package com.study.funding.vo;

import com.study.common.vo.PagingVO;

public class FundingSerchVO extends PagingVO{
	
	private String searchType;
	private String searchWord;
	private String searchCategory;
	private String searchSite;
	private String arraryType;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	
	public String getSearchSite() {
		return searchSite;
	}
	public void setSearchSite(String searchSite) {
		this.searchSite = searchSite;
	}
	
	public String getArraryType() {
		return arraryType;
	}
	public void setArraryType(String arraryType) {
		this.arraryType = arraryType;
	}
	
}