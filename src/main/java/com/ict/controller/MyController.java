package com.ict.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.MyService;
import com.ict.service.Paging;
import com.ict.vo.Test_AnswerVO;
import com.ict.vo.MVO;
import com.ict.vo.QVO;
import com.ict.vo.TestMainVO;
import com.ict.vo.TestVO;
@Controller
public class MyController {

	@Autowired
	private MyService myService;

	@Autowired
	private Paging paging;

	@RequestMapping("login.do")
	public ModelAndView logInCommand() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("login_ok.do")
	public ModelAndView logInOkCommand(MVO m_vo, HttpSession session) {
		try {
			MVO mvo = myService.selectLogIn(m_vo);
			if(mvo == null) {
				session.setAttribute("log_in","0");
				return new ModelAndView("login_err");
			}else {
				session.setAttribute("log_in","1");
				session.setAttribute("log_id",mvo.getId());
				session.setAttribute("log_pwd",mvo.getPwd());
				
				// 관리자인 경우
				if(mvo.getId().equals("admin") && mvo.getPwd().equals("admin")) {
					session.setAttribute("admin", "ok");
					return new ModelAndView("admin");
				}
				// 관리자가 아니면 일반 회원
				return new ModelAndView("redirect:main.do");
			}
		} catch (Exception e) {
			session.setAttribute("log_in","0");
		}
		return null;
	}
	

	
	
	@RequestMapping("logout.do")
	public ModelAndView logoutCommand(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:product_list.do");
	}
	

		
	


	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("main.do")
	public ModelAndView MainCommand() {
		try {
			ModelAndView mv = new ModelAndView("main");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error");
		}
	}

	/* 테스트DB관련 */

	@RequestMapping("test_list.do")
	public ModelAndView test_list_goCommand() {
		return new ModelAndView("test_list");
	}
	
	
	@RequestMapping("test_main.do")
	public ModelAndView Test_mainCommand() {
		try {
			ModelAndView mv = new ModelAndView("test_main");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error");
		}
	}



	@RequestMapping("test_do.do")
	public ModelAndView TestlistCommand(@RequestParam("test_name")String test_name) {
		try {
			ModelAndView mv = new ModelAndView("test_do");
			
			if(test_name == null) {
				test_name = "lineTest";
			}
			List<TestVO> list = myService.selectTestList(test_name);
			mv.addObject("list", list);
			return mv;
		} catch (Exception e) {
		}
		return null;
	}
	
	
	

	
	@RequestMapping("test_result.do")
	public ModelAndView Test1_resultCommand() {
		try {
			ModelAndView mv = new ModelAndView("test_result");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error");
		}
	}
	/*
	 * @RequestMapping("QnA.do") public ModelAndView QnACommand(@RequestParam("")) {
	 * try { ModelAndView mv = new ModelAndView("QnA"); return mv; } catch
	 * (Exception e) { System.out.println(e); return new ModelAndView("error"); } }
	 */




