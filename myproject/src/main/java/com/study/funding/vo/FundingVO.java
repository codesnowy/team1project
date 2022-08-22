package com.study.funding.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class FundingVO {
	private int fuNo;                                 /* 펀드 번호 */
	private String fuSite;                            /* 게시된 사이트 */
	private String fuTitle;                           /* 제목 */
	private String fuCate;                            /* 카테고리 */
	private String fuEnter;                           /* 회사 이름 */
	private String fuImg;                             /* 사진 주소 */
	private String fuPercent;                         /* 달성퍼센트 */
	private String fuAmount;                          /* 총 달성량 */
	private String fuDday;                            /* 디데이 */
	private String fuUrl;                             /* 상세 주소 */
	private int fuLike;                               /* 좋아요 숫자 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(
				this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public FundingVO() {}


	public FundingVO(int fuNo, String fuSite, String fuTitle, String fuCate, String fuEnter, String fuImg,
			String fuPercent, String fuAmount, String fuDday, String fuUrl, int fuLike) {
		super();
		this.fuNo = fuNo;
		this.fuSite = fuSite;
		this.fuTitle = fuTitle;
		this.fuCate = fuCate;
		this.fuEnter = fuEnter;
		this.fuImg = fuImg;
		this.fuPercent = fuPercent;
		this.fuAmount = fuAmount;
		this.fuDday = fuDday;
		this.fuUrl = fuUrl;
		this.fuLike = fuLike;
	}

	public int getFuNo() {
		return fuNo;
	}

	public void setFuNo(int fuNo) {
		this.fuNo = fuNo;
	}

	public String getFuSite() {
		return fuSite;
	}

	public void setFuSite(String fuSite) {
		this.fuSite = fuSite;
	}

	public String getFuTitle() {
		return fuTitle;
	}

	public void setFuTitle(String fuTitle) {
		this.fuTitle = fuTitle;
	}

	public String getFuCate() {
		return fuCate;
	}

	public void setFuCate(String fuCate) {
		this.fuCate = fuCate;
	}

	public String getFuEnter() {
		return fuEnter;
	}

	public void setFuEnter(String fuEnter) {
		this.fuEnter = fuEnter;
	}

	public String getFuImg() {
		return fuImg;
	}

	public void setFuImg(String fuImg) {
		this.fuImg = fuImg;
	}

	public String getFuPercent() {
		return fuPercent;
	}

	public void setFuPercent(String fuPercent) {
		this.fuPercent = fuPercent;
	}

	public String getFuAmount() {
		return fuAmount;
	}

	public void setFuAmount(String fuAmount) {
		this.fuAmount = fuAmount;
	}

	public String getFuDday() {
		return fuDday;
	}

	public void setFuDday(String fuDday) {
		this.fuDday = fuDday;
	}

	public String getFuUrl() {
		return fuUrl;
	}

	public void setFuUrl(String fuUrl) {
		this.fuUrl = fuUrl;
	}

	public int getFuLike() {
		return fuLike;
	}

	public void setFuLike(int fuLike) {
		this.fuLike = fuLike;
	}
}
