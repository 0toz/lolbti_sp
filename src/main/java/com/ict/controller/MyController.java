package com.ict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.MyService;
import com.ict.vo.TVO;
@Controller
public class MyController {

	@Autowired
	private MyService myService;
	
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


	@RequestMapping("test1_page.do")
	public ModelAndView Test1_pageCommand(@RequestParam("idx")String idx) {
		try {
			ModelAndView mv = new ModelAndView("test1_page");

			TVO tvo = myService.selectTVOList(idx);
			mv.addObject("tvo",tvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error");
		}
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
	@RequestMapping("QnA.do")
	public ModelAndView QnACommand(@RequestParam("")) {
		try {
			ModelAndView mv = new ModelAndView("QnA");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error");
		}
	}

	@RequestMapping("test_main.do")
	public ModelAndView test01Command() {
		try {
			ModelAndView mv = new ModelAndView("test_main");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("error");
		}
	}


















}
