package com.web.zoomIn.DAO;

import java.security.MessageDigest;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.web.zoomIn.bean.BoardBean;
import com.web.zoomIn.bean.BoardReplyBean;
import com.web.zoomIn.bean.PlaceBean;
import com.web.zoomIn.bean.PlaceKeywordBean;
import com.web.zoomIn.bean.PlaceReplyBean;
import com.web.zoomIn.bean.UserBean;

@Repository
public class ZoomInDAO {
	private static final String namespace = "com.web.zoomIn.Mapper";
	private static final Logger logger = LoggerFactory.getLogger(ZoomInDAO.class);
	@Inject
	private SqlSession sqlSession;

	// -------------------------------------유저----------------------------------
	public UserBean userContent(String user_id) {
		return sqlSession.selectOne(namespace + ".userContent", user_id);

	}

	public UserBean userLogin(String user_id) {
		return sqlSession.selectOne(namespace + ".userLogin", user_id);

	}

	public List userList() {
		return sqlSession.selectList(namespace + ".userList");
	}

	public int insertUser(UserBean user) {
		int result = sqlSession.insert(namespace + ".insertUser", user);
		return result;
	}

	public int updateUser(UserBean user) {
		int result = sqlSession.update(namespace + ".updateUser", user);
		return result;
	}

	public int updateUserincludePassword(UserBean user) {
		int result = sqlSession.update(namespace + ".updateUserincludePassword", user);
		return result;
	}

	public int userIdCheck(String user_id) {
		int cnt = sqlSession.selectOne(namespace + ".userIdCheck", user_id);
		return cnt;
	}

	public String findUserId(UserBean user) {
		String id = sqlSession.selectOne(namespace + ".findUserId", user);
		return id;
	}

	// -------------------- 플레이스-----------------------------------//
	public List placeList() {
		return sqlSession.selectList(namespace + ".placeList");
	}

	public List placeListGradeDesc() {
		return sqlSession.selectList(namespace + ".placeListGradeDesc");
	}

	public List placeListReplyDesc() {
		return sqlSession.selectList(namespace + ".placeListReplyDesc");
	}

	public List placeListViewDesc() {
		return sqlSession.selectList(namespace + ".placeListViewDesc");
	}

	public PlaceBean placeContent(int place_code) {
		return sqlSession.selectOne(namespace + ".placeContent", place_code);
	}

	public int placeInsert(PlaceBean place) {
		int result = sqlSession.insert(namespace + ".placeInsert", place);
		return result;
	}

	public int placeUpdate(PlaceBean place) {
		int result = sqlSession.update(namespace + ".placeUpdate", place);
		return result;
	}

	public int placeDelete(int place_code) {
		int result = sqlSession.delete(namespace + ".placeDelete", place_code);
		return result;

	}

	public void placeViewUp(int board_code) {
		sqlSession.update(namespace + ".placeViewUp", board_code);
	}

	// 플레이스 평점 평균
	public void placeGradeAvg(PlaceBean placeBean) {
		sqlSession.update(namespace + ".placeGradeAvg", placeBean);
	}

	public double getPlaceGradeAvg(int place_code) {
		return sqlSession.selectOne(namespace + ".getPlaceGradeAvg", place_code);
	}

	public void placeReplyCntUp(int place_code) {
		sqlSession.update(namespace + ".placeReplyCntUp", place_code);
	}

	public void placeReplyCntDown(int place_code) {
		sqlSession.update(namespace + ".placeReplyCntDown", place_code);
	}

	// --------------------플레이스 댓글--------------------//

	// 댓글 전체 삭제
	public int placeReplyAllDelete(int place_code) {
		int result = sqlSession.delete(namespace + ".placeReplyAllDelete", place_code);
		return result;
	}

	// 댓글 보기
	public List<PlaceReplyBean> placeReplyList(int place_code) {
		return sqlSession.selectList(namespace + ".placeReplyList", place_code);
	}

	// 댓글 쓰기
	public int placeReplyInsert(PlaceReplyBean placeReply) {
		int result = sqlSession.insert(namespace + ".placeReplyInsert", placeReply);
		return result;
	}

	// 댓글 수정
	public int placeReplyUpdate(PlaceReplyBean placeReply) {
		int result = sqlSession.update(namespace + ".placeReplyUpdate", placeReply);
		return result;
	}

