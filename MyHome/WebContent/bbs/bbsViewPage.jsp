<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- if나 for문 사용 시 taglib 등록해야한다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<jsp:include page="../template/header.jsp">
	<jsp:param value="게시물보기" name="title" />
</jsp:include>

<%-- session에 저장된 bbsDto를 사용하는 방법 --%>
<%-- 1. ${bbsDto} --%>
<%-- 2. ${sessionScopre.bbsDto} --%>

<div>

	<input type="button" value="수정하기" onclick="location.href='/MyHome/bbsUpdatePage.bbs?page=${param.page}'"/>
	<%-- 댓글이 있는 게시물은 삭제할 수 없고 없는 게시물만 삭제 가능코드 설정 --%>
	<input type="button" value="삭제하기" onclick="location.href='/MyHome/bbsDeletePage.bbs?page=${param.page}'"/>
	<%-- page는 session에 담지 않고 request로 계속이동하면서 param으로 담겨 있다. --%>
	<input type="button" value="목록으로이동하기" onclick="location.href='/MyHome/bbsListPage.bbs?page=${param.page}'"/>
	<br/><br/>
	
	제목<br/>
	${bbsDto.bbs_title}<br/><br/>
	
	작성자<br/>
	${bbsDto.bbs_writer}<br/><br/>
	
	작성IP<br/>
	${bbsDto.bbs_ip}<br/><br/>
	
	작성일자<br/>
	${bbsDto.bbs_date}<br/><br/>
	
	내용<br/>
	<pre>${bbsDto.bbs_content}</pre><br/><br/>
	
	<br/><hr/><br/>
	
	<%-- 댓글 작성 창 --%>
	<div>
		<form action="/MyHome/replyInsert.reply" method="post">
			
			
			<%-- BBS_NO에 댓글달기위해 해당번호(bbs_no)를 가지고 있는 외래키를 hidden으로 보낸다.--%>
			<input type="hidden" name="bbs_no" value="${bbsDto.bbs_no}" />
			<input type="hidden" name="page" value="${param.page}" />
			<button>댓글 등록하기</button><br/><br/>
			
			작성자<br/>
			<input type="text" name="rWriter" /><br/><br/>
			비밀번호<br/>
			<input type="password" name="rPw" /><br/><br/>
			내용<br/>
			<textarea rows="3" cols="40" name="rContent" placeholder="댓글은 마음의 창입니다. 고운말을 씁시당."></textarea>
		</form>
	</div>
	<br/><hr/><br/>
	
	<%-- 댓글 목록(replyList를 가져온다) --%>
	<%-- session에 replyList가 저장되어 있다. session도 EL표기법으로 사용가능하다. --%>
	<table>
		<tbody>
			<c:if test="${empty replyList}">
				<%-- 댓글 리스트가 없으면 --%>
				<tr>
					<td colspan="4">첫 댓글을 남겨주세요.</td>
				</tr>
			</c:if>
			<c:if test="${not empty replyList}">
				<%-- 댓글 리스트가 있으면 --%>
				<c:forEach var="replyDto" items="${replyList}">
					<tr>
						<td>${replyDto.rWriter}</td>
						<td>${replyDto.rContent}</td>
						<td>${replyDto.rDate}</td>
						<%-- 어떤 댓글을 지울지 파라미터로 rNo,bbs_no,page를 보낸다.(form이 없어서 파라미터로보낸다) --%>
						<td><a href="/MyHome/replyDelete.reply?rNo=${replyDto.rNo}&bbs_no=${replyDto.bbs_no}&page=${param.page}">x</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

</div>

<%@ include file="../template/footer.jsp" %>



