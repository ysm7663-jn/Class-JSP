<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="게시판목록" name="title" />
</jsp:include>

<script>
	// 게시판 검색
	function fn_queryBoardListPage(f) {
		if (f.query.value == '') {
			alert('검색어를 입력하세요.');
			f.query.focus();
			return;
		}
		f.action = '/MyHome/queryBoardListPage.board';
		f.submit();
	}
</script>

<%-- 1. 게시판 검색 --%>
<form>
	<select name="column">
		<option value="BTITLE">제목</option>
		<option value="BCONTENT">내용</option>
		<option value="MID">작성자</option>
		<option value="BOTH">제목+내용</option>
	</select>
	<input type="text" name="query" />
	<input type="button" value="검색" onclick="fn_queryBoardListPage(this.form)" />
</form>
<br/><br/>

<%-- 2. 게시판 작성(로그인 상태의 유저만 보인다.) --%>
<form>
	<input type="button" value="전체목록보기" onclick="location.href='/MyHome/boardListPage.board?page=${page}'" />
	<c:if test="${loginDto ne null}">
		<input type="button" value="내 게시글 보기" onclick="location.href='/MyHome/myBoardListPage.board?page=${page}'" />
		<input type="button" value="새 게시글 작성하기" onclick="location.href='/MyHome/boardInsertPage.board?page=${page}'" />
	</c:if>
</form>
<br/><br/>

<%-- 3. 게시판 목록 --%>
전체 ${totalRecord}개<br/>
<table border="1">
	<thead>
		<tr>
			<td>순번</td>
			<td>제목</td>
			<td>작성자</td>
			<td>최종수정일</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">작성된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="boardDto" items="${list}" varStatus="k">
					<tr>
						<td>${totalRecord - ((page - 1) * recordPerPage + k.index)}</td>
						
						<%-- 삭제된 게시글은 링크를 제공하지 않는다. --%>
						<c:if test="${boardDto.bDelete eq -1}">
							<td>삭제된 게시글입니다</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</c:if>
						<c:if test="${boardDto.bDelete eq 0}">
							<td>
								<!-- 1. 댓글은 댓글 수준(bDepth)만큼 들여쓰기를 한다. -->
								<c:forEach begin="1" end="${boardDto.bDepth}" step="1">
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<a href="/MyHome/boardViewPage.board?bNo=${boardDto.bNo}&page=${page}">
									<!-- 2. 댓글은 제목 앞에 [re]를 붙인다. -->								
									<c:if test="${boardDto.bDepth > 0}">
										[re]&nbsp;
									</c:if>
									<!-- 3. 제목을 표시한다. -->
									${boardDto.bTitle}
								</a>
							</td>
							<td>${boardDto.mId}</td>
							<td>${boardDto.bLastModify}</td>
							<td>${boardDto.bHit}</td>							
						</c:if>
						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">
				${paging}
			</td>
		</tr>
	</tfoot>
</table>

<%@ include file="../template/footer.jsp" %>