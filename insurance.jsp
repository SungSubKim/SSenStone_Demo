<!DOCTYPE html>
<html>
  <head>
    <title>Insurance</title>
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <link rel = "stylesheet" href = "style2.css">
    <script src = "script.js"></script>
  </head>
  <body>
    <h1><a href ="index.jsp">SSenStone Bank</a></h1>
    <div id = "grid">
      <ol>
        <a href ="payment.jsp"><br>페이</a>
        <a href ="transfer.jsp"><br>이체</a>
        <a href ="insurance.jsp"><br>보험</a>
        <a href ="loan.jsp"><br>대출</a>
      </ol>
      <span id = "task">
      <h2>보험</h2>
      	<form name="form1" id="form1" action="" method="post" onsubmit="return false;">
		보험선택
        <select name="BOHUM" size="1" >
        <option selected>무배당 AIG 다이렉트 운전자보험
        <option > KB손해보험 공식 실비보험
        <option> 메리츠 실비보험
        </select><br>
        </form>
        <input type="submit" value="신청하기" onclick = "
        goToLoading(3);
        ">
      </span>
    </div>
  </body>
</html>
