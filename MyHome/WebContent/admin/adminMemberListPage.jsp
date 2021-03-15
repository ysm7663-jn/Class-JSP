<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="회원목록" name="title" />
</jsp:include>

<style>
	td {
		text-align : center;
	}
	
	table {
		border-collapse: collapse;
	}
</style>

<script>
	onload = function() {
		
		var checkAll = document.getElementById('checkAll');
		checkAll.addEventListener('click',function(){
			// checkAll이란 아이디를 가진 체크박스를 클릭시 해당 함수 호출
			// 1. 전체 선택이 개별 선택을 조정한다.
			var chkList = document.getElementsByName('chk'); // 각 form을 가지고있으니 배열로 인식
			for(var i = 0; i < chkList.length; i++) {
				// checkAll가 true이면 checked가 된다 false이면 체크해제 즉, checkAll에 따라 아래 chk들 체크가 결정
				chkList[i].checked = checkAll.checked; 		 // 전체선택을 클릭하면 아래 chk들이 다 선택된다.
			}			
		});
		
		// 2, 개별 선택이 전체 선택을 조정한다.
		var chkList = document.getElementsByName('chk');
		for(var i = 0; i < chkList.length; i++) {
			// chkList[i] 는 개별 체크박스를 의미
			chkList[i].addEventListener('click', function() {
				var checkAll = document.getElementById('checkAll');
				for(var j = 0; j < chkList.length; j++) { // chk들이 전체 클릭이 되어있는지 확인
					if(chkList[j].checked == false) { 	  // check가 되지 않았을 경우
						checkAll.checked = false;
						return; // 내부 function 종료 		  // 체크 해제된 박스가 하나라도 있으면 function() 종료된다.
					}
				}
				checkAll.checked = true; // 체크 해제된 박스가 하나도 없어야만 여기에 도착할 수 있다.
			});
		}	
	} // end onload
		
		function fn_memberDelete(f) {
			// 회원삭제하려면 해당 게시물이 있으면 안된다.
			if(confirm(f.mId.value + '회원을 삭제할까요?')) {
				 f.action = '/MyHome/adminMemberDelete.admin';
				 f.submit();
			}
		}
		function fn_selectMemberDelete() {
			var chkList = document.getElementsByName('chk'); // js버전 : chkList = [1, 2, 3, 4]
			var target = '';
			for(var i = 0; i < chkList.length; i++) {
				if(chkList[i].checked) {
					target = (target + chkList[i].value + ',');
				}
			}
			// target = '1,2,3,4,' = mNo와 동일
			if(target != '') {
				location.href='/MyHome/adminSelectMemberDelete.admin?target=' + target + '&page=${page}';
			}
		}
		
		function fn_adminMemberUpdate(f) {
			alert('수정하시겠습니까?');
			f.action = '/MyHome/adminMemberUpdate.admin';
			f.submit();
		}
		
		function fn_InsertMember() {
			var chkList = document.getElementsByName('chk');
			if(confirm('추가하시겠습니까?')){
				location.href='/MyHome/adminInsertMember.admin';
			}
		}
		
		function fn_adminMemberPwUpdate(f) {
			if(confirm('비밀번호를 수정하시겠습니까?')) {
				f.action = '/MyHome/adminPwUpdatePage.admin?&page=${page}';
				f.submit();
			} else {
				alert('취소되었습니다.');
			}
		}
	
</script>

<%-- adminMemberListCommand에서 request에 담아 보내고 있다. --%>
<%-- 1. 회원 검색 기능(ex:회원아이디,회원연락처 등 unique속성처럼 한가지만존재하는칼럼으로 찾는다. --%>

<%-- 2. 관리자 버튼  --%>
<input type="button" value="신규회원추가" onclick="fn_InsertMember()" />
<input type="button" value="선택회원삭제" onclick="fn_selectMemberDelete()" /><br/><br/>
<%-- 3. 회원 목록 --%>
전체 회원 수 : ${totalMemberCount}명<br/><br/>

<table border="1">
	<thead>
		<tr>
			<th>전체 <input type="checkbox" name="checkAll" id="checkAll" /></th>
			<th>순번</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>성명</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>주소</th>
			<th>회원가입일</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<%--전체명단은 list로 넘기고 있다. --%>
		<c:forEach var="memberDto" items="${list}" varStatus="k">
			<%-- 각 회원별로(tr) 처리할 수 있도록  form 태그 내부에 tr 태그를 배치한다. --%>
			<%-- 각 회원마다 form에 넣는다 즉, 각회원은 하나의 form안에 tr로 있다. --%>
			<form method="post">
				<tr>
					<%-- 체크하면 체크박스는 각 회원의 회원번호를 가진다(value) --%>
					<%-- chk는 배열이다 : form을 한 회원당 하나씩 만들기 때문 --%>
					<td><input type="checkbox" name="chk" value="${memberDto.mNo}" /></td> <%-- checkbox.value는 체크된 회원의 회원번호가 있어야 한다. --%>
					<td>${totalMemberCount - ((page - 1) * recordPerPage + k.index )}</td>
					<td>${memberDto.mId}</td>
					<td><input type="text" name="mPw" value="${memberDto.mPw}"/></td>
					<td><input type="text" name="mName" value="${memberDto.mName}" /></td>
					<td><input type="text" name="mPhone" value="${memberDto.mPhone}" /></td>
					<td><input type="text" name="mEmail" value="${memberDto.mEmail}" /></td>
					<td><input type="text" name="mAddress" value="${memberDto.mAddress}" /></td>
					<td>${memberDto.mRegDate}</td>
					<td>
						<%-- hidden으로 memberDto.mNo를 저장한다. 해당 페이지를 보기위해 page를 넘긴다. --%>
						<input type="hidden" name="mNo" value="${memberDto.mNo}" />
						<input type="hidden" name="mId" value="${memberDto.mId}" />
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="mRegDate" value="${memberDto.mRegDate}" />
						<%-- 수정,삭제 시 회원번호를 알아야 한다.${memberDto.mNo} --%>
						<input type="button" value="수정" onclick="fn_adminMemberUpdate(this.form)" />
						<input type="button" value="비밀번호수정" onclick="fn_adminMemberPwUpdate(this.form)" />
						<input type="button" value="삭제" onclick="fn_memberDelete(this.form)" />
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