package com.web.zoomIn.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.bean.PlaceBean;
import com.web.zoomIn.bean.PlaceKeywordBean;
import com.web.zoomIn.bean.PlaceReplyBean;

public interface PlaceService {
	// --------------플레이스-------------------//
	ModelAndView actionPlaceInsert(PlaceBean placebean);

	ModelAndView actionPlaceUpdate(PlaceBean placeBean);

	ModelAndView actionPlaceDelete(int place_code);

	ModelAndView placeArrange(String menu, String method);

	void placeViewUp(int place_code);

	List<PlaceReplyBean> actionReadPlaceReply(int place_code);

	ModelAndView actionPlaceReplyInsert(PlaceReplyBean placeReplyBean);

	ModelAndView actionPlaceReplyUpdate(PlaceReplyBean placeReplyBean);

	ModelAndView actionPlaceReplyDelete(int reply_code, int place_code);
	
	int placeReplyCount(int place_code);
	// ------------------플레이스 키워드-------------------//

	List<PlaceKeywordBean> actionPlaceKeywordSelect(int place_code);

	ModelAndView actionPlaceKeywordInsert(PlaceKeywordBean placeKeywordBean);

	ModelAndView actionPlaceKeywordUpdate(PlaceKeywordBean placeKeywordBean);

	ModelAndView actionPlaceKeywordDelete(int place_keyword_code, int place_code);

}
