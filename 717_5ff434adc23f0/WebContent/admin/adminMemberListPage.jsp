<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="회원목록" name="title" />
</jsp:include>

<script>
	
	onload = function() {
		
		// 1. 전체 선택이 개별 선택을 조정한다.
		var checkAll = document.getElementById('checkAll');
		checkAll.addEventListener('click', function(){
			var chkList = document.getElementsByName('chk');
			for (var i = 0; i < chkList.length; i++) {
				chkList[i].checked = checkAll.checked;
			}
		});
		
		// 2. 개별 선택이 전체 선택을 조정한다.
		var chkList = document.getElementsByName('chk');
		for (var i = 0; i < chkList.length; i++) {
			chkList[i].addEventListener('click', function(){
				var checkAll = document.getElementById('checkAll');
				for (var j = 0; j < chkList.length; j++) {
					if (chkList[j].checked == false) {
						checkAll.checked = false;
						return;  // 체크 해제된 박스가 하나라도 있으면 function() 종료된다.
					}
				}
				checkAll.checked = true;  // 체크 해제된 박스가 하나도 없어야만 여기에 도착할 수 있다.
			});
		}
		
	}  // end onload
	
	function fn_adminMemberDelete(f) {
		if (confirm(f.mId.value + ' 회원을 삭제할까요?')) {
			f.action = '/MyHome/adminMemberDelete.admin';
			f.submit();
		}
	}
	
	function fn_adminSelectMemberDelete() {
		var chkList = document.getElementsByName('chk');
		// chkList = [1, 2, 3, 4]
		var target = '';
		for (var i = 0; i < chkList.length; i++) {
			if (chkList[i].checked) {
				target = (target + chkList[i].value + ',');				
			}
		}
		// target = '1,2,3,4,'
		if (target != '') {
			location.href = '/MyHome/adminSelectMemberDelete.admin?target=' + target + '&page=${page}';			
		}
	}
	
	function fn_adminMemberUpdate(f) {
		f.action = '/MyHome/adminMemberUpdate.admin';
		f.submit();
	}
	
</script>

<%-- 1. 회원 검색 기능 --%>

<%-- 2. 관리자 버튼 --%>
<input type="button" value="신규회원추가" onclick="" />
<input type="button" value="선택회원삭제" onclick="fn_adminSelectMemberDelete()" /><br/><br/>


<%-- 3. 회원 목록 --%>
전체 회원 수: ${totalMemberCount}명<br/><br/>

<table border="1">
	<thead>
		<tr>
			<td>전체 <input type="checkbox" name="checkAll" id="checkAll" /></td>
			<td>순번</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>성명</td>
			<td>연락처</td>
			<td>이메일</td>
			<td>주소</td>
			<td>회원가입일</td>
			<td>비고</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="memberDto" items="${list}" varStatus="k">
			<%-- 각 회원별로(tr) 처리할 수 있도록 form 태그 내부에 tr 태그를 배치한다. --%>
			<form method="post">
				<tr>
					<td>
						<%-- 체크박스는 각 회원의 회원번호를 가진다. --%>
						<input type="checkbox" name="chk" value="${memberDto.mNo}" />
					</td>
					<td>${totalMemberCount - ((page - 1) * recordPerPage + k.index)}</td>
					<td>${memberDto.mId}</td>
					<td><input type="password" name="mPw" /></td>
					<td><input type="text" name="mName" value="${memberDto.mName}" /></td>
					<td><input type="text" name="mPhone" value="${memberDto.mPhone}" /></td>
					<td><input type="text" name="mEmail" value="${memberDto.mEmail}" /></td>
					<td><input type="text" name="mAddress" value="${memberDto.mAddress}" /></td>
					<td>${memberDto.mRegDate}</td>
					<td>
						<%-- hidden --%>
						<input type="hidden" name="mNo" value="${memberDto.mNo}" />
						<input type="hidden" name="mId" value="${memberDto.mId}" />
						<input type="hidden" name="page" value="${page}" />
						
						<input type="button" value="수정" onclick="fn_adminMemberUpdate(this.form)" />
						<input type="button" value="비밀번호수정" onclick="" />
						<input type="button" value="삭제" onclick="fn_adminMemberDelete(this.form)" />
					</td>
				</tr>
			</form>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="10">${paging}</td>
		</tr>
	</tfoot>
</table>

<%@ include file="../template/footer.jsp" %>