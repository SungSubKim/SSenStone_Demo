<!DOCTYPE html>
<html>
  <head>
  <%
	String UserID = (String)session.getAttribute("USERID");
%>
    <title>Loan</title>
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
        <h2>대출</h2>
        <br>대출 상품
        <select name="GOODS" size="1" >
        <option selected>바로바로론
        <option >1
        </select>
     	<br>대출 금액
        <input type="text" size="15" name = "AMOUNT"><br>
		<br>대출 금리
        <input type="text" size="15" name = "RATIO"><br>
        <br>상환 방식
        <select name="KIND" size="1" >
        <option selected>원리금균등분할상환
        <option >1
        </select><br><br>
        <input type="submit" value="대출하기" onclick = "goToLoading(4);">
      </span>
    </div>
  </body>
</html>
