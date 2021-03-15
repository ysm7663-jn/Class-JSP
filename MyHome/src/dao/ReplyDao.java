package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.GuestDto;
import dto.MemberDto;
import dto.ReplyDto;
import mybatis.config.DBService;

public class ReplyDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private ReplyDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static ReplyDao replyDao = new ReplyDao();
	public static ReplyDao getInstance() {
		return replyDao;
	}
	
	// 메소드
	public int replyInsert(ReplyDto replyDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.reply.replyInsert", replyDto);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// select
	public List<ReplyDto> replyList(int bbs_no) {
		SqlSession ss = factory.openSession();
		List<ReplyDto> replylist = ss.selectList("mybatis.mapper.reply.replyList", bbs_no); 
		ss.close();
		return replylist;
	}
	
	// delete
	public int replyDelete(int rNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.reply.replyDelete", rNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	// 게시물의 번호(bbs_no)를 통해 게시물의 댓글개수 구하기
	public int replyCount(int bbs_no) {
		SqlSession ss = factory.openSession();
		// resultType은 selectOne이라서 한가지 정수만 구하기때문에 없다?
		int result = ss.selectOne("mybatis.mapper.reply.replyCount", bbs_no);
		ss.close();
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}