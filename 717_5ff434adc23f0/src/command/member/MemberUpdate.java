package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;


@WebServlet("/MemberUpdate")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberUpdate() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mNo = request.getParameter("mNo");
		String mName = request.getParameter("mName");
		String mEmail = request.getParameter("mEmail");
		String mPhone = request.getParameter("mPhone");
		String mAddress = request.getParameter("mAddress");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setmNo(Integer.parseInt(mNo));
		memberDto.setmName(mName);
		memberDto.setmEmail(mEmail);
		memberDto.setmPhone(mPhone);
		memberDto.setmAddress(mAddress);
				
		int result = MemberDao.getInstance().update(memberDto);
		
		// 결과 JSON
		// {"result": true}
		// {"result": false}
		JSONObject responseObj = new JSONObject();
		if (result > 0) {
			// session에 올라간 loginDto를 제거하고 새 loginDto를 올린다.
			HttpSession session = request.getSession();
			if (session.getAttribute("loginDto") != null) {
				session.removeAttribute("loginDto");
				MemberDto loginDto = MemberDao.getInstance().selectBymEmail(mEmail);
				session.setAttribute("loginDto", loginDto);
			}
			responseObj.put("result", true);
		} else {
			responseObj.put("result", false);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(responseObj);
		out.close();
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
