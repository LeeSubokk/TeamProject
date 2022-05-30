package com.web.zoomIn.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.bean.PlaceBean;
import com.web.zoomIn.bean.PlaceReplyBean;
import com.web.zoomIn.service.PlaceService;
import com.web.zoomIn.service.UserService;

@Controller
public class PlaceController {
	ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(PlaceController.class);

	@Autowired
	PlaceService placeService;
	@Autowired
	UserService userService;

	// 장소 상세 페이지
	@RequestMapping(value = "/placeDetail")
	public ModelAndView detailPlace(@RequestParam String menu, @RequestParam int place_code) throws Exception {
		mav = userService.moveUserMenu(menu, place_code);
		placeService.placeViewUp(place_code);
		return mav;
	}

	// --------------------플레이스---------------------------

	// 플레이스 재정렬
	@RequestMapping(value = "/placeArrange")
	public ModelAndView placeArrange(@RequestParam String menu, @RequestParam String method) throws Exception {
		mav = placeService.placeArrange(menu, method);
		return mav;

	}

	// 플레이스 작성
	@RequestMapping(value = "/actionPlaceInsert")
	public ModelAndView actionPlaceInsert(@ModelAttribute PlaceBean placeBean) throws Exception {
		mav = placeService.actionPlaceInsert(placeBean);
		return mav;
	}

	// 플레이스 수정
	@RequestMapping(value = "/actionPlaceUpdate")
	public ModelAndView actionPlaceUpdate(@ModelAttribute PlaceBean placeBean) throws Exception {
		mav = placeService.actionPlaceUpdate(placeBean);
		return mav;

	}

	// 플레이스 삭제
	@RequestMapping(value = "/actionPlaceDelete")
	public ModelAndView actionPlaceDelete(@RequestParam("place_code") int place_code) throws Exception {
		mav = placeService.actionPlaceDelete(place_code);
		return mav;

	}

	// 댓글 작성
	@RequestMapping(value = "/actionPlaceReplyInsert")
	public ModelAndView actionPlaceReplyInsert(@ModelAttribute PlaceReplyBean placeReplyBean) throws Exception {
		mav = placeService.actionPlaceReplyInsert(placeReplyBean);
		return mav;
	}

	// 댓글 수정
	@RequestMapping(value = "/actionPlaceReplyUpdate")
	public ModelAndView actionPlaceReplyUpdate(@ModelAttribute PlaceReplyBean placeReplyBean) throws Exception {
		mav = placeService.actionPlaceReplyUpdate(placeReplyBean);
		return mav;
	}

	// 댓글 삭제
	@RequestMapping(value = "/actionPlaceReplyDelete")
	public ModelAndView actionPlaceReplyDelete(@RequestParam("reply_code") int reply_code,
			@RequestParam("place_code") int place_code) throws Exception {
		mav = placeService.actionPlaceReplyDelete(reply_code, place_code);
		return mav;
	}
}
