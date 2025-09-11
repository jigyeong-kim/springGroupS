<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
<title>memberIdFind.jsp</title>
<script>
	'use strict'
	
	let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	// 이메일 인증번호 받기
    function emailCertification() {
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	
  		if(!regEmail.test(email)) {
	        alert("이메일 형식에 맞지않습니다.");
	        myform.email1.focus();
	        return false;
		}
      
    	// 인증번호를 메일로 전송하는동안 사용자 폼에는 스피너가 출력되도록 처리
    	let spin = "<div class='text-center'><div class='spinner-border text-muted'></div> 메일 발송중입니다. 잠시만 기다려주세요 <div class='spinner-border text-muted'></div></div>";
      	$("#demoSpin").html(spin);
    	
    	// ajax를 통해서 인증번호 발송하기
    	$.ajax({
    		url  : "${ctp}/member/memberEmailCheck",
    		type : "post",
    		data : {email : email},
    		success: (res) => {
    			if(res == 1) {
    				alert("인증번호가 발송되었습니다.\n메일확인후 인증번호를 입력해주세요.");
    				let str = '<div class="input-group mb-3">';
    				str += '<input type="text" name="checkKey" id="checkKey" class="form-control"/>';
    				str += '<span id="timeLimit" class="input-group-text"></span>';	// 인증시간 만료를 알리기위한 타이머삽입
    				str += '<input type="button" value="인증번호확인" onclick="emailCertificationOk()" class="btn btn-primary btn-sm"/>';
    				str += '</div>';
    				$("#demoSpin").html(str);
    				timer();
    			}
    			else alert("인증번호 확인버튼을 다시 눌러주세요!");
    		},
    		error : () => alert("전송오류")
    	});
    }
    
    // 인증번호 확인처리
    function emailCertificationOk() {
    	let checkKey = $("#checkKey").val();
    	if(checkKey.trim() == "") {
    		alert("메일로 전송받은 인증키를 입력해주세요");
    		$("#checkKey").focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "${ctp}/member/memberEmailCheckOk",
    		type : "post",
    		data : {checkKey : checkKey},
    		success: (res) => {
    			if(res == 1) {
    				clearInterval(interval);
    				$("#demoSpin").hide();
    				$("#addContent").show();
    			}
    			else alert("인증번호 오류~~ 메일을 통해서 발급받은 인증번호를 확인하세요.");
    		},
    		error : () => alert("전송오류")
    	});
    }
    
	  // 인증번호 입력 제한시간 처리(2분 = 120초)
	  let timeLimit = 120;
	  let interval;
	  function timer() {
      interval = setInterval(() => {
	      $("#timeLimit").html("남은 시간: "+timeLimit+"초");
	            
	      // 할당받은 시간(120초)를 모두 사용하면 기존에 전송받은 인증번호를 제거시키고 다시 인증번호를 전송받도록한다.
	      if(timeLimit == 0) {
          $("#demoSpin").html("");
          timeLimit = 120;

          $.ajax({
             url : "${ctp}/member/memberEmailCheckNo",
             type: "post",
             success : () => alert("인증시간이 만료되었습니다.\n인증번호를 다시 받아주세요."),
             error : () => alert("전송오류")
          });
          clearInterval(interval);
	      }
	      timeLimit--;
      }, 1000);
	  }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<div class="container">
		<h2>아이디 찾기</h2>
		
		<form name="memberIdFind" id="memberIdFind" method="post">
			<table class="table table-bordered">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" autofocus="autofocus">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<div class="input-group mb-3">
					      <label for="email1" class="input-group-text bg-secondary-subtle border-secondary-subtle">Email</label>
					      <input type="text" name="email1" id="email1" class="form-control" placeholder="Email을 입력하세요." required style="width:150px" />
					      <div class="input-group-text border-white m-0 p-0">@</div>
					      <select name="email2" class="form-select">
					        <option value="naver.com" selected>naver.com</option>
					        <option value="hanmail.net">hanmail.net</option>
					        <option value="hotmail.com">hotmail.com</option>
					        <option value="gmail.com">gmail.com</option>
					        <option value="nate.com">nate.com</option>
					        <option value="yahoo.com">yahoo.com</option>
					      </select>
					      <input type="button" value="인증번호받기" onclick="emailCertification()" id="certificationBtn" class="btn btn-success btn-sm" />
					    </div>
					    <div id="demoSpin" class="mb-3"></div>
				    </td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>