	// 댓글 삭제
	public int placeReplyDelete(int reply_code) {
		int result = sqlSession.delete(namespace + ".placeReplyDelete", reply_code);
		return result;
	}

	// 댓글 갯수
	public int placeReplyCount(int place_code) {
		int result = sqlSession.selectOne(namespace + ".placeReplyCount", place_code);
		return result;
	}

	// ---------------------플레이스 키워드-------------------------------//

	// 키워드 전체보기
	public List<PlaceKeywordBean> placeKeywordSelectAll() {
		return sqlSession.selectList(namespace + ".placeKeywordSelectAll");
	}

	// 키워드 보기
	public List<PlaceKeywordBean> placeKeywordSelect(int place_code) {
		return sqlSession.selectList(namespace + ".placeKeywordSelect", place_code);
	}

	// 키워드 쓰기
	public int placeKeywordInsert(PlaceKeywordBean placeKeywordBean) {
		int result = sqlSession.insert(namespace + ".placeKeywordInsert", placeKeywordBean);
		return result;
	}

	// 키워드 수정
	public int placeKeywordUpdate(PlaceKeywordBean placeKeywordBean) {
		int result = sqlSession.update(namespace + ".placeKeywordUpdate", placeKeywordBean);
		return result;
	}

	// 키워드 삭제
	public int placeKeywordDelete(int place_keyword_code) {
		int result = sqlSession.delete(namespace + ".placeKeywordDelete", place_keyword_code);
		return result;
	}

	// 키워드 전체 삭제
	public int placeKeywordAllDelete(int place_code) {
		int result = sqlSession.delete(namespace + ".placeKeywordAllDelete", place_code);
		return result;
	}

	// -------------------- 고객센터-----------------------------------//

	public int boardInsert(BoardBean board) {
		int result = sqlSession.insert(namespace + ".boardInsert", board);
		return result;
	}

	public BoardBean boardView(int board_code) {
		BoardBean result = sqlSession.selectOne(namespace + ".boardView", board_code);
		return result;
	}

	public int updateBoard(BoardBean board) {
		int result = sqlSession.update(namespace + ".boardUpdate", board);
		return result;
	}

	public int deleteBoard(int board_code) {
		int result = sqlSession.delete(namespace + ".boardDelete", board_code);
		return result;

	}

	public List boardList() {
		List<BoardBean> list = sqlSession.selectList(namespace + ".boardList");
		return list;
	}

	public void boardViewUp(int board_code) {
		sqlSession.update(namespace + ".boardViewUp", board_code);
	}

	public void boardReplyCntUp(int board_code) {
		sqlSession.update(namespace + ".boardReplyCntUp", board_code);
	}

	public void boardReplyCntDown(int board_code) {
		sqlSession.update(namespace + ".boardReplyCntDown", board_code);
	}

	// --------------------고객센터 댓글--------------------//

	// 댓글 전체 삭제
	public int boardReplyAllDelete(int board_code) {
		int result = sqlSession.delete(namespace + ".boardReplyAllDelete", board_code);
		return result;
	}

	// 댓글 보기
	public List<BoardReplyBean> boardReplyList(int board_code) {
		return sqlSession.selectList(namespace + ".boardReplyList", board_code);
	}

	// 댓글 쓰기
	public int boardReplyInsert(BoardReplyBean boardReply) {
		int result = sqlSession.insert(namespace + ".boardReplyInsert", boardReply);
		return result;
	}

	// 댓글 수정
	public int boardReplyUpdate(BoardReplyBean boardReply) {
		int result = sqlSession.update(namespace + ".boardReplyUpdate", boardReply);
		return result;
	}

	// 댓글 삭제
	public int boardReplyDelete(int reply_code) {
		int result = sqlSession.delete(namespace + ".boardReplyDelete", reply_code);
		return result;
	}

	// 댓글 갯수
	public int boardReplyCount(int board_code) {
		int result = sqlSession.selectOne(namespace + ".boardReplyCount", board_code);
		return result;
	}

	// ---------------------암호화---------------------------//
	public String getSHA256(String data) {
		String SHA = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(data.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			SHA = null;
		}
		return SHA;
	}
}
