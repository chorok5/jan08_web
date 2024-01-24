<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 쓰기 위한 코어태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🍮 푸딩 페이지 유료가입 🍮</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<script type="text/javascript">
//	$(document).ready(function (){ // 첫 문서가 로딩될 때 기능 실행
//		$('.id-alert').hide(); 
//	});

// 글로벌 변수
	let idCheckBool = false;
	
	

// 아래는 위의 코드와 같음. 다른 모양.
	$(function (){
		$('.id-alert, .name-alert, .pw-alert').hide();
		
		// onchange()
//		$("#id").change(function (){
//			alert("아이디 입력창 값이 변경되었습니다.");			
//		});
		
		$('#id').on("change keyup paste", function(){
//			   alert("아이디 입력창 값이 변경되었습니다.");
			   $('.id-alert').show();
			   $('.id-alert').html('<p class="alert">당신이 입력한 ID는 '+$('#id').val() + '</p>');
			   if ($('#id').val().length > 4) {
			       idCheck();
			   }
		});
});	
	
		// $(선택자).할일();
		function check() {
		let id = $("#id").val();
		if(id.length < 3 || id == ""){
			$('.id-alert').show();
			$("#id").focus();
			return false;
		} else {
			$('.id-alert').hide();
		}
		
		if(!idCheckBool){
			alert("ID 중복검사를 클릭해주세요.");
			return false;
		}
		
		let name=$('#name').val();
		if(name.length < 2){
			$('.name-alert').show();
			$('#name').focus();
			return false;
		}
		$('.name-alert').hide();
		
		let pw1 = $('#pw1').val();
		let pw2 = $('#pw2').val();
		if(pw1.length < 8){
			alert("암호는 8글자 이상이어야 합니다.")
			$('#pw1').focus();
			return false;
		}

		if(pw1 != pw2){
			alert("암호가 일치하지 않습니다.")
			return false;
		}
		if(pw1 != pw2){
			$('.pw-alert').show();
			$('#pw2').val("");
			$('#pw2').focus();
			return false;
		}
		$('.pw-alert').hide();
	}
		

		
	function idCheck(){
//		alert('ID 중복검사');

		let id = $('#id').val();
		
		const regExp = /^[a-zA-Z0-9가-힣]{4,10}$/;
	      
		if(id.length < 3 || !regExp.test(id)){
//			alert("아이디는 영문자 4글자 이상이어야 합니다. (특수문자 사용 불가)")
			$('.id-alert').html('<p class="alert">아이디는 영문자 4글자 이상이어야 합니다. (특수문자 사용 불가)</p>');
			$('#id').focus();
		
		} else {
			// AJAX = 1. 페이징, 2. AJAX, 3. 파일 업로드
			$.ajax({
				url : './idCheck',		// 이동할 주소
				type : 'post',			// get, post
				dataType : 'text',		// 수신 타입
				data : {'id' : id},		// 보낼 값
				success : function(result){
					// alert("통신에 성공");
					
					if(result == 1){
						//alert("이미 가입된 아이디입니다.")
						$('.id-alert').append('<p class="alert">이미 가입되어 있는 아이디입니다.</p>');
						idCheckBool = false;
						$("#join_button").attr("disabled", "disabled");	// 비활성화
						$('#id').focus();
					} else {
//						alert("가입 가능한 아이디입니다.")
						$('.id-alert').append('<p class="alert">가입 가능한 아이디입니다.</p>');
						$('.id-alert .alert').css("color","green");
						idCheckBool = true;
						$("#join_button").removeAttr("disabled");		// 비활성화 제거
						//$('#name').focus();
					}
				},
				error : function(request, status, error) { // 접속불가, 문제 발생 등
					// alert("❗ ❗ 문제가 발생했습니다. ❗ ❗");
				}
			});
		}
		return false;		
	}
		
</script>


<style>

