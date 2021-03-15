package command;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import common.PathNRedirect;

public class GetImageCaptchaCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 네이버 캡차 API
		// 1. 캡차 키 발급 요청 (우리가 네이버에게 요청)
		// 	1) 네이버에 캡차 키 발급 요청을 한다.
		//  2) Client ID, Client Secret (요청헤더 : requestHeader)에 포함
		// 		1) Client ID : Nw8byVywd3JzMIJwyh9W
		//		2) Client PW : XmgEByjr02
		// 	3) 발급에 성공하면
		//		1) {"key":"8exrKuFtbwArTQVu"} JSON 데이터를 받는다.
		//  4) main > execute로 사용 > get 메소드 사용(별도로 생성)
		
		// 2. 캡차 이미지 발급 요청 (우리가 네이버에게 요청)
		// 	1) 네이버에 캡차 이미지 발급 요청을 한다.
		// 	2) Client ID, Client Secret (요청헤더 : requestHeader)에 포함
		//  3) 발급 받은 캡차 키 {"key":"8exrKuFtbwArTQVu"}를 보내 준다.
		// 	4) 이미지를 발급 받는다.
		
		
		// 1) 캡차 키 발급 요청하기
		String clientId = "Nw8byVywd3JzMIJwyh9W"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "XmgEByjr02"; 	  //애플리케이션 클라이언트 시크릿값";
        
        String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);
        // System.out.println(responseBody);
        // 실행결과 console : {"key":"8exrKuFtbwArTQVu"}

        // responseBody는 {"key":"8exrKuFtbwArTQVu"}와 같은 형식의 JSON 데이터
        // 요청시마다 변경됨
        
        // json-simple-1.1.1.jar를 이용해서 responseBody에서 "8exrKuFtbwArTQVu" 를 뺀다.
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
        	obj = (JSONObject)parser.parse(responseBody);
        } catch (ParseException e) {
        	e.printStackTrace();
        }
        
        // 입력값 비교(InputKeyCheckCommand)에서 캡차 키를 필요로하므로 ,
        // session에 올려 둔다.
        // session은 request에서 알아낸다.
        HttpSession session = request.getSession();
        session.setAttribute("key", (String)obj.get("key"));
        
        // 2) 캡차 이미지 요청하기
        String key = (String)obj.get("key"); // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
        String apiURL2 = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
        /*
         * 	requestHeader는 1) 캡차 키 발급 요청에서 이미 생성했으므로 또 생성할 필요가 없다.
         * 
        	Map<String, String> requestHeaders = new HashMap<>();
        	requestHeaders.put("X-Naver-Client-Id", clientId);
        	requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        */
        
        // responseBody2
        // 1) 성공 : 이미지 캡차가 생성되었습니다.
        // 2) 실패 : 
        // String responseBody2 = get2(apiURL2,requestHeaders);
        
        // 성공했을 때는 캡차 이미지 파일이 생성되므로 파일명을 알아야 한다.
        // responseBody2 > filename
        String filename = get2(request, apiURL2,requestHeaders);

        // System.out.println(filename);
        // 1608537402266 (파일명)
        
        PathNRedirect pathNRedirect = new PathNRedirect();
        pathNRedirect.setPath("login/loginPage.jsp");
        pathNRedirect.setRedirect(false);	// request에 realPath, filename 저장되어 있으므로 forward
        
		return pathNRedirect;
	}
	
	// 키 발급 get
		private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }
	
	// 키 발급, 사진 발급이 동일
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
    
    // 키 발급 요청 readBody
    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
    
    // 사진 발급 요청용 get2
 	private static String get2(HttpServletRequest request, String apiUrl, Map<String, String> requestHeaders){
         HttpURLConnection con = connect(apiUrl);
         try {
             con.setRequestMethod("GET");
             for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                 con.setRequestProperty(header.getKey(), header.getValue());
             }

             int responseCode = con.getResponseCode();
             if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
            	 // getImage()에 request를 전달하려면 get2 메소드가 HttpServletRequest request를 받아와야 한다.
            	 // 기존 : (String apiUrl, Map<String, String> requestHeaders)
            	 // 수정 : (HttpServletRequest request, String apiUrl, Map<String, String> requestHeaders)
                 return getImage(request, con.getInputStream());
             } else { // 에러 발생
                 return error(con.getErrorStream());
             }
         } catch (IOException e) {
             throw new RuntimeException("API 요청과 응답 실패", e);
         } finally {
             con.disconnect();
         }
     }
    
 	// 캡차 이미지 요청용 getImage 메소드
    private static String getImage(HttpServletRequest request, InputStream is){
        int read;
        byte[] bytes = new byte[1024];
        // 랜덤한 이름으로  파일 생성 (x)
        // 현재 시간: timestamp으로 파일 생성 (0)
        String filename = Long.valueOf(new Date().getTime()).toString();
        
        // 캡차 이미지가 저장될 storage 디렉토리의 경로를 알아낸다.
        // 폴더만 존재
        String directory = "storage";
        
        // HttpServletRequest request가 있어야 realPath를 구할 수 있다.
        // 따라서 execute() 메소드에게서 HttpServletRequest request를 받아 온다. 
        // 기존 : getImage(InputStream is) { ... }
        // 수정 : getImage(HttpServletRequest request, InputStream is) { ... }  
        String realPath = request.getServletContext().getRealPath(directory);
        
        // 리디렉터리
        File dir = new File(realPath);	// File dir에는 storage 디렉토리 정보가 저장된다.
        
        // storage 디렉토리가 안 생기면 강제로 만들어 주는 코드
       if ( !dir.exists() ) {	// dir(storage 디렉토리)이 없으면
    	   dir.mkdirs();	// 해당 디렉토리(storage 디렉토리)를 생성하라.
       } 

       // storage 디렉토리 경로를 포함하도록 File f를 수정한다.
        // 기존 : File f = new File(filename + ".jpg");
        // 수정 : File f = new File(realPath, filename + ".jpg");
        File f = new File(realPath, filename + ".jpg");
        
        try(OutputStream outputStream = new FileOutputStream(f)){
            f.createNewFile();
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            
            // directory(상대경로)와 filename을 JSP(로그인 화면)에서 확인할 수 있도록
            // request에 저장해 둔다.
            // GetImageCaptchaCommand의 execute() 메소드는 PathNRedirect를 반환하는데,
            // 이 때 반환 방법은 forward이다. (request의 데이터를 유지를 위해서)
            request.setAttribute("filename", filename + ".jpg");
            request.setAttribute("directory", directory);
            
            // return "이미지 캡차가 생성되었습니다.";
            return filename;
        } catch (IOException e) {
            throw new RuntimeException("이미지 캡차 파일 생성에 실패 했습니다.",e);
        }
    }
    
    // 캡차 이미지 요청용 error 메소드
    private static String error(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
}
