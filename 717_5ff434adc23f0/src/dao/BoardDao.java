package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardDto;
import mybatis.config.DBService;

public class BoardDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private BoardDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BoardDao boardDao = new BoardDao();
	public static BoardDao getInstance() {
		return boardDao;
	}
	
	// 메소드
	public int getTotalRecord() {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.board.getTotalRecord");
		ss.close();
		return totalRecord;
	}
	public List<BoardDto> boardList(Map<String, Integer> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.boardList", map);
		ss.close();
		return list;
	}
	public int boardInsert(BoardDto boardDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.boardInsert", boardDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public BoardDto boardView(int bNo) {
		SqlSession ss = factory.openSession();
		BoardDto boardDto = ss.selectOne("mybatis.mapper.board.boardView", bNo);
		ss.close();
		return boardDto;
	}
	public int boardUpdatebHit(int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.boardUpdatebHit", bNo);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int boardDelete(int bNo) {
		SqlSession ss = factory.openSession(false);
		// 실제로는 UPDATE를 시행
		int result = ss.update("mybatis.mapper.board.boardDelete", bNo);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int replyInsert(BoardDto replyDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.replyInsert", replyDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	/* 1단 댓글용 */
	/*
	public int replyUpdatebGroupOrd2(int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.replyUpdatebGroupOrd", bNo);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	*/
	/* 대댓글 */
	public int replyUpdatebGroupOrd(BoardDto boardDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.replyUpdatebGroupOrd", boardDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int getTotalQueryRecord(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.board.getTotalQueryRecord", map);
		ss.close();
		return totalRecord;
	}
	public List<BoardDto> queryBoardList(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.queryBoardList", map);
		ss.close();
		return list;
	}
	public int getTotalMyRecord(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.board.getTotalMyRecord", map);
		ss.close();
		return totalRecord;
	}
	public List<BoardDto> myBoardList(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.myBoardList", map);
		ss.close();
		return list;
	}
	
	
	
	
	
	
	
	

}