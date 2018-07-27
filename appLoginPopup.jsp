<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String userID = request.getParameter("USERID");
	String userPW = request.getParameter("USERPW");
	String mOTP = request.getParameter("MOTP");
	String cmdCode = request.getParameter("CMDCODE");
	String SSID = session.getId(); 
	
	   session.setAttribute("USERID",userID);
	   session.setMaxInactiveInterval(20*60);
%>
<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-qrcode.min.js"></script>
<script type="text/javascript">
var nCnt = 0;
$(document).ready(function() {
				var params = "USERID=<%=userID%>&USERPW=<%=userPW%>&CMDCODE=<%=cmdCode%>&SSID=<%=SSID%>&COTP=123456&SIGNDATA=asdfqwer";
				
			   $.ajax({

        	   	   type  : 'POST',

                   dataType : 'json',

                   url : 'https://www.ssenstone.net:8443/ssb/svr/UserLogin.do',
				   
                   contentType : 'application/json; charset=UTF-8',
    	           
                   data : JSON.stringify({ "AUTHPURPOSE":"1","USERID":"<%=userID%>","USERPW":"<%=userPW%>","SSID":"<%=SSID%>","COTP":"123456","CNT":nCnt }) ,

                   success : function(data) {

                          // data는 서버로부터 전송받은 결과(JSON)이므로 바로 사용한다
                          var resutlStr = data;
                          if(data.RESULT == "SUCCESS") {
                        	  poll();
                    	  }
                    	  else {
                    		  //alert(data.ERRORCODE);
                    		  if(data.ERRORCODE == "G801") {
                    			  alert('아이디 혹은 비밀번호가 일치하지 않습니다.');
        	            		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
        	                	  self.close();
                    		  }
                    		  
                    		  if(data.ERRORCODE == "G101") {
                    			  alert('아이디 가 존재하지 않습니다.');
        	            		 // window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
        	                	 // self.close();
                    		  }
                    		  
                    		  if(data.ERRORCODE == "G103") {
                    			  alert('계정이 잠겨 있습니다.');
        	            		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
        	                	  self.close();
                    		  }
                    		  
                    		  if(data.ERRORCODE == "G102") {
    	            			  alert('계정이 해지 되었습니다. 다시 등록해 주세요.');
    		            		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
    		                	  self.close();
    	            		  }
                    		  
                    		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
    	                	  self.close();
                    	  }
                          
                   },

                   error : function(xhr, stat, err) {
                	   
                          alert(err);

                   }

           });
});


(function poll(){
	   setTimeout(function(){
		   var params = "USERID=<%=userID%>&SSID=<%=SSID%>&COTP=123456"+nCnt;
	      $.ajax({ 
	    	   type  : 'POST',

	           dataType : 'json',

	           url : 'https://www.ssenstone.net:8443/ssb/svr/LoginProcess.do',
			   
	           contentType : 'application/json; charset=UTF-8',
	           
	           data : JSON.stringify({ "USERID":"<%=userID%>","SSID":"<%=SSID%>","COTP":"123456","CNT":nCnt }) ,

	           success : function(data) {
        	   	  nCnt++;
        	   	  //alert(data);
        	   	  if(data.RESULT == "SUCCESS") {
                  	  alert('로그인이 완료되었습니다.');
                  	  window.opener.location = "<%=request.getContextPath()%>/ssb/main.jsp";
	                  //self.close();
                  }
        	   	  else {
	                  if(data.indexOf("SUCCESS") >= 0) {
	                	  alert('로그인이 완료되었습니다.');
	            		  window.opener.location = "<%=request.getContextPath()%>/index.jsp";
	                	  self.close();
	            	  }
	            	  else {
	            		  if(nCnt > 90) {
		            		  alert('로그인 시간이 초과되었습니다. 다시 시도해 주세요');
		            		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
		                	  self.close();
	            		  }
	            		  
	            		  if(data.ERRORCODE == "G101") {
	            			  alert('아이디 가 존재하지 않습니다.');
		            		 // window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
		                	 // self.close();
	            		  }
	            		  
	            		  if(data.ERRORCODE == "G103") {
	            			  alert('계정이 잠겨 있습니다.');
		            		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
		                	  self.close();
	            		  }
	            		  
	            		  if(data.ERRORCODE == "G102") {
	            			  alert('계정이 해지 되었습니다. 다시 등록해 주세요.');
		            		  window.opener.location = "<%=request.getContextPath()%>/ssb/loginMain.jsp";
		                	  self.close();
	            		  }
	            	  }
        	   	  }
	        poll();
	      }, dataType: "text"});
	  }, 2000);
})();



</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="3" topmargin="2" marginwidth="2" marginheight="2">
<!-- Save for Web Slices (1.psd) -->


<table id="__01" width="471" height="481" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/demopopup_03.png" width="471" height="395" alt=""></td>
		</tr>
	<tr>
		<td>
			<a href="javascript:self.close();"><img src="<%=request.getContextPath()%>/resources/demo/images/demopopup_05.png" width="471" height="86" alt=""></a></td>
	</tr>
	
</table>
</body>
</html>