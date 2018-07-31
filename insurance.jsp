<!DOCTYPE html>
<html>
  <head>
  <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
  <%
  String UserID = (String)session.getAttribute("USERID");
  %>
  <title>Insurance</title>
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
        <a href ="insurance.jsp"><br>보험</a>>
	  	<br>
	  	<input type="submit" value="뒤로" onclick="history.back()">
  </ol>
      <span id = "task">
      	<h1><%=UserID%>님 반갑습니다!</h1>
      <h2>보험</h2>
      	<form name="form1" id="form1" action="" method="post" onsubmit="return false;">
		보험선택
        <select name="BOHUM" id ="BOHUM"size="1" >
        <option value="무배당 AIG 다이렉트 운전자 보험" selected>무배당 AIG 다이렉트 운전자보험
        <option value="KB손해보험 공식 실비보험" > KB손해보험 공식 실비보험
        <option value="메리츠 실비보험"> 메리츠 실비보험
        </select><br>


        <input type="submit" value="신청하기" onclick = "
        goToLoading(3);
        ">
      </span>
    </div>
  </body>
</html>
