package com.ict.dao;

import java.util.List;

import com.ict.vo.TVO;

public interface MyDAO {
	
	/*
	 * SQL문 과 관련된 기능. 작은 기능으로 구현. 작게 구현된 기능을 가지고 서비스에서 활용되도록
	 * 
	 * insert, delete, select, get, getList, hit, count
	 * 
	 * 1. 문의 게시판 insert, delete, select, hit, count(한페이지에 표시될 수)
	 * 보드 참고.
	 * 
	 * 2. 테스트 원. insert(브라우저에 테스트 기록하다가 모든테스트가 끝나고 DB에 기록.) delete(구현안함.)
	 * 
	 * 			결과에대해 필요한 정보로 정렬된 결과정보를 select.
	 * 
	 * 
	 * 3. 회원가입 insert, delete, select (아이디 비밀번호찾기), update 회원정보수정
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	List<TVO> selectTVOList(int begin)throws Exception;
	
	int giveID(int idx)throws Exception;
	
}
