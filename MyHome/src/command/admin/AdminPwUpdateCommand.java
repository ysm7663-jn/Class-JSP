package command.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.AdminDao;

public class AdminPwUpdateCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String page = request.getParameter("page");
		String strmNo = request.getParameter("mNo");
		int mPw = Integer.parseInt(request.getParameter("mPw"));
		
		int no = Integer.parseInt(request.getParameter("mNo"));
		int mNo = (no - 1); 
		
		int result = AdminDao.getInstance().adminPwUpdate(mNo);
		
		PathNRedirect pathNRedirect = null;
		
		request.setAttribute("page", page);
		request.setAttribute("mNo", mNo);
		
		if(result > 0) {
			// 비밀번호 변경이 성공했을 경우
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("admin/adminMemberPwUpdateResult.jsp?page=" + page + "&result=" + result);
			pathNRedirect.setRedirect(true);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 변경되지 않았습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return pathNRedirect;
	}

}
