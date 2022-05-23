<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pcw-sign-up-info">
	<label for="userId">아이디</label>
	<input id="userId" type="text" class="userId form-control" placeholder="영문 4자 이상, 최대 20자">
	<label for="userPw">비밀번호</label>
	<input id="userPw" type="password" class="userPw form-control" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
	<label for="userPwConfirm">비밀번호 확인</label>
	<input id="userPwConfirm" type="password" class="userPwConfirm form-control" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
	<label for="userName">이름</label>
	<input id="userName" type="text" class="userName form-control" placeholder="한글 8자, 영문 16자 까지 가능">
	<label for="userEmail">이메일 주소</label>
	<input id="userEmail" type="text" class="userEmail form-control" placeholder="이메일 주소 입력">
	<label for="userPhoneNumber">전화번호</label>
	<input id="userPhoneNumber" type="text" class="userPhoneNumber form-control" placeholder="전화번호">
	<label for="userAddress">주소</label>
	<input id="userAddress" type="text" class="userAddress form-control" placeholder="주소">
	<button type="button" id="pcw-sign-up-btn" class="btn btn-primary pcw-sign-up-btn">회원가입</button>
</div>

<script>
$(document).ready(function() {
	

	$('#pcw-sign-up-btn').on('click', function(e) {
		e.preventDefault();
		// alert("클릭");
		

		const regId = /^[a-zA-Z0-9]{4,20}$/;
		let userId = $('#userId').val().trim();
		if (userId == '') {
			alert("아이디를 입력해주세요");
			$('#userId').focus();
			return;
		} else if (!userId.match(regId)) {
			alert("아이디 형식이 잘못되었습니다");
			$('#userId').val('');
			$('#userId').focus();
			return;
		}
		
		const regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#!@$%^&*]).{8,}$/;
		let userPw = $('#userPw').val().trim();
		let userPwConfirm = $('#userPwConfirm').val().trim();
		if (userPw == '' || userPwConfirm == '') {
			alert("비밀번호를 입력해주세요");
			$('#userPw').focus();
			return;
		} else if (!userPw.match(regPw)) {
			alert("비밀번호 형식이 잘못되었습니다");
			$('#userPw').val('');
			$('#userPw').focus();
			return;
		}
		
		if (userPw != userPwConfirm) {
			alert("비밀번호가 일치하지 않습니다");
			$('#userPw').val('');
			$('#userPwConfirm').val('');
			return;
		}
		
		const regName = /^[가-힣]{2,4}$/;
		let userName = $('#userName').val().trim();
		if (userName == '') {
			alert("이름을 입력해주세요");
			$('#userName').focus();
			return;
		}
		
		const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		let userEmail = $('#userEmail').val().trim();
		if (userEmail == '') {
			alert("이메일을 입력해주세요");
			$('#userEmail').focus();
			return;
		} else if (!userEmail.match(regEmail)) {
			alert("이메일 형식이 잘못되었습니다");
			//$('#userEmail').val('');
			$('#userEmail').focus();
			return;
		}

		const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		let userPhoneNumber = $('#userPhoneNumber').val().trim();
		if (userPhoneNumber == '') {
			alert("전화번호를 입력해주세요");
			$('#userPhoneNumber').focus();
			return;
		} else if (!userPhoneNumber.match(regPhone)) {
			alert("전화번호 형식이 잘못되었습니다");
			$('#userPhoneNumber').focus();
		}
		
		let userAddress = $('#userAddress').val().trim();
		if (userAddress == '') {
			alert("주소를 입력해주세요");
			$('#userAddress').focus();
			return;
		}
		
		$.ajax({
			type: "POST"
			,url: "/user/join"
			,data: {"userId":userId,
					"userPw":userPw,
					"userName":userName,
					"userEmail":userEmail,
					"userPhoneNumber":userPhoneNumber,
					"userAddress":userAddress}
			
			,success: function(data) {
				if (data.result == "success") {
					alert("가입을 환영합니다");				
					location.href="/user/sign_in";
				} else {
					alert("가입을 실패하였습니다 다시 시도해주세요.");
				}
			}
			, error: function(error) {
				alert(error_message);
			}
		});
	});
});
</script>