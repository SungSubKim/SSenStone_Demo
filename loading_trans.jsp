
<%
	String userID = (String)session.getAttribute("USERID");
	String reciever = new String(request.getParameter("RECIEVER").getBytes("8859_1"), "utf-8");
	String bank = new String(request.getParameter("BANK").getBytes("8859_1"), "utf-8");
	String account = request.getParameter("ACCOUNT");
	String amount = request.getParameter("AMOUNT");
	String transACTION = "2@"+reciever+"@"+bank+"@"+account+"@"+amount;
	String SSID = session.getId(); 
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-qrcode.min.js"></script>
<script type="text/javascript">
var nCnt = 0;
$(document).ready(function() {
				alert("왜안되는가..");
			   $.ajax({

        	   	   type  : 'POST',

                   dataType : 'json',

                   url : 'https://www.ssenstone.net:8443/ssb/svr/UserLogin.do',
				   
                   contentType : 'application/json; charset=UTF-8',

                   data : JSON.stringify({ "AUTHPURPOSE":"1","USERID":"<%=userID%>","SSID":"<%=SSID%>","COTP":"123456","TRANSACTION" : window.btoa( encodeURIComponent( '<%=transACTION%>' )) }),

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
			alert("왜안되는가..2");
	      $.ajax({ 
	    	   type  : 'POST',

	           dataType : 'json',

	           url : 'https://www.ssenstone.net:8443/ssb/svr/LoginProcess.do',
			   
	           contentType : 'application/json; charset=UTF-8',
	           
	           data : JSON.stringify({ "AUTHPURPOSE":"1","USERID":"<%=userID%>","SSID":"<%=SSID%>","COTP":"123456","TRANSACTION" : window.btoa( encodeURIComponent( '<%=transACTION%>' ))}),

	           success : function(data) {
        	   	  nCnt++;
        	   	  //alert(data);
        	   	  if(data.RESULT == "SUCCESS") {
                  	  alert('로그인이 완료되었습니다.');
                  	  document.location.href = "finish.jsp";
	                  self.close();
                  }
        	   	  else {
	                  if(data.indexOf("SUCCESS") >= 0) {
	                	  alert('로그인이 완료되었습니다.');
	                	  document.location.href ="finish.jsp";
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

    서버와 통신중입니다.<br>잠시만 기다려주십시오.<br>
    <input type = "submit" value = "취소" onclick = "
    history.back();
    ">
</body>
</html>