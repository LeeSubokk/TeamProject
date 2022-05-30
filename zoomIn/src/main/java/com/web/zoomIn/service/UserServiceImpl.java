package com.web.zoomIn.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.web.servlet.ModelAndView;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.zoomIn.DAO.ZoomInDAO;
import com.web.zoomIn.bean.BoardBean;
import com.web.zoomIn.bean.BoardReplyBean;
import com.web.zoomIn.bean.MailUtils;
import com.web.zoomIn.bean.PlaceBean;
import com.web.zoomIn.bean.PlaceKeywordBean;
import com.web.zoomIn.bean.TempKey;
import com.web.zoomIn.bean.UserBean;
@Service
public class UserServiceImpl implements UserService {
	@Inject
	ZoomInDAO dao;
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	BoardServiceImpl boardService;
	@Inject
	PlaceServiceImpl placeService;

	ModelAndView mav;
	UserBean user;
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	
	
	// 뷰 폴더 지정
		@Override
		public ModelAndView setView(String menu) {
			mav = new ModelAndView();
			mav.setViewName("user/main");

			if (menu.contains("serviceCenter")) {
				mav.addObject("menu", "serviceCenter/" + menu);
			} else if (menu.contains("route")) {
				mav.addObject("menu", "route/" + menu);
			} else if (menu.contains("spot")) {
				mav.addObject("menu", "spot/" + menu);
			} else if (menu.contains("introduce")) {
				mav.addObject("menu", "introduce/" + menu);
			} else if (menu.contains("user")) {
				mav.addObject("menu", "user/" + menu);
			} else {
				mav.addObject("menu", menu);
			}
			return mav;
		}

		// 유저 메뉴 이동
		@Override
		public ModelAndView moveUserMenu(String menu) {
			mav = setView(menu);

			// 필요 객체 주입
			if (menu.equals("spot")) {
				List<PlaceBean> placeList = dao.placeList();
				List<PlaceKeywordBean> keywords = dao.placeKeywordSelectAll();

				mav.addObject("keywords", keywords);
				mav.addObject("placeList", placeList);
				mav.addObject("placeCnt", placeList.size());
			}
			if (menu.equals("route")) {
				List placeList = dao.placeList();
				mav.addObject("placeList", placeList);
			}
			if (menu.equals("serviceCenter")) {
				List<BoardBean> list = dao.boardList();
				mav.addObject("boardList", list);

			}

			return mav;
		}

		// 유저 메뉴 이동 상세페이지
		@Override
		public ModelAndView moveUserMenu(String menu, int code) {
			mav = setView(menu);

			if (menu.equals("serviceCenter-boardUpdate")) {
				BoardBean board = dao.boardView(code);
				mav.addObject("board", board);
			} else if (menu.equals("spot-detail")) {
				PlaceBean place = dao.placeContent(code);
				List placeReplyList = placeService.actionReadPlaceReply(code);
				mav.addObject("placeReplyList", placeReplyList);
				mav.addObject("place", place);
			}
			return mav;
		}

		// 유저 로그인
		@Override
		public ModelAndView actionUserLogin(String id, String password) {
			user = dao.userLogin(id);
			if (user.getUser_password().toLowerCase().equals(dao.getSHA256(password))) {
				// 어드민여부 확인
				if (user.getUser_grade().equals("admin")) {
					mav = moveAdminMenu("main");
				} else { // 아닐경우 유저화면
					mav = moveUserMenu("main-content");
				}
			} else { // 로그인 실패
				mav = moveUserMenu("main-content");
				return mav;
			}

			mav.addObject("user", user);
			return mav;
		}

		// 유저 회원 가입
		@Override
		public ModelAndView actionUserJoin(UserBean user) {
			String realPassword = user.getUser_password();
			user.setUser_password(dao.getSHA256(user.getUser_password()));
			user.setUser_grade("user");
			int result = dao.insertUser(user);

			if (result == 1) { // 가입성공 했을시 로그인 후 홈화면
				mav = actionUserLogin(user.getUser_id(), realPassword);
				return mav;
			} else { // 가입 실패시
				mav = moveUserMenu("main-content");
			}
			return mav;
		}

		// 유저정보 업데이트
		@Override
		public ModelAndView actionUserUpdate(UserBean user, String passwordChange) {
			int result;
			String where;

			// 관리자 페이지에서 업데이트
			if (passwordChange.equals("admin")) {
				result = dao.updateUser(user);
				mav = moveAdminMenu("userUpdate");
				logger.info("유저 정보 업데이트 : "+user.getUser_id()+"님의 정보가 업데이트 되었습니다. (관리자페이지)");
				return mav;

				// 유저페이지에서 비밀번호 변경 제외
			} else if (passwordChange.equals("off")) {
				result = dao.updateUser(user);
				mav = moveUserMenu("userUpdate");

				// 비밀번호 변경 포함
			} else if (passwordChange.equals("on")) {
				user.setUser_password(dao.getSHA256(user.getUser_password()));
				result = dao.updateUserincludePassword(user);
				mav = moveUserMenu("userUpdate");
			}

			user = dao.userContent(user.getUser_id());
			mav.addObject("user", user);
			logger.info("유저 정보 업데이트 : "+user.getUser_id()+"님의 정보가 업데이트 되었습니다. (유저페이지)");
			return mav;
		}

