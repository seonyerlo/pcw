<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pcw-sign-in-info">
    <div class="pcw-sign-in-user">
        <label for="userId">아이디</label>
        <input id="userId" type="text" class="userId form-control" placeholder="아이디/인증 이메일">
    </div>
    <div class="pcw-sign-in-user">
        <label for="userPw">비밀번호</label>
        <input id="userPw" type="password" class="userPw form-control" placeholder="비밀번호">
    </div>
    
    <button type="button" id="signInBtn" class="btn btn-primary pcw-sign-in-btn">로그인</button>
    <div class="pcw-find-user">
        <div><a href="#">아이디 찾기</a></div>
        <div><a href="#">비밀번호 찾기</a></div>
        <div><a href="#">회원가입</a></div>
    </div>
</div>

<script>
$(document).ready(function() {
	// 로그인
	$('#signInBtn').on('click', function(e) {
		// alert("클릭");                         
		e.preventDefault();
		
		let userId = $('#userId').val().trim();
		if (userId == '') {
			alert("아이디를 입력해주세요");
			$('#userId').focus();
			return;
		}
		
		let userPw = $('#userPw').val().trim();
		if (userPw == '') {
			alert("비밀번호를 입력해주세요");
			$('#userPw').focus();
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/login"
			, data: {"userId":userId, "userPw":userPw}
			, success: function(data) {
				if (data.result == "success") {
					alert("로그인을 성공하였습니다");
				} else {
					alert("로그인에 실패했습니다. 다시 시도해주세요.");
				}
			},
			error: function(error) {
				alert("로그인을 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>