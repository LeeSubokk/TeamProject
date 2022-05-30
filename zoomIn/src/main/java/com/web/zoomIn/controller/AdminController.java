package com.web.zoomIn.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.service.UserService;

@Controller
public class AdminController {
	ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	UserService userService;

	// 어드민 메뉴바
	@RequestMapping(value = "/adminMain")
	public ModelAndView moveAdminMenu(@RequestParam String menu) throws Exception {
		mav = userService.moveAdminMenu(menu);
		return mav;
	}

	// 어드민 상세
	@RequestMapping(value = "/adminDetail")
	public ModelAndView moveAdminMenu(@RequestParam String menu, int code) throws Exception {
		mav = userService.moveAdminMenu(menu, code);
		return mav;
	}
}
