package command.guest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GuestDao;
import dto.GuestDto;

public class QueryListCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String query = request.getParameter("query");
		
		List<GuestDto> list = GuestDao.getInstance().queryList(query);
		request.setAttribute("list", list);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestListPage.jsp");
		pathNRedirect.setRedirect(false); // request를 보내야하기 때문에 forward처리한다.
		
		return pathNRedirect;
	}

}
