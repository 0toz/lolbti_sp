package com.ict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.TVO;

@Repository
public class MyDAOImpl implements MyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<TVO> selectTVOList(int begin) throws Exception {
		
		
		
		return sqlSessionTemplate.selectList("list" );
	}
	
	@Override
	public int giveID(int idx) throws Exception {
		
		return sqlSessionTemplate.giveId("idx");
	}
}
