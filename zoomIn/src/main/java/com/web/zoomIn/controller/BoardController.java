package com.web.zoomIn.controller;

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

import com.web.zoomIn.bean.BoardBean;
import com.web.zoomIn.bean.BoardReplyBean;
import com.web.zoomIn.service.BoardService;
import com.web.zoomIn.service.UserService;

@Controller
public class BoardController {
	ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;
	@Autowired
	UserService userService;

	// 게시판 상세 페이지
	@RequestMapping(value = "/boardUpdate")
	public ModelAndView boardUpdate(@RequestParam String menu, @RequestParam int board_code) throws Exception {
		mav = userService.moveUserMenu(menu, board_code);
		return mav;
	}

	// ---------------------게시판 -------------------------

	// 게시물 작성
	@RequestMapping(value = "/actionBoardInsert")
	public ModelAndView actionBoardInsert(@ModelAttribute BoardBean boardbean) throws Exception {
		mav = boardService.actionBoardInsert(boardbean);
		return mav;
	}

	// 게시물 읽기
	@RequestMapping(value = "/actionBoardView")
	public ModelAndView actionBoardView(@RequestParam("board_code") int board_code) throws Exception {
		mav = boardService.actionBoardView(board_code);
		boardService.boardViewUp(board_code);
		return mav;
	}

	// 게시물 수정
	@RequestMapping(value = "/actionBoardUpdate")
	public ModelAndView actionBoardUpdate(@ModelAttribute BoardBean board) throws Exception {
		mav = boardService.actionBoardUpdate(board);
		return mav;

	}

	// 게시글 삭제
	@RequestMapping(value = "/actionBoardDelete")
	public ModelAndView actionBoardDelete(@RequestParam("board_code") int board_code) throws Exception {
		mav = boardService.actionBoardDelete(board_code);
		return mav;

	}

	// 댓글 작성
	@RequestMapping(value = "/actionBoardReplyInsert")
	public ModelAndView actionBoardReplyInsert(@ModelAttribute BoardReplyBean boardReplyBean) throws Exception {
		mav = boardService.actionBoardReplyInsert(boardReplyBean);
		return mav;
	}

	// 댓글 수정
	@RequestMapping(value = "/actionBoardReplyUpdate")
	public ModelAndView actionBoardReplyUpdate(@ModelAttribute BoardReplyBean boardReplyBean) throws Exception {
		mav = boardService.actionBoardReplyUpdate(boardReplyBean);
		return mav;
	}

	// 댓글 삭제

	@RequestMapping(value = "/actionBoardReplyDelete")
	public ModelAndView actionBoardReplyDelete(@RequestParam("reply_code") int reply_code,
			@RequestParam("board_code") int board_code) throws Exception {
		mav = boardService.actionBoardReplyDelete(reply_code, board_code);
		return mav;
	}

	// -------------------ajax-------------------------
	// 게시글 읽기 가능여부 확인
	@ResponseBody
	@RequestMapping("/actionReadCheck")
	public String actionReadCheck(@RequestParam String user_id, @RequestParam int board_code) throws Exception {
		JSONObject json = boardService.actionReadCheck(user_id, board_code);
		return json.toString();
	}

}
