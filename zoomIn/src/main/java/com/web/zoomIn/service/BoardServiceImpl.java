package com.web.zoomIn.service;

import java.text.SimpleDateFormat;
import java.util.List;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.zoomIn.DAO.ZoomInDAO;
import com.web.zoomIn.bean.BoardBean;
import com.web.zoomIn.bean.BoardReplyBean;
import com.web.zoomIn.bean.UserBean;
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	ZoomInDAO dao;
	@Inject
	UserServiceImpl userService;

	ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	// --------------------고객센터 게시판----------------------//

	// 게시판 글 작성
	@Override
	public ModelAndView actionBoardInsert(BoardBean board) {
		int result = dao.boardInsert(board);
		mav = userService.moveUserMenu("serviceCenter");
		return mav;
	}

	// 게시판 글 상세
	@Override
	public ModelAndView actionBoardView(int board_code) {
		BoardBean board = dao.boardView(board_code);
		mav = userService.moveUserMenu("serviceCenter-boardView");
		mav.addObject("board", board);

		// 댓글 읽기
		List<BoardReplyBean> replys = actionReadBoardReply(board_code);
		mav.addObject("replys", replys);

		return mav;
	}

	// 게시판 글 수정
	@Override
	public ModelAndView actionBoardUpdate(BoardBean board) {
		int result = dao.updateBoard(board);
		mav = userService.moveUserMenu("serviceCenter");
		return mav;
	}

	// 게시판 글 삭제
	@Override
	public ModelAndView actionBoardDelete(int board_code) {
		dao.boardReplyAllDelete(board_code);
		int result = dao.deleteBoard(board_code);
		mav = userService.moveUserMenu("serviceCenter");
		return mav;
	}

	// 게시판 글 조회수 상승
	@Override
	public void boardViewUp(int board_code) {
		dao.boardViewUp(board_code);
	}

	// 게시글 읽기 권한 확인
	@Override
	public JSONObject actionReadCheck(String user_id, int board_code) {
		JSONObject json = new JSONObject();
		if (user_id.equals(dao.boardView(board_code).getUser_id())
				|| dao.userContent(user_id).getUser_grade().equals("admin")) {
			json.put("result", "true");
		} else {
			json.put("result", "false");
		}

		return json;
	}

	// -----------------------------댓글-----------------------------

	// 게시글 댓글 전체 읽어오기
	@Override
	public List<BoardReplyBean> actionReadBoardReply(int board_code) {
		List<BoardReplyBean> replys = dao.boardReplyList(board_code);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 a HH:mm:ss");
		for (BoardReplyBean boardReplyBean : replys) {
			boardReplyBean.setReply_date_toString(dateFormat.format(boardReplyBean.getReply_date()));
		}
		return replys;
	}

	// 댓글 작성
	@Override
	public ModelAndView actionBoardReplyInsert(BoardReplyBean boardreplybean) {
		int result = dao.boardReplyInsert(boardreplybean);
		dao.boardReplyCntUp(boardreplybean.getBoard_code());
		mav = actionBoardView(boardreplybean.getBoard_code());
		return mav;
	}

	// 댓글 수정
	@Override
	public ModelAndView actionBoardReplyUpdate(BoardReplyBean boardreplybean) {
		int result = dao.boardReplyUpdate(boardreplybean);
		mav = actionBoardView(boardreplybean.getBoard_code());
		return mav;
	}

	// 댓글 삭제
	@Override
	public ModelAndView actionBoardReplyDelete(int reply_code, int board_code) {
		int result = dao.boardReplyDelete(reply_code);
		dao.boardReplyCntDown(board_code);
		mav = actionBoardView(board_code);
		return mav;
	}

	// 댓글 갯수
	@Override
	public int boardReplyCount(int board_code) {
		return dao.boardReplyCount(board_code);
	}

}
