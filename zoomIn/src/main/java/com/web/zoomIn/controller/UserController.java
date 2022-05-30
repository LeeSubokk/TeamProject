package com.web.zoomIn.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.bean.UserBean;
import com.web.zoomIn.service.UserService;

@Controller
public class UserController {
	ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	// 유저 메뉴바 
	@RequestMapping(value = "/main")
	public ModelAndView moveUserMenu(@RequestParam String menu) throws Exception {
		mav = userService.moveUserMenu(menu);
		return mav;

	}

	// 로그인 
	@RequestMapping(value = "/actionLogin")
	public ModelAndView actionLogin(@RequestParam String login_id, @RequestParam String login_password,
			@RequestParam String rememberID, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		mav = userService.actionUserLogin(login_id, login_password);
		UserBean user = new UserBean();
		if (mav.getModel().get("user") instanceof UserBean) {
			user = (UserBean) mav.getModel().get("user");
		}

		if (user != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60 * 60);
			session.setAttribute("loginedUserBean", user);

			// -------아이디 기억---------
			if (rememberID.equals("off")) {
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					String str = cookies[i].getValue();
					if (str.equals(login_id)) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
			} else {
				Cookie cookie = new Cookie("rememberId", login_id);
				cookie.setMaxAge(60 * 60 * 24 * 31);
				response.addCookie(cookie);
			}
		}
		logger.info(login_id + "님이 로그인 하셨습니다.");
		return mav;
	}

	// 로그아웃 
	@RequestMapping(value = "/actionLogout")
	public ModelAndView actionLogout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginedUserBean") != null) {
			if (session.getAttribute("loginedUserBean") instanceof UserBean) {
				UserBean user = (UserBean) session.getAttribute("loginedUserBean");
				logger.info(user.getUser_id() + "님이 로그아웃 하셨습니다.");
			}
			session.removeAttribute("loginedUserBean");
		}

		mav = new ModelAndView();
		mav.setViewName("user/main");
		mav.addObject("menu", "main-content");
		return mav;

	}

	// 회원가입 
	@RequestMapping(value = "/actionJoin")
	public ModelAndView actionJoin(@ModelAttribute UserBean userBean) throws Exception {
		mav = userService.actionUserJoin(userBean);
		return mav;
	}

	// 회원 정보 수정
	@RequestMapping(value = "/actionUserUpdate")
	public ModelAndView actionUserUpdate(@ModelAttribute UserBean userBean,
			@RequestParam("passwordChange") String passwordChange, HttpServletRequest request) throws Exception {
		mav = userService.actionUserUpdate(userBean, passwordChange);

		UserBean user = new UserBean();
		if (mav.getModel().get("user") instanceof UserBean) {
			user = (UserBean) mav.getModel().get("user");
			HttpSession session = request.getSession();
			session.setAttribute("loginedUserBean", user);
		}
		return mav;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/actionChangePassword")
	public ModelAndView actionChangePassword(@RequestParam String findPassword_password,
			@RequestParam String findPassword_id) throws Exception {
		mav = userService.actionUserUpdate(findPassword_id, findPassword_password);
		return mav;
	}

	// ------------------------Ajax---------------------------//
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("/actionIdCheck")
	public String idCheck(@RequestParam String user_id) throws Exception {
		JSONObject json = userService.actionIdCheck(user_id);
		return json.toString();
	}

	// 로그인 가능여부 확인
	@ResponseBody
	@RequestMapping("/actionLoginCheck")
	public String actionLoginCheck(@RequestParam String login_id, @RequestParam String login_password)
			throws Exception {
		JSONObject json = userService.actionLoginCheck(login_id, login_password);
		return json.toString();
	}

	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/findPasswordCheck")
	public String findPasswordCheck(@RequestParam String user_id, @RequestParam String user_email) throws Exception {
		JSONObject json = userService.findPasswordCheck(user_id, user_email);
		return json.toString();
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/findIdCheck")
	public String findIdCheck(@RequestParam String user_name, @RequestParam String user_email) throws Exception {
		JSONObject json = userService.findIdCheck(user_name, user_email);
		return json.toString();
	}

}
