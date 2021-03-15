package command.bbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PageVo;
import common.PathNRedirect;
import dao.BBSDao;
import dto.BBSDto;

public class BBSListCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 1. PageVo 객체 생성
		PageVo pageVo = new PageVo();
		
		// 2. 전체 레코드의 개수 구하기
		int totalRecord = BBSDao.getInstance().getTotalRecord();
		pageVo.setTotalRecord(totalRecord);
		
		// 3. 전체 페이지의 개수 구하기
		pageVo.setTotalPage();
		
		// 4. 현재 페이지 번호 구하기
		// PageVo 클래스에는 page = 1로 되어 있다.
		String page = request.getParameter("page");
		if(page != null && !page.isEmpty()) {
			// 페이지가 있는 경우(현재페이지번호)
			pageVo.setPage(Integer.parseInt(page));
		}
		
		// 5. 현재 페이지의 시작 게시물 번호와 종료 게시물 번호 구하기
		// 전체 게시물은 20개이다. (totalRecord)
		// 한 페이지 당 게시물은 3개이다. (recordPerPage)
		// page = 1 인 경우 beginRecord = 1, endRecord = 3
		// page = 2 인 경우 beginRecord = 4, endRecord = 6
		// page = 3 인 경우 beginRecord = 7, endRecord = 9
		// page = 4 인 경우 beginRecord = 10, endRecord = 12
		// page = 5 인 경우 beginRecord = 13, endRecord = 15
		// page = 6 인 경우 beginRecord = 16, endRecord = 18
		// page = 7 인 경우 beginRecord = 19, endRecord = 21(실제로는 20임) 
		
		// page -1을 먼저 하고 페이지당 게시물을 곱해준다.
		int beginRecord = (pageVo.getPage() -1) * pageVo.getRecordPerPage() + 1;
		pageVo.setBeginRecord( beginRecord );
		int endRecord = pageVo.getBeginRecord() + pageVo.getRecordPerPage() - 1;
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
		pageVo.setEndRecord( endRecord );
		
		// 6. beginRecord ~ endRecord 사이의 목록만 가져오기(dao)
		List<BBSDto> list = BBSDao.getInstance().bbsList(pageVo);
		
		// 7. beginPage와 endPage 구하기
		// 한 블록당 페이지가 5개 포함된다. (pagePerBlock)
		// page번호가 =1~5인 경우 beginPage = 1, endPage = 5
		// page번호가 =6~10인 경우 beginPage = 6, endPage = 10
		// 실제로는 
		// page번호가 =6~7인 경우 beginPage = 6, endPage = 7
		
		// beginPage 구하기
		int beginPage = ((pageVo.getPage() -1) / pageVo.getPagePerBlock()) *  pageVo.getPagePerBlock() + 1; // page = 1~5 에서 -1 == 0~4 / pagePerBlock(5) *  pagePerBlock(5) + 1
		pageVo.setBeginPage(beginPage);
		// endPage 구하기
		int endPage = beginPage + pageVo.getPagePerBlock() -1;
		
		// endPage & pageVo.getTotalPage() 중 작은것 쓰면 된다.
		endPage = endPage < pageVo.getTotalPage() ? endPage : pageVo.getTotalPage(); 
		pageVo.setEndPage(endPage);
		
		// 8. session에 저장된 "open" 속성을 제거하기
		// 목록 보기는 게시물 보기가 끝난 것으로 본다.
		// "open"속성은 BBSViewCommand에 있다.
		HttpSession session = request.getSession();
		if(session.getAttribute("open") != null) {
			// session에 있는 "open"속성을 지워준다.
			session.removeAttribute("open"); 
		}
		
		
		// 9.bbs/bbsListPage.jsp로 전달할 데이터 저장하기
		request.setAttribute("list", list);
		request.setAttribute("pageVo", pageVo);
		
		// 10. bbs/bbsListPage.jsp로 이동하기
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("bbs/bbsListPage.jsp");
		pathNRedirect.setRedirect(false); // forward // request에 담는다.
		
		return pathNRedirect;
	}

}















