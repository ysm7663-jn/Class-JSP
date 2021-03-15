package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.PageVo;
import dto.BBSDto;
import mybatis.config.DBService;

public class BBSDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private BBSDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BBSDao bbsDao = new BBSDao();
	public static BBSDao getInstance() {
		return bbsDao;
	}
	
	// 메소드
	
	// insert,delete,update 는 resultType="int"이고 굳이 안적어도되고
	public int getTotalRecord() {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.bbs.getTotalRecord");
		ss.close();
		return totalRecord;
	}
	public List<BBSDto> bbsList(PageVo pageVo) {
		SqlSession ss = factory.openSession();
		List<BBSDto> list = ss.selectList("mybatis.mapper.bbs.bbsList", pageVo);
		ss.close();
		return list;
	}
	public int bbsInsert(BBSDto bbsDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.bbs.bbsInsert", bbsDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 게시물 하나를 알아내기때문에 BBSDto로 반환타입 설정
	// 결과를 하나만 알아오기 위해서 selectOne() 메소드 활용
	// parameterType="int" / resultType="dto.BBSDto"
	public BBSDto bbsView(int bbs_no) {
		SqlSession ss = factory.openSession();
		BBSDto bbsDto = ss.selectOne("mybatis.mapper.bbs.bbsView", bbs_no);
		ss.close();
		return bbsDto;
	}
	
	// no에 따른 bbs_hit(조회수 증가하기)
	// result가 1이면 성공 0이면 실패
	public int bbsUpdateHit(int bbs_no) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.bbs.bbsUpdateHit", bbs_no);
		if(result > 0) {
			ss.commit(); // 곧바로 DB에 반영시키기
		}
		ss.close();
		return result;
	}
	
	public int bbsDelete(int bbs_no) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.bbs.bbsDelete", bbs_no);
		if(result > 0) {
			ss.commit(); // 곧바로 DB에 반영시키기
		}
		ss.close();
		return result;
	}
	
	public int bbsUpdate(BBSDto bbsDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.bbs.bbsUpdate", bbsDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	
	
	
	
	
	
	
}