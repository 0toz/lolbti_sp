package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;
import com.ict.vo.MVO;
import com.ict.vo.QVO;
import com.ict.vo.TestMainVO;
import com.ict.vo.TestVO;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyDAO myDAO;

	
	@Override
	public List<TestVO> selectTestList(String test_name) throws Exception {
		return myDAO.selectTestList(test_name);
	}
	@Override
	public int insertTest(TestVO testvo) throws Exception{
		return myDAO.insertTest(testvo);
	}
	@Override
	public int updateTest(TestVO testvo) throws Exception{
		return myDAO.updateTest(testvo);
	}
	@Override
	public int deleteTest(String test_name) throws Exception{
		return myDAO.deleteTest(test_name);
	}
	

	
	@Override
	public int insertMainTest(TestMainVO testmainvo) throws Exception{
		return myDAO.insertMainTest(testmainvo);
	}
	
	
	
	
	
	
	/* QVO관련 */
	
	@Override
	public int selectQVOCount() throws Exception {
		return myDAO.selectQVOCount();
	}

	@Override
	public List<QVO> selectQVOList(int begin, int end) throws Exception {
		return myDAO.selectQVOList(begin, end);
	}

	@Override
	public int InsertQVO(QVO qvo) throws Exception {
		return myDAO.InsertQVO(qvo);
	}

	@Override
	public int updateQVOHit(String idx) throws Exception {
		return myDAO.updateQVOHit(idx);
	}

	@Override
	public QVO selectQVOOneList(String idx) throws Exception {
		return myDAO.selectQVOOneList(idx);
	}


	
	@Override
	public int InsertQVOAns(QVO qvo) throws Exception {
		return myDAO.InsertQVOAns(qvo);
	}

	
	@Override
	public int updateQVOList(QVO qvo) throws Exception {
		return myDAO.updateQVOList(qvo);
	}

	@Override
	public int deleteQVO(String groups) throws Exception {
		return myDAO.deleteQVO(groups);
	}

	@Override
	public int deleteQVOAns(String idx) throws Exception {
		return myDAO.deleteQVOAns(idx);
	}
	
	/* MVO관련 */
	
	
	
	@Override
	public MVO selectMember() throws Exception{
		return myDAO.selectMember();
	}
	@Override
	public MVO selectMVO(String id)throws Exception{
		return myDAO.selectMVO(id);
	}
	
	public int deleteMVO(String id) throws Exception{
		return myDAO.deleteMVO(id);
	}
	@Override
	public int selectMVOIdChk(String id) throws Exception{
		return myDAO.selectMVOIdChk(id);
	}
	
	public int updateMVO(String id)throws Exception{
		return myDAO.updateMVO(id);
	}
	
	@Override
	public int selectMVOPwdChk(MVO mvo) throws Exception{
		return myDAO.selectMVOPwdChk(mvo);
	}
	
	@Override
	public MVO selectLogIn(MVO mvo) throws Exception{
		return myDAO.selectLogIn(mvo);
	}
	
}
