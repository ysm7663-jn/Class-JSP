package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;

public class MemberLogoutCommand implements MemberCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {

		/* 로그아웃은 session을 비워주면 된다. */
		HttpSession session = request.getSession(); // 세션 알아내기
		
		if(session.getAttribute("loginDto") != null) { // loginDto가 아직 session에 남아있다면
			session.invalidate(); 					   // 세션을 초기화 한다.
			// session이 비어있으면 null이 아닌 ''로 비교해야한다.
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("index.jsp");
		pathNRedirect.setRedirect(true); // redirect 
		
		return pathNRedirect;
	}

}
