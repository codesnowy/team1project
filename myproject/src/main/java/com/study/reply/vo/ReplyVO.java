package com.study.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReplyVO {
	
	private int reNo;                                 /* 리플 번호 */
	private int reParentNo;                           /* 글 번호 */
	private String reMemId;                           /* 댓글주 */
	private String reContent;                         /* 댓글 내용 */
	private String reRegdata;                         /* 쓴 날짜 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(
				this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public ReplyVO() {}

	public ReplyVO(int reNo, int reParentNo, String reMemId, String reContent, String reRegdata) {
		super();
		this.reNo = reNo;
		this.reParentNo = reParentNo;
		this.reMemId = reMemId;
		this.reContent = reContent;
		this.reRegdata = reRegdata;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public int getReParentNo() {
		return reParentNo;
	}

	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}

	public String getReMemId() {
		return reMemId;
	}

	public void setReMemId(String reMemId) {
		this.reMemId = reMemId;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReRegdata() {
		return reRegdata;
	}

	public void setReRegdata(String reRegdata) {
		this.reRegdata = reRegdata;
	}
}
