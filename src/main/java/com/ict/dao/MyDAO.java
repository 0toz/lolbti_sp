package com.ict.dao;

import java.util.List;

import com.ict.vo.MVO;
import com.ict.vo.QVO;
import com.ict.vo.TestMainVO;
import com.ict.vo.TestVO;

public interface MyDAO {
	
	/*
	 * SQL문 과 관련된 기능. 작은 기능으로 구현. 작게 구현된 기능을 가지고 서비스에서 활용되도록
	 * 
	 * insert, delete, select, get, getList, hit, count
	 * 
	 * 1. 문의 게시판 insert, delete, select, hit, count(한페이지에 표시될 수)
	 * 보드 참고.
	 * 
	 * 
	 * 		idx(문의번호) , title(제목), nickname(작성자), content(내용) ,id(hidden) , reg(작성날짜) ,hit(조회수), gruop, file_name
	 * 
	 * 
	 * == QnADB : idx, kind, id(hidden), title,content, nickname(수정가능), reg , hit, group, file_name. 
	 * 
	 * 
	 * 
	 * 2. 테스트 DB.  01, 02로 더만들수있게해야함.
	 * 
	 * 			결과에대해 필요한 정보로 정렬된 결과정보를 select.
	 * - 테스트이름(테이블이름), 문제번호, 중요도, 추천항목, 문제 내용.
	 * 
	 *  관리자용 테스트 생성 페이지.
	 *  테스트 배점 조정 정보. 추천항목수와 중요도 배점으로  각 문제에대한 배점을 곱하고 항목에대한 합산을 하여 그래프로 표현해줌.
	 *   
	 *  == testDB : test_name, exm_num, imp, sug(제안), quest(질문내용)
	 *   
	 * 
	 * 3. 사용자 테스트 입력. insert(브라우저에 테스트 기록하다가 모든테스트가 끝나고 DB에 기록.) delete(구현안함.)
	 * 		
	 * 		pi. 퍼스널 아이디. 사용자식별용도.(세션에 저장하며 테스트시작시 시퀀스를 통한 부여)
	 * 		exm_num 문제 번호. 테스트DB의 포린키
	 *  	test_name 작성한 테스트이름
	 *  	imp 중요도
	 *  	answer 문제에대한 답.
	 *  	
	 * 
	 *  == testAnswer : pi, exm_num, test_name, imp, answer
	 *  
	 *  
	 *  테스트하고 로그인할시
	 *  >> pi를 회원정보 안에 입력, 이정보로 결과 확인.
	 *  
	 *  로그인하고 테스트할시
	 *  >> pi부여 회원정보에 등록, 이정보로 결과확인.
	 * 
	 * 4. 회원가입 insert(회원가입), delete(회원탈퇴), select (아이디 비밀번호찾기), update (회원정보수정)
	 * -이름, 성별, 아이디(PK), 닉네임, 비밀번호(+비밀번호확인), email주소
	 * id, Nickname, gender, pwd, email
	 * 
	 * 		닉네임 email주소 비밀번호 변경가능.
	 * 		카카오 로그인 연동가능.
	 * 
	 * 
	 * 
	 * == userDB : id, pwd, nickname, gender, email, reg, pi
	 * 
	 * 5. 회원 마이페이지.
	 * 		5-1 테스트 결과
	 * 			3.사용자 테스트 입력에대한 결과 모음.
	 * 
	 * 		5-2 문의 내용
	 * 			1.문의게시판내용중 자신이 쓴 글 모음.
	 * 
	 * 
	 * == QnADB, test_AnswerVO
	 * 
	 * 
	 */
	
	// QVO관련
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
	   	MVO selectMember()throws Exception;
	   	MVO selectMVO(String id)throws Exception;
	   	MVO selectLogIn(MVO mvo) throws Exception;
	   	
	   	int deleteMVO(String id) throws Exception;
	   	int selectMVOIdChk(String id)throws Exception;
	   	
	   	int selectMVOPwdChk(MVO mvo) throws Exception ;
		int updateMVO(String id)throws Exception;

	
	   	
	   	
	   	/* testDB에관한 DAO */
	
	   
	   	
		/* TestVO 관련 */
	
		List<TestVO> selectTestList(String test_name)throws Exception;
		
		int deleteTest(String test_name) throws Exception;
		
		int insertTest(TestVO testvo) throws Exception;
		
		int updateTest(TestVO testvo)throws Exception;
	
		
		int insertMainTest(TestMainVO testmainvo) throws Exception;
	
}
