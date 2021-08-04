package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;
import com.ict.vo.TVO;

@Service
public class MyserviceImpl implements MyService {

	@Autowired
	private MyDAO myDAO;

	
	
	@Override
	public List<TVO> selectTVOList(int begin) throws Exception {
		return myDAO.selectTVOList(begin);
	}
	
	
}
