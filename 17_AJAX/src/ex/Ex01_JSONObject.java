package ex;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex01_JSONObject {
	
	public static void main(String[] args) {
		
		// 예제로 사용할 JSON
		// {"name":"emily", "age":20, "isAdult" : true}
		
		// OpenAPI에서 받아온 데이터로 생각
		String strJSON =  "{\"name\":\"emily\", \"age\":20, \"isAdult\" : true}";
		
		// 사용할 라이브러리 : json-simple-1.1.1.jar
		// 라이브러리 역할 : JSON데이터를 JAVA의 Map으로 처리
		
		// 1. JSON Parser: 구문분석기 생성
		JSONParser parser = new JSONParser();
		
		// 2. JSON Object: parser가 분석한 결과를 저장할 객체
		JSONObject obj = null;
		
		// 3. parsing: 구문분석
		try {
			obj = (JSONObject) parser.parse(strJSON);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 4. JSON Object는 Map과 사용법이 같다.
		// JSONObject 클래스를 Map 인터페이스를 구현해서 만들었으므로 
		System.out.println(obj.get("name"));	// get("key")
		System.out.println(obj.get("age"));	// get("key")
		System.out.println((boolean)obj.get("isAdult") ? "성인" : "미성년자");	// get("key")
		
	}

}
