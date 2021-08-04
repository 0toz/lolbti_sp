package com.ict.dao;

import java.util.List;

import com.ict.vo.TVO;

public interface MyDAO {
	
	
	List<TVO> selectTVOList(int begin)throws Exception;
	
	
	
}
