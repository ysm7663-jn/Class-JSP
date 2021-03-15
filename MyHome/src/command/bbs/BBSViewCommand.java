package command.bbs;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BBSDao;
import dao.ReplyDao;
import dto.BBSDto;
import dto.ReplyDto;

public class BBSViewCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String str_bbs_no = request.getParameter("bbs_no");
		
		int bbs_no = 0;
		// 받아온 request가 null이 아니거나 공백이 아닌 경우
		// str_bbs_no의 받아온 request에 담긴 번호를 알아내는과정
		if (str_bbs_no != null && !str_bbs_no.isEmpty()) {
			bbs_no = Integer.parseInt(str_bbs_no);
		}
		
		BBSDto bbsDto = BBSDao.getInstance().bbsView(bbs_no);
		
		// 보고 있는 게시물인 bbsDto를 session에 올려 두면, 수정이나 삭제가 쉽다.
		// 이전에는 hidden으로 했지만 session에 올려두고 필요시 꺼내쓰면 된다.
		
		// 자바에서는 session을 알아내고 만들어서 써야한다.
		HttpSession session = request.getSession();
		session.setAttribute("bbsDto", bbsDto);
		
		// 보고 있는 게시물에 달려 있는 답변 목록을 가져오기(전체x 게시물)
		// 답변 목록을 session에 올려 둔다.
		List<ReplyDto> replyList = ReplyDao.getInstance().replyList(bbs_no);
		// request에 담으면 redirect로 인해 모두 사라지기 때문에 session에 저장 후 사용한다.
		session.setAttribute("replyList", replyList); // bbsViewPage.jsp에서도 사용 가능
		
		// 조회 수 증가하기(DAO로 가야한다.)
		// 처음으로 게시물을 열었을 때만(수정 후 다시 View로 되돌아 오는 경우 등을 제외하기 위함)  
		// 조회수를 증가시키기 위해서 추가 작업을 수행한다.
		// 처음 게시물을 열 때 session에 "open" 속성 값을 "yes"로 저장해 둔다.
		// (session에 "open" 속성이 없다면 처음 연 것이라고 볼 수 있다.)
		String open = (String) session.getAttribute("open");
		if (open == null) {
			// 처음 게시물을 열 때 session에 "open" 속성 값을 "yes"로 저장해 둔다.
			session.setAttribute("open", "yes");
			// session에 "open" 속성이 없다면 처음 연 것이라고 볼 수 있다.
			BBSDao.getInstance().bbsUpdateHit(bbs_no);// 0보다 크면 조회수 증가 / 0이면 실패
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();	
		
		if (bbsDto != null) {
			// 성공시 수행할 코드
			pathNRedirect.setPath("bbs/bbsViewPage.jsp?page=" + request.getParameter("page"));
			// 조회 수 증가를 위해 redirect로 설정
			// 이전에는 request에 담았기때문에 forward로 했었다.
			pathNRedirect.setRedirect(false); // forward

			// redirect : http://localhost:9090/MyHome/bbs/bbsViewPage.jsp?page=1
			// forward  : http://localhost:9090/MyHome/bbsViewPage.bbs?bbs_no=18&page=1
		} else {
			// 실패시 수행할 코드
			// PrintWriter 는 char기반
			// 응답 스트림
			// 예외 처리를 위에 설정해놨기 때문에 비교적 쉽게사용한다. 
			// 직접 try-catch를 여기서 하지 않고 throws Exception으로 예외를 던진다.
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('일치하는 게시물이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		return pathNRedirect;
		
	}

}
