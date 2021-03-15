package command.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.ReplyDao;

public class RePlyDeleteCommand implements ReplyCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// request로 넘어오는 rNo에 번호가 담겨있는지없는지 여부 확인
		String strrNo = request.getParameter("rNo");
		int rNo = 0;
		if(strrNo != null && !strrNo.isEmpty()) {
			// 넘어오는 rNo에 번호가 있으면 rNo에 파라미터값을 넣어준다.
			rNo = Integer.parseInt(strrNo);
		}
		// BBSViewPageCommand에 보낼 파라미터들(해당 댓글페이지의 해당번호에달린 댓글삭제를 위해서)
		String bbs_no = request.getParameter("bbs_no");
		String page = request.getParameter("page");
		
		int result = ReplyDao.getInstance().replyDelete(rNo);
		
		PathNRedirect pathNRedirect = null;
		
		if(result > 0) {
			pathNRedirect = new PathNRedirect();
			// 1. 그 동안 했던 방식 (패턴을 지키는 방식 별도의 script페이지를 만들어서 확인 후 이동시켰다)
		    // pathNRedirect.setPath(bbsViewResult.jsp);
			// bbsViewResult.jsp에서 / bbsViewPage.bbs로 이동
			
			// 커맨드에서 컨트롤러로 거쳐서 디비확인 후 업데이트된내용을 view에서 보여준다.
			
			// 2. 곧바로 DB를 거치도록 이동 (/bbsViewPage.bbs로 이동 jsp X)
			// 삭제된 내용을 BBSViewCommand에서 새로내용을 업데이트해서 볼 수 있도록
			// 기존에 jsp로 가는게 아닌 새로 session올려서 replyDto에서 다시꺼내서본다.
			pathNRedirect.setPath("/MyHome/bbsViewPage.bbs?bbs_no=" + bbs_no + "&page=" + page);
			pathNRedirect.setRedirect(true); // redirect(삭제후 이동)
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글을 삭제할 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}

		return pathNRedirect;
	}

}
