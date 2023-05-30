<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String message = "";
%>
<%
	message = (String) request.getAttribute("message");
	if(message != null){
%>
	<script>
		alert("<%=message%>");
	</script>
<%
	}
%>

<h1 class="my-5 text-center">MY BBS 회원가입</h1>
<div class="container mb-5">
	<form name="loginform" class="loginform" action="/board/memberlogin" method="post">
		<div class="mb-3 mt-3">
			<div class="row">
				<label for="userid" class="col-md-3 form-label">아이디 :</label>
				<div class="col-md-9">
					<input type="text" class="form-control" id="userid" name="userid" value=""/>
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
			<div class="row">
				<label for="userpass" class="col-md-3 form-label">비밀번호 :</label>
				<div class="col-md-9">
					<input type="password" class="form-control" id="userpass" name="userpass"/>
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
			<div class="row">
				<div class="offset-md-8 col-md-4 text-end">
					<label for="">아이디 기억</label>
					<input type="checkbox" name="huid" value="ok" onclick="isChecked();"/>
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
			<div class="row">
				<div class="col-md-6 text-end">
					<button type="reset" class="btn btn-warning mx-2 px-5"> 취소 </button>
				</div>
				<div class="col-md-6 text-start">
					<button type="button" onclick="loginSubmit();" class="btn btn-primary mx-2 px-5"> 로그인 </button>
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
			<div class="row">
				<div class="offset-md-5 col-md-7 text-end">
					<a href="?fname=member/myReg" class="me-3">회원가입</a>
					<a href="javascript:void(0)" onclick="findIdPw()">아이디/패스워드 찾기</a>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="container wh600 mb-5 pb-5">
	<div class="row">
		<div class="col-md-6">
			<div class="d-grid">
				<a href="#" class="btn btn-block naver-btn">네이버로그인</a>
			</div>
		</div>
		<div class="col-md-6">
			<div class="d-grid">
				<a href="javascript:loginWithKakao()" class="btn btn-block kakao-btn">카카오로그인</a>
				<p id="token-result"></p>
			</div>
		</div>
	</div>
</div>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('39e437657362631bec64138866c4430e'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script src="js/kakao.js"></script>
<script src="js/cookie.js"></script>
<script src="js/script.js"></script>
<script src="js/form.js"></script>