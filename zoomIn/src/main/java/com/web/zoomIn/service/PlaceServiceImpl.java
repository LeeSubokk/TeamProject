package com.web.zoomIn.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.web.zoomIn.DAO.ZoomInDAO;
import com.web.zoomIn.bean.PlaceBean;
import com.web.zoomIn.bean.PlaceKeywordBean;
import com.web.zoomIn.bean.PlaceReplyBean;
@Service
public class PlaceServiceImpl implements PlaceService {

	@Inject
	ZoomInDAO dao;
	@Inject
	UserServiceImpl userService;

	ModelAndView mav;
	private static final Logger logger = LoggerFactory.getLogger(PlaceServiceImpl.class);

	// -------------------------------플레이스------------------------------------------//

	// 카테고리 정렬
	@Override
	public ModelAndView placeArrange(String menu, String method) {
		mav = userService.setView(menu);
		List<PlaceBean> placeList = new ArrayList<PlaceBean>();
		if (method.equals("grade")) {
			placeList = dao.placeListGradeDesc();
		}
		if (method.equals("view")) {
			placeList = dao.placeListViewDesc();
		}
		if (method.equals("reply")) {
			placeList = dao.placeListReplyDesc();
		}

		List<PlaceKeywordBean> keywords = dao.placeKeywordSelectAll();
		mav.addObject("keywords", keywords);
		mav.addObject("placeList", placeList);
		mav.addObject("placeCnt", placeList.size());

		return mav;
	}

	// 플레이스 글 작성
	@Override
	public ModelAndView actionPlaceInsert(PlaceBean place) {
		int result = dao.placeInsert(place);
		mav = userService.moveAdminMenu("placeList");
		return mav;
	}

	// 플레이스 글 삭제
	@Override
	public ModelAndView actionPlaceDelete(int place_code) {
		dao.placeReplyAllDelete(place_code);
		int result = dao.placeDelete(place_code);

		mav = userService.moveAdminMenu("placeUpdate");
		return mav;
	}

	// 플레이스 업데이트
	@Override
	public ModelAndView actionPlaceUpdate(PlaceBean place) {
		int result = dao.placeUpdate(place);
		mav = userService.moveAdminMenu("placeUpdate");
		return mav;
	}

	// 플레이스 댓글 전체 읽어오기
	@Override
	public List<PlaceReplyBean> actionReadPlaceReply(int place_code) {
		List<PlaceReplyBean> replys = dao.placeReplyList(place_code);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 a HH:mm:ss");
		for (PlaceReplyBean placeReplyBean : replys) {
			placeReplyBean.setReply_date_toString(dateFormat.format(placeReplyBean.getReply_date()));
		}
		return replys;
	}

	// 플레이스 조회수
	@Override
	public void placeViewUp(int place_code) {
		dao.placeViewUp(place_code);
	}

	// 플레이스 댓글 작성
	@Override
	public ModelAndView actionPlaceReplyInsert(PlaceReplyBean placeReplyBean) {
		if (!(placeReplyBean.getUser_id() == null || placeReplyBean.getReply_content() == null)) {
			int result = dao.placeReplyInsert(placeReplyBean);
			PlaceBean place = dao.placeContent(placeReplyBean.getPlace_code());
			place.setPlace_grade_avg(dao.getPlaceGradeAvg(place.getPlace_code()));
			dao.placeGradeAvg(place);
			dao.placeReplyCntUp(place.getPlace_code());
		}

		mav = userService.moveUserMenu("spot-detail", placeReplyBean.getPlace_code());
		return mav;
	}

	// 플레이스 댓글 업데이트
	@Override
	public ModelAndView actionPlaceReplyUpdate(PlaceReplyBean placeReplyBean) {
		int result = dao.placeReplyUpdate(placeReplyBean);
		mav = userService.moveUserMenu("spot-detail", placeReplyBean.getPlace_code());
		return mav;
	}

	// 플레이스 댓글 삭제
	@Override
	public ModelAndView actionPlaceReplyDelete(int reply_code, int place_code) {
		int result = dao.placeReplyDelete(reply_code);
		PlaceBean place = dao.placeContent(place_code);
		dao.placeReplyCntDown(place_code);
		if (dao.placeReplyCount(place_code) != 0) {
			place.setPlace_grade_avg(dao.getPlaceGradeAvg(place_code));
		} else {
			place.setPlace_grade_avg(0);
		}
		mav =userService.moveUserMenu("spot-detail", place_code);
		return mav;
	}
	@Override
	// 플레이스 댓글 갯수
	public int placeReplyCount(int place_code) {
		return dao.placeReplyCount(place_code);
	}

	// ------------------------플레이스 키워드 -------------------/
	@Override
	public List<PlaceKeywordBean> actionPlaceKeywordSelect(int place_code) {
		List<PlaceKeywordBean> keywords = dao.placeKeywordSelect(place_code);
		return keywords;
	}

	@Override
	public ModelAndView actionPlaceKeywordInsert(PlaceKeywordBean placeKeywordBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView actionPlaceKeywordUpdate(PlaceKeywordBean placeKeywordBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView actionPlaceKeywordDelete(int place_keyword_code, int place_code) {
		// TODO Auto-generated method stub
		return null;
	}

}
