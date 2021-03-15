package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		BoardDto boardDto = BoardDao.getInstance().boardView(bNo);
		
		HttpSession session = request.getSession();
		String open = (String)session.getAttribute("open");
		if(open == null || open.isEmpty()) {
			// 처음일 경우 open을 넣어준다.(yes) 
			// 해당게시글에 들어갔으니까 조회수도 증가시켜준다.
			session.setAttribute("open", "yes");
			BoardDao.getInstance().boardUpdatebHit(bNo); 
		} 
		
		request.setAttribute("boardDto", boardDto);
		request.setAttribute("result", boardDto != null);
		request.setAttribute("page", page);
		
		// boardViewPage.jsp에서 전체목록으로 이동할 때 사용할 주소 정보를 저장한다.
		// 검색한결과와 내용이 그대로 남아있기 위함
		String referer = request.getHeader("referer");
		request.setAttribute("referer", referer);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/boardViewPage.jsp");
		pathNRedirect.setRedirect(false); // forward
		return pathNRedirect;
	}

}
