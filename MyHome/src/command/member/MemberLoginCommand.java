package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.MemberDao;
import dto.MemberDto;

public class MemberLoginCommand implements MemberCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 변수명 설정 시 : DB는 _로 구분하기때문에 m_Id 이런식으로 변수명 설정한다.
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setmId(mId);
		memberDto.setmPw(mPw);
		
		// 로그인 한 회원 정보는 session에 올린다.
		MemberDto loginDto = MemberDao.getInstance().selectBymIdmPw(memberDto);
		
		// Dao에서 조회 후 조회내용이 xml에서 실행되어 정상적으로 리턴되어 memberDto에 실려서
		// loginDto에 mId,mPw가 실려있다면 로그인에 성공하면 session에 올린다.
		if(loginDto != null) {
			HttpSession session = request.getSession(); // session을 알아낸다.
			session.setAttribute("loginDto", loginDto);
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("member/loginResult.jsp");
		pathNRedirect.setRedirect(false); // forward (mId, mPw를 보낼 수 있다.)
										  // redirect를 하면 아이디,비번 다 지운다
		return pathNRedirect;
	}

}
