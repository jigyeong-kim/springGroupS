<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
<title>adminLeft.jsp</title>
</head>
<body>
	<div class="container">
		<h5> <a href="${ctp}/admin/adminMain" target="_top">관리자 메뉴</a> </h5>
		<hr>
		<p>
			<a href="${ctp}/" target="_top">홈으로</a>
		</p>
		<hr>
		<div>
			<div>게시글 관리</div>
			<div>
				<p><a href="${ctp}/admin/guest/adGuestList">방명록리스트</a></p>
				<p><a href="">게시판리스트</a></p>
				<p><a href="">자료실리스트</a></p>
			</div>
		</div>
		<div>
			<div>회원 관리</div>
			<div>
				<p><a href="${ctp}/admin/member/adMemberList" target="adminContent">회원리스트</a></p>
				<p><a href="">신고리스트</a></p>
			</div>
		</div>
		<div>
			<div>일정 관리</div>
			<div>
				<p><a href="${ctp}/admin/guest/adGuestList">일정리스트</a></p>
				<p><a href="">일정게시</a></p>
			</div>
		</div>
		
		<div>
			<div>설문조사 관리</div>
			<div>
				<p><a href="${ctp}/admin/guest/adGuestList">설문조사등록</a></p>
				<p><a href="">설문조사리스트</a></p>
				<p><a href="">설문조사분석</a></p>
			</div>
		</div>
		
		<div>
			<div>상품 관리</div>
			<div>
				<p><a href="${ctp}/admin/guest/adGuestList">상품분류등록</a></p>
				<p><a href="">상품등록관리</a></p>
				<p><a href="">상품등록조회</a></p>
				<p><a href="">옵션등록관리</a></p>
				<p><a href="">주문관리</a></p>
				<p><a href="">반품관리</a></p>
				<p><a href="">1:1문의</a></p>
				<p><a href="">상품메인이미지관리</a></p>
			</div>
		</div>
		
		<div>
			<div>기타관리</div>
			<div>
				<p><a href="${ctp}/admin/guest/adGuestList">공지사항관리</a></p>
				<p><a href="">FAQ관리</a></p>
				<p><a href="">QnA관리</a></p>
				<p><a href="">쿠폰관리</a></p>
				<p><a href="">임시파일관리</a></p>
				<p><a href="">실시간 상담</a></p>
			</div>
		</div>
		
	</div>
</body>
</html>