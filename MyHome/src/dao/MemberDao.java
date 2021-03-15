package dao;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
import mybatis.config.DBService;

public class MemberDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private MemberDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static MemberDao memberDao = new MemberDao();
	public static MemberDao getInstance() {
		return memberDao;
	}
	
	// 로그인하면 그 회원의모든정보를 가져오기 때문에 MemberDto타입으로 반환타입을 설저
	public MemberDto selectBymIdmPw(MemberDto memberDto) {
		SqlSession ss = factory.openSession();
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymIdmPw", memberDto);
		ss.close();
		return dto;
	}
	
	public MemberDto selectBymEmail(String mEmail) {
		SqlSession ss = factory.openSession();
		// selectOne는 이메일이 일치하는 사람은 1명이기때문에 one메소드를 사용한다.
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymEmail", mEmail);
		ss.close();
		return dto;
	}
	public MemberDto selectBymNo(String mNo) {
		SqlSession ss = factory.openSession();
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymNo", mNo);
		ss.close();
		return dto;
	}
	public MemberDto selectBymId(String mId) {
		SqlSession ss = factory.openSession();
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymId", mId);
		ss.close();
		return dto;
	}
	public int updatemPw(MemberDto memberDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.updatemPw", memberDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int update(MemberDto memberDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.update", memberDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int insert(MemberDto memberDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.member.insert", memberDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public int delete(String mNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.member.delete", mNo);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	
	
	
	
	
}