.id-alert, .name-alert, .pw-alert{
	background-color: #FFFBD7;
}
.alert{
	color : red;
}

.join-form{
	width: 800px;
	height: 400px;
	align-items:center;
	margin: 0 auto;

}
        @keyframes slideLeft {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }
h1 {
	position: absolute;
	white-space: nowrap;
	font-family: Arial, sans-serif;
	font-size: 70px;
	font-weight: bold;
	animation: slideLeft 25s linear infinite;
	color: #229E31; /* 글자 색상을 sparkle 시작과 끝 색상으로 지정 */
	left: 0;
    width: 100%;
}


@keyframes sparkle {
	0%, 100% {
    	color: #FC2A7D; /* 시작과 끝 색상 */
}
	50% {
		color: #FCDF2A; /* 가운데 색상 */
	}
}

h3 {
    font-size: 30px;
    text-align: center;
    font-weight: bold;
    animation: sparkle 1s infinite;
    margin-top: 100px;
}
.marquee{
	background-color: black;
	color : white;
	margin-top: 230px; 
}

</style>
</head>
<body>
	<div class="container2">
	<header>
		<%@ include file="menu.jsp"%>
	</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="join-form"><br>
						<h1>회원가입 회원가입 회원가입 회원가입 회원가입 회원가입 환영합니다 회원가입 회원가입 회원가입 회원가입 환영합니다 회원가입 회원가입 회원가입 회원가입 회원가입 회원가입 환영합니다 회원가입 회원가입 환영합니다 회원가입 회원가입 회원가입 회원가입 환영합니다</h1><br><br>
						<h3>💚 유료 가입입니다 💚 <br><br> 🍬 가입비 : 간식 1개 제출 필수 🍬</h3>
						<div class="mx-3 p-3 rounded-3" style="background-color: #C9ABFC; margin-top: 70px;"	> 
							<form action="./join" method="post" onsubmit="return check()">
								<div class="input-group mb-2">
									<label class="input-group-text"> 아이디 </label>
									<input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요.">
									<button class="btn btn-success input-group-text" onclick="return idCheck()">ID 중복검사</button>
								</div>
								<div class="input-group mb-2 id-alert">
									<p class="alert">올바른 아이디를 입력하세요.</p>
								</div>
								<div class="input-group mb-2">
									<label class="input-group-text">이　름</label>
									<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요.">
								</div>
								<div class="input-group mb-2 name-alert">
									<p class="alert">올바른 이름을 입력하세요.</p>
								</div>
								<div class="input-group mb-2">
									<label class="input-group-text">암　호</label>
									<input type="password" id="pw1" name="pw1"  class="form-control" placeholder="암호를 설정해주세요.">
									<label class="input-group-text">재입력</label>
									<input type="password" id="pw2" name="pw2"  class="form-control" placeholder="암호가 맞는지 다시 확인합니다.">
								</div>
								<div class="input-group mb-2 pw-alert">
									<p class="alert">올바른 암호를 입력하세요.</p>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="reset" class="btn btn-primary me-md-2" style="background-color: #8E44EC; border-color: #8E44EC;">초기화</button>
									<button id="join_button" type="submit" disabled="disabled" class="btn btn-primary" style="background-color: #8E44EC; border-color: #8E44EC;">가입하기</button>
								</div>
							</form>
						</div>
					</div>
					
				</article>
			</div>
		</div>
		
<MARQUEE class="marquee">우리 커뮤니티에 오신 것을 환영합니다. 함께 멋진 경험을 만들어봐요! 지금 가입하고 우리의 일원이 되어보세요. 이제 여러분도 우리 사이트의 일원이 되어 놀라운 경험을 시작할 수 있습니다. 가입하고 새로운 세계를 탐험해보세요! 여러분의 참여로 우리 커뮤니티가 더욱 풍요로워집니다. 지금 가입하고 함께 성장하는 순간을 만들어보세요.</MARQUEE>

		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
	


</body>
</html>