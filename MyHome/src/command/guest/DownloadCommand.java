package command.guest;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadCommand {

	// 컨트롤러에서 new DownloadCommand() 해서 객체를 만들 필요가 없도록 static 처리
	// DownloadCommand.download(request, response) 호출
	public static void download(HttpServletRequest request, HttpServletResponse response) {
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {
			String gFilename = request.getParameter("gFilename");
			String directory = "storage";
		
			String realPath = request.getServletContext().getRealPath(directory);
			
			File file = new File(realPath, gFilename);
			
			response.setHeader("Content-Type", "application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(gFilename,"UTF-8"));
			response.setHeader("Content-Length", file.length() + ""); // 타입이 둘다 String타입이어야 한다.
	
			bis = new BufferedInputStream( new FileInputStream(file)); // 읽어들일 입력파일
			bos = new BufferedOutputStream(response.getOutputStream());// 출력할 파일
			
			byte[] byteArray = new byte[1024];      // 1KB씩 읽어들일 예정
			while( (bis.read(byteArray)) != -1  ) { // 읽어들일 파일이 아직 남아있다면 // byteArray를 읽어들인다.
				bos.write(byteArray);
			}
		
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(bos != null) { bos.close(); }
				if(bis != null) { bis.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
