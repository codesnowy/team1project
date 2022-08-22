package com.study.board;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BoardVO {
	
	private int boNo;                                 /* 글 번호 */
	private String boTitle;                           /* 글 제목 */
	private String boCate;                            /* 글 분류 코드 */
	private String boMemId;                           /* 글쓴이 */
	private String boContent;                         /* 글 내용 */
	private int boHit;                                /* 조회수 */
	private String boRegDate;                         /* 등록 일자 */
	private String boModDate;                         /* 수정 일자 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(
				this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public BoardVO() {}

	public BoardVO(int boNo, String boTitle, String boCate, String boMemId, String boContent, int boHit,
			String boRegDate, String boModDate) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boCate = boCate;
		this.boMemId = boMemId;
		this.boContent = boContent;
		this.boHit = boHit;
		this.boRegDate = boRegDate;
		this.boModDate = boModDate;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoCate() {
		return boCate;
	}

	public void setBoCate(String boCate) {
		this.boCate = boCate;
	}

	public String getBoMemId() {
		return boMemId;
	}

	public void setBoMemId(String boMemId) {
		this.boMemId = boMemId;
	}

	public String getBoContent() {
		return boContent;
	}

	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}

	public int getBoHit() {
		return boHit;
	}

	public void setBoHit(int boHit) {
		this.boHit = boHit;
	}

	public String getBoRegDate() {
		return boRegDate;
	}

	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}

	public String getBoModDate() {
		return boModDate;
	}

	public void setBoModDate(String boModDate) {
		this.boModDate = boModDate;
	}
	
	

}
