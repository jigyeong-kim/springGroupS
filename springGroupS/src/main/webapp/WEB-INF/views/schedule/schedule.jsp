<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
<title>schedule.jsp</title>
<style type="text/css">
	table th, table td{
		padding: 5px;
	}
	
	table td{
		height: 80px;
	}
	
	table th{
		text-align: center;
		vertical-align: middle;
	}

	td.today {
	  background-color: pink;
	  color: #fff;
	  font-weight: bolder;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<div class="container">
		<div>
			<button type="button" onclick="location.href='schedule?yy=${yy-1}&mm=${mm}'" title="이전년도" class="btn btn-secondary bnt-sm">◁◁</button>
			<button type="button" onclick="location.href='schedule?yy=${yy}&mm=${mm-1}'" title="이전월" class="btn btn-secondary bnt-sm">◀</button>
			&nbsp;<font size="5">${yy}년 ${mm+1}월</font>&nbsp;
			<button type="button" onclick="location.href='schedule?yy=${yy}&mm=${mm+1}'" title="다음월" class="btn btn-secondary bnt-sm">▶</button>
			<button type="button" onclick="location.href='schedule?yy=${yy+1}&mm=${mm}'" title="다음년도" class="btn btn-secondary bnt-sm">▷▷</button>
			<button type="button" onclick="location.href='schedule'" title="오늘날짜" class="btn btn-secondary bnt-sm">◎</button>
		</div>
		<div>
			<table class="table table-bordered" style="height:100%">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th style="color:red;">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th style="color:blue">토</th>
					</tr>
				</thead>
				<tbody> 
					<tr>
						<!-- 달력 1줄(7일)을 체크하기위한 변수 : cnt -->
						<c:set var="cnt" value="1"></c:set>
						<c:forEach var="prevDay" begin="${prevLastDay - (startWeek -2)}" end="${prevLastDay}" varStatus="st">
							<td>
								${prevYear}-${prevMonth+1}-${prevDay}
							</td>
							<c:set var="cnt" value="${cnt + 1}"></c:set>	
						</c:forEach>
						
						<!-- 달력출력 -->
				        <%-- 
				          <c:forEach var="i" begin="${1}" end="${lastDay}" varStatus="st">
				          <c:set var="todaySw" value="${yy==toYear && mm==toMonth && st.count==toDay ? 1 : 0}"/>
				          <td ${todaySw == 1 ? 'class=today' : ''}>
				            <c:choose>
				              <c:when test="${cnt % 7 == 1}"><font color="red">${st.count}</font></c:when>
				              <c:when test="${cnt % 7 == 0}"><font color="blue">${st.count}</font></c:when>
				              <c:otherwise>${st.count}</c:otherwise>
				              <c:otherwise>
				              	${st.count}<br>
				              	<c:forEach var="vo" items="${vos}">
					              	<c:if test="${fn:substring(vo.SDate,8,10)==st.count}">
					              		- ${vo.part}(${vo.partCnt})<br>
					              	</c:if>
				              	</c:forEach>
				              </c:otherwise>
				            </c:choose>
				          </td>
				          <c:if test="${cnt % 7 == 0}">
				            </tr><tr>
				          </c:if>
				          <c:set var="cnt" value="${cnt + 1}"/>
				        </c:forEach> --%>
				        
						<c:forEach var="i" begin="${1}" end="${lastDay}" varStatus="st">
							<c:set var="todaySw" value="${yy==toYear && mm==toMonth && st.count==toDay ? 1 : 0}"/>
							<td ${todaySw == 1 ? 'class=today' : ''} id="td${cnt}">
								<c:set var="ymd" value="${yy}-${mm+1}-${st.count}" />
								<a href="scheduleMenu?ymd=${ymd}">
									${st.count}<br>
					              	<c:forEach var="vo" items="${vos}">
						              	<c:if test="${fn:substring(vo.SDate,8,10)==st.count}">
						              		- ${vo.part}(${vo.partCnt})<br>
						              	</c:if>
					              	</c:forEach>
				              	</a>
			              	</td>
							<c:if test="${cnt % 7 == 0}">
					            </tr><tr>
					          </c:if>
					          <c:set var="cnt" value="${cnt + 1}"/>
						</c:forEach>
				        
						
						<!--  -->
						<c:if test="${nextStartWeek != 1}">
					       	<c:forEach begin="${nextStartWeek}" end="7" varStatus="st">
					          <td style="font-size:0.7em" class="text-end align-bottom">
					            ${nextYear}-${nextMonth+1}-${st.count}
					          </td>
					          <c:set var="cnt" value="${cnt + 1}" />
					        </c:forEach>
				        </c:if>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>