package com.web.zoomIn.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.bean.BoardBean;
import com.web.zoomIn.bean.BoardReplyBean;

public interface BoardService {
	

	// -------------게시판-----------//
	ModelAndView actionBoardInsert(BoardBean boardbean);

	ModelAndView actionBoardView(int board_code);

	ModelAndView actionBoardUpdate(BoardBean board);

	ModelAndView actionBoardDelete(int board_code);

	JSONObject actionReadCheck(String user_id, int board_code);

	void boardViewUp(int board_code);

	// ---------------게시판 댓글 ---------------//
	List<BoardReplyBean> actionReadBoardReply(int board_code);

	ModelAndView actionBoardReplyInsert(BoardReplyBean boardreplybean);

	ModelAndView actionBoardReplyUpdate(BoardReplyBean boardreplybean);

	ModelAndView actionBoardReplyDelete(int reply_code, int board_code);

	int boardReplyCount(int board_code);

}
