package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dto.MemberDto;


@WebServlet("/MemberChangePw")
public class MemberChangePw extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberChangePw() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mPw = request.getParameter("mPw");
		String mNo = request.getParameter("mNo");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setmPw(mPw);
		memberDto.setmNo(Integer.parseInt(mNo)); // 회원번호는 unique속성이라 중복불가능
		
		int result = MemberDao.getInstance().updatemPw(memberDto);
		
		String responseText = null;
		if (result > 0) {
			HttpSession session = request.getSession();
			// session에 loginDto에 정보가 남아있는지 확인
			if(session.getAttribute("loginDto") != null) {
				
				
				/* 방법1. loginDto를 수정해서 다시 session에 올리는 방법 */
				MemberDto loginDto = (MemberDto)session.getAttribute("loginDto");
				loginDto.setmPw(mPw);
				session.removeAttribute("loginDto");
				session.setAttribute("loginDto", loginDto);
				
				/*
				방법2. 변경된 정보를 db에서 다시 가져와서 session에 올리는 방법
				session.invalidate(); 			     // 이건 사용금지(정보변경해도 session에 모든정보를지워버리기때문)
				session.removeAttribute("loginDto"); // 기존의 비밀번호 삭제
				MemberDto loginDto = MemberDao.getInstance().selectBymNo(mNo);
				session.setAttribute("loginDto", loginDto);
				*/
			}
			responseText = "yes";
		} else {
			responseText = "no";
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(responseText);
		out.close();
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}