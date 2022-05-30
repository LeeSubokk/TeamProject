package com.web.zoomIn.service;


import org.json.simple.JSONObject;
import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.bean.BoardBean;
import com.web.zoomIn.bean.UserBean;

public interface UserService {

	// ---------------유저-------------
	ModelAndView actionUserLogin(String id, String password);

	ModelAndView actionUserJoin(UserBean user);

	ModelAndView actionUserUpdate(UserBean user, String passwordSwitch);

	ModelAndView actionUserUpdate(String user_id, String user_password);

	ModelAndView setView(String menu);

	ModelAndView moveUserMenu(String menu);

	ModelAndView moveUserMenu(String menu, int code);

	ModelAndView moveAdminMenu(String menu);

	String sendEmail(UserBean userBean);

	JSONObject actionIdCheck(String user_id);

	JSONObject actionLoginCheck(String user_id, String user_password);

	JSONObject findPasswordCheck(String user_id, String user_email);

	JSONObject findIdCheck(String user_name, String user_email);

	// ----------- 관리자 페이지 ---------------//
	ModelAndView actionAdminBoardUpdate(BoardBean board);

	ModelAndView moveAdminMenu(String menu, int code);

	

}
