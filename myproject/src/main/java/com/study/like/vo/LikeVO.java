package com.study.like.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class LikeVO {
	
	private int likeNo;                               
	private String memId;                             
	private int fuNo;         
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(
				this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public LikeVO() {}

	public LikeVO(int likeNo, String memId, int fuNo) {
		super();
		this.likeNo = likeNo;
		this.memId = memId;
		this.fuNo = fuNo;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getFuNo() {
		return fuNo;
	}

	public void setFuNo(int fuNo) {
		this.fuNo = fuNo;
	}
	
	

}
