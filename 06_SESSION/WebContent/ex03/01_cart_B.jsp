<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	User user = new User(id, pw);
    	
    	Map<String, String> map = new HashMap<>();
    	map.put("user1", "1111");
    	map.put("user2", "1111");
    	map.put("user3", "1111");
    	
    	if (session.getAttribute("loginUser") == null) {	// 비로그인 상태면
    		if (map.containsKey(user.getId())) {
    			if (map.get(user.getId()).equals(user.getPw())) {
    				session.setAttribute("loginUser", user);
    			} else {	// 로그인 실패(비밀번호가 틀림)
    				response.sendRedirect("/06_SESSION/ex03/01_cart_A.jsp");
    			}
    		} else {	// 로그인 실패(아이디가 틀림)
    			response.sendRedirect("/06_SESSION/ex03/01_cart_A.jsp");
    		}
    	}
    	
    %>
    
    <%-- 로그인에 성공한 경우에만 아래 태그를 볼 수 있다 --%>
    
    <form action="/06_SESSION/ex03/01_cart_C.jsp">
    	<h3>상품 선택</h3>
    	<select name="product">
    		<option value="티비">티비</option>
    		<option value="오디오">오디오</option>
    		<option value="세탁기">세탁기</option>
    		<option value="건조기">건조기</option>
    		<option value="냉장고">냉장고</option>
    	</select>
    	<input type="text" name="quantity" />개
    	<button>장바구니에 추가</button>
    	
    </form>