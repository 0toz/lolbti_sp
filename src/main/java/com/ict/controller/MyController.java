package com.ict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.MyService;
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
}
