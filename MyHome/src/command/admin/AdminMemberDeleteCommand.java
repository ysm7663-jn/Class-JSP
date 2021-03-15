package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.AdminDao;

public class AdminMemberDeleteCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter("page");
		
		String strmNo = request.getParameter("mNo");
		int mNo = 0;
		if (strmNo != null && !strmNo.isEmpty()) {
			mNo = Integer.parseInt(strmNo);
		}
		
		/*
		// 방법 2.
		String strmNo = request.getParameter("mNo");
		if(strmNo == null || strmNo.isEmpty()) {
			strmNo = "0";
		}
		int mNo = Integer.parseInt(strmNo);
		*/	
		String mId = request.getParameter("mId");
		// 삭제시 회원이 작성했던 게시글을 먼저 지우고 회원삭제가 가능하기때문에
		// 해당 mId에 맞는 id에 있는 게시글을 먼저 지우고 아래 result문부터 실행한다.
		AdminDao.getInstance().adminMemberBoardDelete(mId);
		
		int result = AdminDao.getInstance().adminMemberDelete(mNo);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberDeleteResult.jsp?result=" + (result > 0) + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
		
	}

}
