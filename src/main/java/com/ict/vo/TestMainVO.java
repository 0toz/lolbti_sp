package com.ict.vo;

import org.springframework.web.multipart.MultipartFile;

public class TestMainVO {
	private String test_name, file_name, desc;
	private MultipartFile f_name;

	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}


	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public MultipartFile getF_name() {
		return f_name;
	}

	public void setF_name(MultipartFile f_name) {
		this.f_name = f_name;
	}





}
