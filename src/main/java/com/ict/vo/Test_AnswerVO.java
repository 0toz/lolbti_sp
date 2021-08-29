package com.ict.vo;

public class Test_AnswerVO {
	/*
	 *exm_num number, 문제번호
	 *test_name varchar2(40), 테스트 이름
	 * imp number, 중요도
	 * answer number, 답안
	

		pi varchar2(20),
		exm_num number,
		test_name varchar2(40),
		imp number,
		answer number,
*/
	
	private String pi, exm_num, test_name, imp, answer;

	
	
	public String getPi() {
		return pi;
	}

	public void setPi(String pi) {
		this.pi = pi;
	}

	public String getExm_num() {
		return exm_num;
	}

	public void setExm_num(String exm_num) {
		this.exm_num = exm_num;
	}

	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

	public String getImp() {
		return imp;
	}

	public void setImp(String imp) {
		this.imp = imp;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
	
}
