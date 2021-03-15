package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.AdminDao;
import dto.MemberDto;

public class AdminMemberUpdateCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String page = request.getParameter("page");
		String mId = request.getParameter("mId");
		String mName = request.getParameter("mName");
		String mPhone = request.getParameter("mPhone");
		String mEmail = request.getParameter("mEmail");
		String mAddress = request.getParameter("mAddress");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setmId(mId);
		memberDto.setmName(mName);
		memberDto.setmPhone(mPhone);
		memberDto.setmEmail(mEmail);
		memberDto.setmAddress(mAddress);
		
		// 업데이트 한 내용 저장되어 있음
		int result = AdminDao.getInstance().adminMemberUpdate(memberDto);
		
		String key = null;
		if(key != null) {
			HttpSession session = request.getSession();
			session.setAttribute("key", key);
			
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberUpdateResult.jsp?result=" + result);
		pathNRedirect.setRedirect(true);  // redirect
		return pathNRedirect;
		
	}

}
