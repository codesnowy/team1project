package com.study.member.vo;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberVO {

	@NotBlank(message = "ID 입력은 필수입니다.")
	private String memId;                             /* 아이디 */
	
	@NotBlank(message = "비밀번호 입력은 필수입니다.")
	private String memPw;                             /* 비밀번호 */
	
	@NotBlank(message = "별명 입력은 필수입니다.")
	private String memName;                           /* 별명 */
	
	private String memBir;                           	/* 생일 */
	private String memGender;                         /* 성별 */
	
	@NotBlank(message = "핸드폰 번호 입력은 필수입니다.")
	private String memHp;                             /* 핸드폰 번호 */
	
	@NotBlank(message = "이메일 입력은 필수입니다.")
	private String memMail;                           /* 이메일 */
	
	private String memPro;                            /* 프로필이미지 */
	
	private String memAddr1;                          /* 우편번호 */
	private String memAddr2;                          /* 주소 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(
				this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public MemberVO() {}
	
	public MemberVO(String memId, String memPw, String memName, String memBir, String memGender, String memHp,
			String memMail, String memPro, String memAddr1, String memAddr2) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memBir = memBir;
		this.memGender = memGender;
		this.memHp = memHp;
		this.memMail = memMail;
		this.memPro = memPro;
		this.memAddr1 = memAddr1;
		this.memAddr2 = memAddr2;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemHp() {
		return memHp;
	}

	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}

	public String getMemMail() {
		return memMail;
	}

	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}

	public String getMemPro() {
		return memPro;
	}

	public void setMemPro(String memPro) {
		this.memPro = memPro;
	}

	public String getMemBir() {
		return memBir;
	}

	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String getMemAddr1() {
		return memAddr1;
	}

	public void setMemAddr1(String memAddr1) {
		this.memAddr1 = memAddr1;
	}

	public String getMemAddr2() {
		return memAddr2;
	}

	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}
	
	
	
}
