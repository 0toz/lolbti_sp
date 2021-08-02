package com.ict.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;

@Service
public class MyserviceImpl implements MyService {

	@Autowired
	private MyDAO myDAO;

	@Override
	public List<TVO> selectTVOList(int begin, int end) throws Exception {
		return myDAO.selectTVOLIst(begin, end);
	}
	
	
}
