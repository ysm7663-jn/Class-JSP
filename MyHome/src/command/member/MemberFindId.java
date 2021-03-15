package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.MemberDto;

@WebServlet("/MemberFindId")
public class MemberFindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberFindId() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mEmail = request.getParameter("mEmail");
		
		// mEamil에는 memberDto가 가져온 회원의 정보가 있다.
		MemberDto memberDto = MemberDao.getInstance().selectBymEmail(mEmail);
		
		String responseText = null;
		// memberDto안에 회원정보가 없으면 no를 출력
		if (memberDto == null) {
			responseText = "no";
		} else {
			// memberDto안에 회원정보가 있으면
			// responseText안에는 찾아온 Id가 담겨있다.
			responseText = memberDto.getmId();
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
