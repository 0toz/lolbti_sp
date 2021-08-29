package com.ict.service;

import java.util.List;
import java.util.Map;

import com.ict.vo.MVO;
import com.ict.vo.QVO;
import com.ict.vo.TestMainVO;
import com.ict.vo.TestVO;

public interface MyService {

	List<TestVO> selectTestList(String test_name) throws Exception;
	//int insertTVO(TVO tvo) throws Exception;
	
	int insertTest(TestVO testvo) throws Exception;
	
	int updateTest(TestVO testvo) throws Exception;
	
	
	int insertMainTest(TestMainVO testmainvo) throws Exception;
	
	int deleteTest(String test_name) throws Exception;
	
	
	
	
	
	
	int selectQVOCount() throws Exception;

	// 원글 리스트
	List<QVO> selectQVOList(int begin, int end) throws Exception;

	// 원글 삽입
	int InsertQVO(QVO qvo) throws Exception;

	// 원글 히트 업데이트
	int updateQVOHit(String idx) throws Exception;

	// 원글 상세보기
	QVO selectQVOOneList(String idx) throws Exception;


	// 원글 업데이트
	int updateQVOList(QVO qvo) throws Exception;

	// 댓글 삽입
	int InsertQVOAns(QVO qvo) throws Exception;

	// 원글 삭제
	int deleteQVO(String groups) throws Exception;

	// 댓글 삭제
	int deleteQVOAns(String idx) throws Exception;
	
	
	
	
	
	
	
	
	/* MVO관련 */
	MVO selectMember() throws Exception;
	int selectMVOIdChk(String id) throws Exception;
	MVO selectMVO(String id)throws Exception;
	int deleteMVO(String id) throws Exception;
	// 비번 체크 
	int selectMVOPwdChk(MVO mvo) throws Exception ;
	int updateMVO(String id)throws Exception;
	MVO selectLogIn(MVO mvo) throws Exception;
}
