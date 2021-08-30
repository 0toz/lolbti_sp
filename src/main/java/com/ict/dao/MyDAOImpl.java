package com.ict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.MVO;
import com.ict.vo.QVO;
import com.ict.vo.TestMainVO;
import com.ict.vo.TestVO;

@Repository
public class MyDAOImpl implements MyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<TestVO> selectTestList(String test_name) throws Exception {
		return sqlSessionTemplate.selectList("testdb.select",test_name);
	}


	@Override
	public int insertTest(TestVO testvo) throws Exception{
		return sqlSessionTemplate.insert("testdb.insert", testvo);
	
	}
	@Override
	public int updateTest(TestVO testvo)throws Exception{
		return sqlSessionTemplate.update("testdb.insert", testvo);
	}


	@Override
	public int deleteTest(String test_name) throws Exception {
		return sqlSessionTemplate.delete("testdb.delete", test_name);
	}
	
	@Override
	public int insertMainTest(TestMainVO testmainvo) throws Exception{
		return sqlSessionTemplate.insert("testdb.insertMain", testmainvo);
	}
	
	
	/* QVO관련 */
	@Override
	public int selectQVOCount() throws Exception {
		return sqlSessionTemplate.selectOne("qna.count");
	}

	@Override
	public List<QVO> selectQVOList(int begin, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("qna.list", map);
	}

	@Override
	public int InsertQVO(QVO qvo) throws Exception {
		return sqlSessionTemplate.insert("qna.insert", qvo);
	}

	@Override
	public int updateQVOHit(String idx) throws Exception {
		return sqlSessionTemplate.update("qna.updateHit", idx);
	}

	@Override
	public QVO selectQVOOneList(String idx) throws Exception {
		return sqlSessionTemplate.selectOne("qna.oneList", idx);
	}

	@Override
	public int InsertQVOAns(QVO qvo) throws Exception {
		return sqlSessionTemplate.insert("qna.ans_insert", qvo);
	}
	

	@Override
	public int updateQVOList(QVO qvo) throws Exception {
		return sqlSessionTemplate.update("qna.update",qvo);
	}
	@Override
	public int deleteQVO(String groups) throws Exception {
		return sqlSessionTemplate.delete("qna.delete", groups);
	}

	@Override
	public int deleteQVOAns(String idx) throws Exception {
		return sqlSessionTemplate.delete("qna.delete_ans", idx);
	}




	/* MVO관련 */
	@Override
	public MVO selectMember() throws Exception{
		return sqlSessionTemplate.selectOne("member.selectAll");
	}
	@Override
	public MVO selectMVO(String id)throws Exception{
		return sqlSessionTemplate.selectOne("member.select", id);
	}
	@Override
	public MVO selectLogIn(MVO mvo) throws Exception{
		return sqlSessionTemplate.selectOne("member.login", mvo );
	
	}
	@Override
	public int deleteMVO(String id) throws Exception{
		return sqlSessionTemplate.delete("member.delete", id );
	}
	@Override
	public int selectMVOIdChk(String id) throws Exception{
		return sqlSessionTemplate.selectOne("member.select", id);
	}
	
	@Override
	public int selectMVOPwdChk(MVO mvo) throws Exception{
		return sqlSessionTemplate.selectOne("member.select", mvo);
	}
	@Override
	public int updateMVO(String id)throws Exception{
		return sqlSessionTemplate.update("member.update", id);
	}

}
