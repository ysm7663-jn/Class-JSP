package ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01_response")
public class Ex01_response extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01_response() {
        super();
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 모든 코드 작성은 doGet()에서 진행합니다.
		
		// 사용자에게 보여 줄 응답(response)을 만듭니다.
		
		// 1. response에 content-type과 charset을 결정해 준다.
		// 	1) content-type: 어떤 데이터(파일)를 보여주는 것이지 그 타입을 작성
		//    (1) html : text/html
		//	  (2) css  : text/css
		//    (3) js   : text/javascript
		
		//  2) charset : 인코딩을 결정한다.
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		// 위 2개 코드는 한 줄로 작성해도 된다.
		// response.setContentType("text/html; charset=UTF-8");
		
		// 2. 출력스트림을 만듭니다.
		//	   출력스트림은 response를 이용해서 만듭니다.

		// 바이트스트림 vs 문자스트림 어느 것을 쓸까? >> 문자 스트림(html은 모두 문자로 구성되기 때문에)
		// 참고, Reader와 Writer로 끝나면 모두 문자스트림
		
		// 문자 기반 출력스트림
		// 1. FileWriter
		// 2. PrintWriter
		// 3. BufferedWriter
		
		PrintWriter out = response.getWriter();	
		
		// out 출력스트림은 print(), println(), printf() 등을 사용할 수 있습니다.
		// 이 중에서 가장 많이 사용되는 것은 println() 이다.
		// out으로 html 태그들을 만들어야 하니까 자동으로 줄이 바뀌는 것이 좋습니다.
		
		out.println("<!DOGTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>서블릿으로 만든 제목</title>");
		out.println("<style> h1{color:red;</style>");
		out.println("<script>alert('반갑습니다.')</script>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>안녕하세요</h1>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
