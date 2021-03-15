package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.AdminDao;
import dto.MemberDto;

public class AdminSelectMemberDeleteCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter("page");
		String target = request.getParameter("target");
		
		String[] mNoList = target.split(","); // 넘어오는 target을 ,로 끊어서 넣는다.
		String[] mIdList = new String[mNoList.length];
		
		for(int i = 0; i< mNoList.length; i++) {
			// mNoList[i] : 각 회원 번호
			int mNo = Integer.parseInt(mNoList[i]);
			MemberDto memberDto = AdminDao.getInstance().selectMemberBymNo(mNo);
			mIdList[i] = memberDto.getmId();
		}
		
		int result = 0;
		for(int i = 0; i< mNoList.length; i++) {
			AdminDao.getInstance().adminMemberBoardDelete(mIdList[i]);
			int mNo = Integer.parseInt(mNoList[i]);
			// 멤버 삭제 성공시 1이나오는데 result에 성공시 1씩 누전된다.
			result += AdminDao.getInstance().adminMemberDelete(mNo);
		}
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberDeleteResult.jsp?result=" + (result == mNoList.length)  + "&page=" + page); // mNoList에 들어있는 값만큼 다 지웠다면 result도 숫자가 동일하다.
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
		
	}

}
