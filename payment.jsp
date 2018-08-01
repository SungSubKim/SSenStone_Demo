<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String UserID = (String)session.getAttribute("USERID");
%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-qrcode.min.js"></script>
<meta charset="EUC-KR">
<title>Payment</title>
    <meta charset="utf-8">
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
        <h2> 페이 </h2>
        
        <p>상품 : NYC 볼캡<br>
        <p>회사 : MLB스토어 <br>
        <form name="form1" id="form1" action="" method="post" onsubmit="return false;">
	        <p>결제 정보 <br>
	        <input type = "radio" name = "FIRM" id = "FIRM" value = "비씨카드" >비씨카드 &nbsp
	        <input type = "radio" name = "FIRM" id = "FIRM" value = "신한카드">신한카드 &nbsp
	        <input type = "radio" name = "FIRM" id = "FIRM"  value = "삼성카드">삼성카드 <br>
	        <input type = "radio" name = "FIRM" id = "FIRM"  value = "국민카드">국민카드 &nbsp
	        <input type = "radio" name = "FIRM" id = "FIRM"  value = "하나카드">하나카드 &nbsp
	        <input type = "radio" name = "FIRM" id = "FIRM" value = "롯데카드">롯데카드 </p>
	        <p>카드번호 <br>
	        <input type = "text" size  = "20" name = "CARDNUMBER" ><br></p>
	        <p>거래처 <br>
	        <input type = "text" size  = "20" name = "FIRM2"><br></p>
	        <p>상품명<br>
	        <input type = "text" size  = "20" name = "PRODUCT"><br></p>
	        <p>금액 <br>
	        <input type = "text" size  = "20" name = "AMOUNT">원<br></p>
	        <input type = "submit" value = "결제하기" onclick="goToLoading(1);">
        </form>
        </span>
    </div>
  </body>
</html>