		// 유저 비밀번호 변경
		@Override
		public ModelAndView actionUserUpdate(String user_id, String user_password) {
			UserBean user = dao.userContent(user_id);
			user.setUser_password(dao.getSHA256(user_password));
			int result = dao.updateUserincludePassword(user);
			mav = moveUserMenu("main-content");
			return mav;
		}

		// 인증메일 전송
		@Override
		public String sendEmail(UserBean userBean) {
			String key = new TempKey().getKey(6, false);
			try {
				MailUtils sendMail = new MailUtils(mailSender);
				sendMail.setSubject("[ZoomIn" + " 이메일 인증메일 입니다.]"); // 메일제목
				sendMail.setText("<h1>메일인증</h1>" + "<br/>" + userBean.getUser_name() + "님 " + "<br/><h1>[이메일 인증 코드]</h1>"
						+ "<h1>[ " + key + " ]</h1>");
				sendMail.setFrom("lsu87888", "zoomIn");
				sendMail.setTo(userBean.getUser_email());
				sendMail.send();
			} catch (Exception e) {
			}

			return key;
		}

		// ------------------------------- 관리자 페이지 ------------------------------- //
		// 관리자 메뉴 이동
		@Override
		public ModelAndView moveAdminMenu(String menu) {
			mav = new ModelAndView();
			mav.setViewName("admin/main");
			mav.addObject("menu", menu);

			if (menu.equals("userList") || menu.equals("userUpdate")) {
				List userList = dao.userList();
				mav.addObject("userList", userList);
			} else if (menu.equals("placeList") || menu.equals("placeUpdate") || menu.equals("main")) {
				List placeList = dao.placeList();
				mav.addObject("placeList", placeList);
			} else if (menu.equals("boardList") || menu.equals("boardUpdate")) {
				List boardList = dao.boardList();
				mav.addObject("boardList", boardList);
			}
			return mav;
		}

		// 관리자 상세 메뉴 이동
		@Override
		public ModelAndView moveAdminMenu(String menu, int code) {
			mav = new ModelAndView();
			mav.setViewName("admin/main");
			mav.addObject("menu", menu);

			if (menu.equals("boardReply")) {
				List<BoardReplyBean> replylist = boardService.actionReadBoardReply(code);
				mav.addObject("replylist", replylist);

			}
			return mav;
		}

		// 관리자페이지 게시판 업데이트
		@Override
		public ModelAndView actionAdminBoardUpdate(BoardBean board) {
			int result = dao.updateBoard(board);
			mav = boardService.actionBoardView(board.getBoard_code());
			return mav;
		}
		
		// ----------------------Ajax-------------------------------
		// 아이디 중복 체크 ajax
		@Override
		public JSONObject actionIdCheck(String user_id) {
			int cnt = dao.userIdCheck(user_id);
			JSONObject json = new JSONObject();
			json.put("result", cnt);
			return json;
		}

		// 로그인 전 확인 ajax
		@Override
		public JSONObject actionLoginCheck(String user_id, String user_password) {
			UserBean user = dao.userLogin(user_id);
			user.setUser_password(user.getUser_password().toLowerCase());
			user_password = dao.getSHA256(user_password);
			JSONObject json = new JSONObject();

			if (user.getUser_password().equals(user_password)) {
				json.put("result", "true");
			} else {
				json.put("result", "false");
			}
			return json;
		}

		// 비밀번호 찾기 ajax
		@Override
		public JSONObject findPasswordCheck(String user_id, String user_email) {
			JSONObject json = new JSONObject();
			if (dao.userContent(user_id) != null) {
				UserBean userBean = dao.userContent(user_id);
				if (userBean.getUser_email().equals(user_email)) {
					String key = sendEmail(userBean);
					json.put("result", key);
					return json;
				}
			}
			json.put("result", "fail");
			return json;
		}

		// 아이디 찾기 ajax
		@Override
		public JSONObject findIdCheck(String user_name, String user_email) {
			JSONObject json = new JSONObject();
			UserBean user = new UserBean();
			user.setUser_name(user_name);
			user.setUser_email(user_email);
			String id = dao.findUserId(user);
			if (id != null) {
				json.put("result", id);
			} else {
				json.put("result", "fail");
			}

			return json;
		}


}
