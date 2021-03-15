package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.AdminDao;
import dto.MemberDto;

public class AdminInsertMemberUpdateCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter("page");
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		String mName = request.getParameter("mName");
		String mPhone = request.getParameter("mPhone");
		String mEmail = request.getParameter("mEamil");
		String mAddress = request.getParameter("mAddress");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setmId(mId);
		memberDto.setmPw(mPw);
		memberDto.setmName(mName);
		memberDto.setmPhone(mPhone);
		memberDto.setmEmail(mEmail);
		memberDto.setmAddress(mAddress);
		
		int result = AdminDao.getInstance().adminMemberUpdate(memberDto);
		
		request.setAttribute("mId", mId);
		request.setAttribute("mPw", mPw);
		request.setAttribute("mName", mName);
		request.setAttribute("mPhone", mPhone);
		request.setAttribute("mEmail", mEmail);
		request.setAttribute("mAddress", mAddress);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberInsertResult.jsp?result=" + result + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
