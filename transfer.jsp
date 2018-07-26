<!DOCTYPE html>
<html>
  <head>
  
  <%
	String UserID = (String)session.getAttribute("USERID");
%>
    <title>Transfer</title>
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <link rel = "stylesheet" href = "style2.css">
    <script src = "script.js"></script>
  </head>
  <body>
    <h1>
      <input type="submit" value="뒤로" onclick="history.back()">
      <a href ="index.jsp" id = "title"> SSenStone</a></h1>
                <div id = "grid">
      <ol>
        <a href ="payment.jsp"><br>페이</a>
        <a href ="transfer.jsp"><br>이체</a>
        <a href ="insurance.jsp"><br>보험</a>
        <a href ="loan.jsp"><br>대출</a>
      </ol>
      <span id = "task">
      	<h1><%=UserID%>님 반갑습니다!</h1>
      	
      	<form name="form1" id="form1" action="" method="post" onsubmit="return false;">
	        받는 사람 이름<br>
	        <input type = "text" id = "USERID" width = 15 name = "RECIEVER"><br>
	        은행명<br>
	    <select id = "COTP" width = 15 name = "BANK"><br>
        <option value="우리은행"selected>우리은행
        <option value="신한은행">신한은행
        <option value="국민은행">국민은행
        <option value="기업은행">기업은행
        <option value="농협은행">농협은행
        <option value="KEB하나은행">KEB하나은행
        <option value="한국씨티은행">한국씨티은행
        <option value="SC제일은행">SC제일은행
        </select>
        <br>
        
	        계좌번호<br>
	        <input type = "text" id = "USERID" width = 15 name = "ACCOUNT"><br>
	        금액<br>
	        <input type = "text" id = "COTP" width = 15 name = "AMOUNT"><br>
	    </form>
        <input type="submit" value="이체하기" onclick = "
        goToLoading(2);
        ">
      </span>
    </div>
  </body>
</html>
