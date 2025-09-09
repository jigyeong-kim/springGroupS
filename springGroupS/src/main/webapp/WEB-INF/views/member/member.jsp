<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
<title>member.jsp</title>

<style>
	.input_wrap{}
	.input_wrap 
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<div class="container">
		<div class="box">
			<div class="input_wrap">
				<label for="mid">아이디</label>
				<input type="text" id="mid" name="mid">
			</div>
			<div class="input_wrap">
				<label for="pwd">비밀번호</label>
				<input type="text" id="pwd" name="pwd">
			</div>
			<div class="input_wrap">
				<label for="nickName">닉네임</label>
				<input type="text" id="nickName" name="nickName">
			</div>
			<div class="input_wrap">
				<label for="name">이름</label>
				<input type="text" id="name" name="name">
			</div>
			<div class="input_wrap">
				<span>성별</span>
				<input type="radio" id="gender1" name="gender" checked="checked">
				<label for="gender1">남자</label>
				<input type="radio" id="gender2" name="gender">
				<label for="gender2">여자</label>
			</div>
			<div class="input_wrap">
				<label for="birthday">생년월일</label>
				<input type="date" id="birthday" name="birthday">
			</div>
			<div class="input_wrap">
				<label for="tel1">전화번호</label>
				<select id="tel1" name="tel1" required>
			        <option value="">선택</option>
			        <option value="010">010</option>
			        <option value="011">011</option>
			        <option value="016">016</option>
			        <option value="017">017</option>
			        <option value="018">018</option>
			        <option value="019">019</option>
			    </select> -
			    
			    <input type="text" id="tel2" name="tel2" maxlength="4" pattern="[0-9]{3,4}" required> -
			    <input type="text" id="tel3" name="tel3" maxlength="4" pattern="[0-9]{4}" required>
			</div>
			<div class="input_wrap">
				<label for="address">주소</label>
				<input type="text" id="address" name="address">
			</div>
			<div class="input_wrap">
				<label for="email1">이메일</label><br>
    
			    <!-- 이메일 아이디 입력 -->
			    <input type="text" id="email1" name="email1" required> @
			    
			    <!-- 이메일 도메인 선택 -->
			    <select id="email2" name="email2" required>
			        <option value="">선택하세요</option>
			        <option value="naver.com">naver.com</option>
			        <option value="gmail.com">gmail.com</option>
			        <option value="daum.net">daum.net</option>
			        <option value="nate.com">nate.com</option>
			        <option value="direct">직접입력</option>
			    </select>
			    
			    <!-- 직접 입력 시 표시될 숨김 input -->
			    <input type="text" id="email3" name="email3" placeholder="직접 입력" disabled="disabled">
			</div>
			<div class="input_wrap">
				<label for="homePage">홈페이지</label>
				<input type="text" id="homePage" name="homePage">
			</div>
			<div class="input_wrap">
				<label for="job">직업</label>
				<input type="text" id="job" name="job">
			</div>
			<div class="input_wrap">
				<label for="hobby">취미</label>
				<input type="text" id="hobby" name="hobby">
			</div>
			<div class="input_wrap">
				<label for="photo">사진</label>
				<input type="text" id="mid" name="name">
			</div>
			<div class="input_wrap">
				<label for="content">자기소개</label>
				<textarea  id="content" name="content" rows="5">
				</textarea>
			</div>
			<div class="input_wrap">
				<label for="userInfor">정보공개</label>
				<input type="radio" id="userInfor1" name="userInfor" checked="checked">
				<label for="userInfor1">공개</label>
				<input type="radio" id="userInfor2" name="userInfor">
				<label for="userInfor2">비공개</label>
			</div>
			<div class="input_wrap">
				<label for="mid">아이디</label>
				<input type="text" id="mid" name="name">
			</div>
			
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>