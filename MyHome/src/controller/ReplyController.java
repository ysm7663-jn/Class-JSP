package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.bbs.BBSCommand;
import command.reply.RePlyDeleteCommand;
import command.reply.RePlyInsertCommand;
import command.reply.ReplyCommand;
import common.PathNRedirect;

@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReplyController() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		
		ReplyCommand command = null;
		
		
		try {
			
			switch (cmd) {
			// command 필요 // 이제 모든 command의 예외처리는 controller이 담당한다.
			case "/replyInsert.reply":
				command = new RePlyInsertCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/replyDelete.reply":
				command = new RePlyDeleteCommand();
				pathNRedirect = command.execute(request, response);
				break;
			// 단순 이동
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String path = pathNRedirect.getPath();
		boolean isRedirect = pathNRedirect.isRedirect();
		if (isRedirect) {
			response.sendRedirect(path);
		} else {
			request.getRequestDispatcher(path).forward(request, response);
		}
    
    }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}