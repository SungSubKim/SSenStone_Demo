<!DOCTYPE html>
<html>
  <head>
  
  <%
	String UserID = (String)session.getAttribute("USERID");
%>
    <title>Loan!</title>
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <link rel = "stylesheet" href = "style2.css">
    <script src = "script.js"></script>
  </head>
  <body>
    <h1>
      <a href ="index.jsp" id = "title"> SSenStone</a></h1>
                <div id = "grid">
      <ol>
        <a href ="payment.jsp"><br>페이</a>
        <a href ="transfer.jsp"><br>이체</a>
        <a href ="loan.jsp"><br>대출</a>
        <a href ="insurance.jsp"><br>보험</a>
        <br>
        <input type="submit" value="뒤로" onclick="history.back()">
      </ol>
      <span id = "task">
      	<h1><%=UserID%>님 반갑습니다!</h1>
		<h2>대출</h2>
      	<form name="form1" id="form1" action="" method="post" onsubmit="return false;">
      	<p>대출상품<br>
     	<select name = "GOODS" size = "1">
     	<option value = "바로바로론"selected> 바로바로론
     	<option value = "러시앤캐시"> 러시앤캐시
     	</select></p>
     	<p>대출금액<br>
     	<input type = "text" width = "15" name = "AMOUNT"></p>
	    <p>금리 <br>
	     <input type = "text" width = "15" name = "RATIO"></p>
	    <p>상환방식<br>
	    <select name = "KIND">
	    <option value = "원리금균등상환" selected> 원리금균등산환
	    <option value = "원금분할상환"> 원금분할상환
	    </select></p>
	    <p>상환기간<br>
	    <input type = "text" width = "15" name = "DUE">개월</p>
	    </form>
        <input type="submit" value="대출하기" onclick = "
        goToLoading(3);
        ">
      </span>
    </div>
  </body>
</html>