	@RequestMapping(value = "addTestMain.do", method = RequestMethod.POST)
	public ModelAndView addTestMainCommand(TestMainVO testMainVo, HttpServletRequest request) {
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = testMainVo.getF_name();
			if(file.isEmpty()) {
				testMainVo.setFile_name("");
			}else {
				testMainVo.setFile_name(file.getOriginalFilename());
			}
			int result = myService.insertMainTest(testMainVo);
			if(result>0) {
				if (!testMainVo.getFile_name().isEmpty()) {/* 이미지파일이 없을때 */
					byte[] in = file.getBytes();
					File out = new File(path, testMainVo.getFile_name());
					FileCopyUtils.copy(in, out);
				}
				return new ModelAndView("redirect:testMain.do");
			}else {
				return new ModelAndView("redirect:addTest.do");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	@RequestMapping("testMain_go.do")
	public ModelAndView testMain_goCommand(HttpSession session) {
		try {
			return new ModelAndView("test_main");
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping(value = "test_go.do",produces = "application/json; charset=utf-8" )
	@ResponseBody
	public List<TestVO> test_goCommand(String test_name) {
		try {
			// 카트 테이블에서 해당 아이디가 가진 모든 목록을 가져오기 
			List<TestVO> testList = myService.selectTestList(test_name);
			return testList;
		} catch (Exception e) {
		}
		return null;
	}
	@RequestMapping(value = "deleteTest.do",produces = "text/html; charset=utf-8" )
	@ResponseBody
	public String deleteTestCommand(String test_name){
		try {
			int result = myService.deleteTest(test_name);
			return String.valueOf(result);
		} catch (Exception e) {
			return null;
		}
	}
	@RequestMapping(value = "updateTest.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String updateTestCommand(TestVO testvo) {
		try {
			int result = myService.updateTest(testvo);
			return String.valueOf(result);
		} catch (Exception e) {
		}
		return null;
	}
	@RequestMapping(value = "addTest", method = RequestMethod.POST)
	public List<TestVO> testAddCommand(TestVO testvo,HttpServletRequest request) {
		try {
			int count = 0;
			int su = Integer.parseInt(request.getParameter("su"));
			
			List<TestVO> testList = new ArrayList<TestVO>(); 
			while(su > count) {
				testList.add(testvo);
				count++;
			}
			
	

			return testList;
		} catch (Exception e) {
		}
		return null;
	}

	
	@RequestMapping("myList_go.do")
	public ModelAndView myList_goCommand(HttpSession session) {
		try {
			return new ModelAndView("myList");
		} catch (Exception e) {
		}
		return null;
	}





	/* 						아래는 QVO관련 									*/

	
	
	
	
	
	
	
@RequestMapping("QnA_list.do")
public ModelAndView QVO_listCommand(@ModelAttribute("cPage")String qPage) {
	try {
		ModelAndView mv = new ModelAndView("list");
		
		// 전체 게시물의 수
		int count = myService.selectQVOCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			// 전체 페이지의 수 계산하기
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			// 주의 사항 : 나머지가 존재하면 전체 페이지 수에 +1를 한다.
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재 페이지 구하기
		paging.setNowPage(Integer.parseInt(qPage));
		
		// 시작번호, 끝번호
		paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
		paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

		// 시작블록, 끝블록
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의사항 : endBlock 이 totalPage 보다 큰 경우 발생 할 수 있다.
		// 이 경우 endBlock를 totalPage에 맞춰야 한다.
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		List<QVO> list = myService.selectQVOList(paging.getBegin(), paging.getEnd());
		
		mv.addObject("list",list);
		mv.addObject("pvo", paging);
		
		return mv;
		
	} catch (Exception e) {
		System.out.println(e);
	}
	return null;
}

@RequestMapping("QnA_write.do")
public ModelAndView QVO_writeCommand(@ModelAttribute("qPage")String qPage) {
	return new ModelAndView("write");
}
@RequestMapping(value = "QnA_write_ok.do", method = RequestMethod.POST)
public ModelAndView QVO_writeOKCommand(QVO qvo, HttpServletRequest request,
		@ModelAttribute("qPage")String qPage) {
	try {
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		MultipartFile file = qvo.getF_name();
		if(file.isEmpty()) {
			qvo.setFile_name("");
			// 파일을 비운다.
		}else {
			qvo.setFile_name(file.getOriginalFilename());
			// 파일을 저장한다.
		}
		int result = myService.InsertQVO(qvo);
		if(result>0) {
			if(! qvo.getFile_name().isEmpty()) {
				byte[] in = file.getBytes();
				File out = new File(path, qvo.getFile_name());
				FileCopyUtils.copy(in, out);
			}
			return new ModelAndView("redirect:QnA_list.do");
		}else {
			return new ModelAndView("redirect:QnA_write.do");
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return null;
}

@RequestMapping("QnA_onelist.do")
public ModelAndView oneListCommand(@ModelAttribute("qPage")String qPage,
		@RequestParam("idx")String idx) {
	try {
		ModelAndView mv= new ModelAndView("QnA_onelist");
		// 히트 업데이트
		int result = myService.updateQVOHit(idx);
		// 상세 보기 
		QVO qvo = myService.selectQVOOneList(idx);
		// 저장
		mv.addObject("qvo", qvo);
		return mv;
	} catch (Exception e) {
		// TODO: handle exception
	}
	return null;
}
@RequestMapping("QVO_download.do")
public void downCommand(@RequestParam("file_name")String file_name,
		HttpServletRequest request,
		HttpServletResponse response) {
	
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	BufferedOutputStream bos = null;
	try {
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+file_name);
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition","attachment; filename="+URLEncoder.encode(file_name,"utf-8"));
		File file = new File(new String(path.getBytes("utf-8")));
		fis = new FileInputStream(file);
		bis = new BufferedInputStream(fis);
		bos = new BufferedOutputStream(response.getOutputStream());
		FileCopyUtils.copy(bis, bos);
	} catch (Exception e) {
		// TODO: handle exception
	} finally {
		try {
			bos.close();
			bis.close();
			fis.close();
		} catch (Exception e2) {
		}
	}
}
@RequestMapping("QVO_ans_write.do")
public ModelAndView Ans_WriteCommand(@ModelAttribute("qPage")String qPage,
		@ModelAttribute("idx")String idx) {
	return new ModelAndView("ans_write");
}
@RequestMapping(value = "QVO_ans_write_ok.do", method = RequestMethod.POST)
public ModelAndView QVO_Ans_Write_OKCommand(QVO qvo,HttpServletRequest request,
		@ModelAttribute("cPage")String cPage) {
	try {
		// groups,step, lev 를 구하자 
		QVO vo2 = myService.selectQVOOneList(qvo.getIdx());
		int groups = Integer.parseInt(vo2.getGroups());
		
		
		// DB에 groups, lev를 이용해서 업데이트를 한다.
		// group이 같은 원글 찾아서 레벌이 같거나 크면 레벨을 증가 
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("groups", groups);

		qvo.setGroups(String.valueOf(groups));
		
		// 파일 처리 
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		MultipartFile file = qvo.getF_name();
		if(file.isEmpty()) {
			qvo.setFile_name("");
		}else {
			qvo.setFile_name(file.getOriginalFilename());
		}
		int result = myService.InsertQVOAns(qvo);
	
		if(result>0) {
			if(! qvo.getFile_name().isEmpty()) {
				byte[] in = file.getBytes();
				File out = new File(path, qvo.getFile_name());
				FileCopyUtils.copy(in, out);
			}
			return new ModelAndView("redirect:list.do?cPage="+cPage);
		}else {
			return new ModelAndView("redirect:ans_write.do?cPage="+cPage+"&idx="+qvo.getIdx());
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	return null;
}

/* 이거 확인 */
@RequestMapping("QnA_update.do")
public ModelAndView updateQVOCommand(@ModelAttribute("qPage")String qPage,
		@ModelAttribute("idx")String idx) {
	try {
		ModelAndView mv = new ModelAndView("QnA_update");
		QVO qvo = myService.selectQVOOneList(idx);
		mv.addObject("qvo", qvo);
		return mv;
	} catch (Exception e) {
	}
	return null;
}
@RequestMapping("QnA_delete.do")
public ModelAndView deleteCommand(@ModelAttribute("qPage")String qPage,
		@ModelAttribute("idx")String idx) {
	try {
		return new ModelAndView("QnA_delete");
	} catch (Exception e) {
	}
	return null;
}

@RequestMapping(value = "pwd_chk.do", produces = "text/html; charset=utf-8")
@ResponseBody
public String pwd_ckCommand(@ModelAttribute("pwd")String pwd, @ModelAttribute("id")String id) {
	try {
		MVO mvo = new MVO();
		mvo.setId(id);
		mvo.setPwd(pwd);
		int result = myService.selectMVOPwdChk(mvo);
		return String.valueOf(result);
	} catch (Exception e) {
		System.out.println(e);
	}
	return null;
}
@RequestMapping(value = "update_ok.do", method = RequestMethod.POST)
public ModelAndView updateOKCommand(QVO qvo, HttpServletRequest request,
		@ModelAttribute("qPage")String qPage) {
	try {
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		MultipartFile file = qvo.getF_name();
		String old_file_name = request.getParameter("old_file_name");
		if(file.isEmpty()) {
			qvo.setFile_name(old_file_name);
		}else {
			qvo.setFile_name(file.getOriginalFilename());
		}
		int result = myService.updateQVOList(qvo);
		if(! file.isEmpty()) {
			byte[] in = file.getBytes();
			File out = new File(path, qvo.getFile_name());
			FileCopyUtils.copy(in, out);
		}
		return new ModelAndView("redirect:onelist.do?idx="+qvo.getIdx());
	} catch (Exception e) {
		System.out.println(e);
	}
	return null;
}
@RequestMapping("delete_ok.do")
public ModelAndView deleteOKCommand(@ModelAttribute("qPage")String qPage,
		@RequestParam("idx")String idx) {
	try {
		QVO qvo = myService.selectQVOOneList(idx);
		// 원글과 댓글 구분해서 삭제 하자
		int result = 0 ;

			// 원글일 경우 댓글 전체 삭제 
			result = myService.deleteQVO(qvo.getGroups());
		if(result>0) {
			return new ModelAndView("redirect:list.do");
		}
		
	} catch (Exception e) {
	}
	return null;
}




/* 이하 MVO 관련 */

@RequestMapping(value = "chk_id_overlap.do", produces = "text/html; charset=utf-8")
@ResponseBody
public String chk_id_overlapCommand(@ModelAttribute("id")String id) {
	try {
		MVO mvo = new MVO();
		mvo.setId(id);
		int result = myService.selectMVOIdChk(id);
		return String.valueOf(result);
	} catch (Exception e) {
		System.out.println(e);
	}
	return null;
}

	@RequestMapping("member_list.do")
	public ModelAndView memberlistCommand() {
		try {
			ModelAndView mv = new ModelAndView("member_list");
			
			MVO mvo = myService.selectMember();
			
			mv.addObject("mvo",mvo);
			
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	
	@RequestMapping("memberInfo_go.do")
	public ModelAndView memberInfoCommand() {
		try {
			ModelAndView mv = new ModelAndView("MyPage_info");
			MVO mvo = myService.selectMVO("id");
			mv.addObject("mvo",mvo);
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	
	
	@RequestMapping("member_update_go.do")
	public String memberUpdateCommand() {
		try {
			int result = myService.updateMVO("id");
			return String.valueOf(result);
		} catch (Exception e) {
		}
		return null;
	}

	@RequestMapping("member_delete_go.do")
	public ModelAndView deleteMVOCommand(@ModelAttribute("qPage")String qPage,
			@RequestParam("idx")String idx) {
		try {
			QVO qvo = myService.selectQVOOneList(idx);
			// 원글과 댓글 구분해서 삭제 하자
			int result = 0 ;

				// 원글일 경우 댓글 전체 삭제 
				result = myService.deleteQVO(qvo.getGroups());
			if(result>0) {
				return new ModelAndView("redirect:list.do");
			}
			
		} catch (Exception e) {
		}
		return null;
	}
}
