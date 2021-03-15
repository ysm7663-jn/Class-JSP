package command.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.ReplyDao;
import dto.ReplyDto;

public class RePlyInsertCommand implements ReplyCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String rWriter = request.getParameter("rWriter");
		String rPw = request.getParameter("rPw");
		String rContent = request.getParameter("rContent");
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		ReplyDto replyDto = new ReplyDto();
		replyDto.setrWriter(rWriter);
		replyDto.setrPw(rPw);
		replyDto.setrContent(rContent);
		replyDto.setBbs_no(bbs_no);
		// IP는 여기서 직접 채운다
		replyDto.setrIp(request.getRemoteAddr()); // 요청한 사람의 IP주소
		
		int result = ReplyDao.getInstance().replyInsert(replyDto);
		
		PathNRedirect pathNRedirect = null;
		if(result > 0) {
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("/MyHome/bbsViewPage.bbs?bbs_no=" + bbs_no + "&page=" + request.getParameter("page"));
			pathNRedirect.setRedirect(true); // redirect
		} else {
			// 실패 시 별도의 페이지만들거나 이동없이 이곳에서
			// response를 통해 응답메시지를 준다.
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글이 작성되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return pathNRedirect;
	}

}

