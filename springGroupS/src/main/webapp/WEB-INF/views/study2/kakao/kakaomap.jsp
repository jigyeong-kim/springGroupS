<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
<title>.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<div class="container">
		<h2>kakao Map 지도연습</h2>
		<div id="map" style="width:100%;height:500px;"></div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64f7156308d2088a1db18b70abb44e7d"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
<hr class="border">
<jsp:include page="kakaoMenu.jsp" />
</body>
</html>