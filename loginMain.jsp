
<!-- 
 *
 * ID/PWD 로그인
 * why 꺠지는건가?
 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="utf-8"/>
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Pragma" content="no-cache" />
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<!-- css Start -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/demo/css/layout.css"/>
<!-- css End -->
<title>ID/PWD 로그인</title>
</head>
<body>

<div id="wrap">
	<div class="loginBox">
		<div class="loginContent">
			<img src="<%=request.getContextPath()%>/resources/demo/images/layout_left_bg.png" style="position:absolute;left:-70%;top:0%;height:600px;"/>
			<form name="form1" id="form1" action="" method="post" onsubmit="return false;">
				<div class="layTitle">
					<img src="<%=request.getContextPath()%>/resources/demo/images/title_login.png" style="width:300px;"/>		
				</div>
				<div style="position:absolute;width:100%;top:90%;margin-left:145px;">
					<div class="textbox" style="margin-left:10px;margin-top:15px;">	<!-- 사용자ID -->
						<input type="text" name="USERID" id="USERID" class="user_id_on user_id"/>
					</div>
					<div style="margin-left:-210px;margin-top:5px;">
						<label class="noti">아이디를 입력해 주세요</label>
					</div>
					<div class="textbox" style="margin-left:10px;margin-top:15px;">	<!-- 패스워드 -->
						<input type="password" name="USERPW" id="USERPW" class="user_pwd_on user_pwd"/>
					</div>
					<div style="margin-left:-200px;margin-top:5px;">
						<label class="noti">패스워드를 입력해 주세요</label>
					</div>
					<div style="margin-left:70px;margin-top:10px;">		<!-- 인증방식 -->
						<div style="float:left;">
							<input type="radio" name="SECONDAUTH" id="authType_1" checked value="1"/>
							<label for="authType_1"><span></span>인증앱</label>
						</div>
						<div>
							<input type="radio" name="SECONDAUTH" id="authType_2" value="2"/>
							<label for="authType_2"><span></span>OTP</label>
						</div>
					</div>
					<div style="margin-left:70px;margin-top:10px;">		<!-- 인증방식 -->
						<div style="float:left;">
							<input type="radio" name="SECONDAUTH" id="authType_3" value="3"/>
							<label for="authType_3"><span></span>SMS</label>
						</div>
						<!-- 
						<div style="margin-left:110px;">
							<input type="radio" name="authType" id="authType_4"/>
							<label for="authType_4"><span></span>eMail</label>
						</div>
						 -->
					</div>
					<div style="margin-left:10px;margin-top:10px;">
						<a href="javascript:;" onclick="fn_submit();"><img src="<%=request.getContextPath()%>/resources/demo/images/btn_login.png" style="width:325px;"/></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/demo/js/jquery-1.12.4.js"></script>
<script type="text/javascript">

$(function() {

	$(".user_id").focus(function(){
		
		$(this).removeClass("user_id_on")
			   .addClass("user_id_out");
		
	});
	
	$(".user_id").blur(function(){
		
		if ( $(this).val() == "" ) {
			
			$(this).removeClass("user_id_out")
				   .addClass("user_id_on");
			
		}
		
	});
	
	$(".user_pwd").focus(function(){
		
		$(this).removeClass("user_pwd_on")
			   .addClass("user_pwd_out");
		
	});
	
	$(".user_pwd").blur(function(){
		
		if ( $(this).val() == "" ) {
			
			$(this).removeClass("user_pwd_out")
				   .addClass("user_pwd_on");
			
		}
		
	});
	
	$('#USERPW').keyup(function(e) {
		
		if (  e.keyCode == 13 ) {
			fn_submit();
		}
		
	});
	
});

function fn_submit() {
	
	var $userId = $('#USERID');
	if ( $.trim($userId.val()) == '' ) {
		
		alert('아이디를 입력해 주세요.');
		$userId.focus();
		return false;
		
	}
	
	var $userPwd = $('#USERPW');
	if ( $.trim($userPwd.val()) == '' ) {
		
		alert('패스워드를 입력해 주세요.');
		$userPwd.focus();
		return false;
	}
	
	if ( $('input:radio[ name="SECONDAUTH" ]:checked').length == 0 ) {
		
		alert('인증방식을 선택해 주세요.');
		return false;
		
	}
	
	var form1 = document.getElementById('form1');
	if(form1.SECONDAUTH[0].checked == true) {
		var url = '<%=request.getContextPath()%>/ssb/appLoginPopup.jsp';
		window.open('','APPLOGINWIN', 'width=476, height=486, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200, location=no');
	
		form1.action = url; 
		form1.target = 'APPLOGINWIN'; 
		form1.submit(); 
	}
	else {
		var url = '<%=request.getContextPath()%>/ssb/inputOTP.jsp';
		form1.action = url; 
		form1.submit();
	}
	
}

</script>
</body>
</html>