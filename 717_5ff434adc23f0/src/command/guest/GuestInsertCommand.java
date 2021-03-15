package command.guest;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.PathNRedirect;
import dao.GuestDao;
import dto.GuestDto;

public class GuestInsertCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String directory = "storage";
		String realPath = request.getServletContext().getRealPath(directory);
		
		File dir = new File(realPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		MultipartRequest multipartRequest = null;
		GuestDto guestDto = null;
		try {
			multipartRequest = new MultipartRequest(request, realPath, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			guestDto = new GuestDto();
			guestDto.setgWriter( multipartRequest.getParameter("gWriter") );
			guestDto.setgTitle( multipartRequest.getParameter("gTitle") );
			guestDto.setgContent( multipartRequest.getParameter("gContent") );
			guestDto.setgPw( multipartRequest.getParameter("gPw") );
			if (multipartRequest.getFile("gFilename") == null) {
				guestDto.setgFilename("");
			} else {
				guestDto.setgFilename(multipartRequest.getFilesystemName("gFilename"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int result = GuestDao.getInstance().guestInsert(guestDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestInsertResult.jsp?result=" + result);
		pathNRedirect.setRedirect(true);  // redirect
		return pathNRedirect;
		
	}

}
