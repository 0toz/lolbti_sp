package com.ict.vo;

public class TVO {
	/*
	 * idx 식별번호 프라이머리키 용도.
	 *  ip 사용자 식별용 ip주소.
	 *  exm_num 문제 번호.
	 *  ans 문제에대한 답.
	 *  regdate 답변일.
	 */
	private String idx, ip, exm_num, ans, regdate;

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getExm_num() {
		return exm_num;
	}

	public void setExm_num(String exm_num) {
		this.exm_num = exm_num;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
