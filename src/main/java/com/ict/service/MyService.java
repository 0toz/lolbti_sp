package com.ict.service;

import java.util.List;

import com.ict.vo.TVO;

public interface MyService {

	List<TVO> selectTVOList(int begin) throws Exception;
	//int insertTVO(TVO tvo) throws Exception;
	int giveID(int idx) throws Exception;
	
	
	
	
}
