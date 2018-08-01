 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%
   String UserID = (String)session.getAttribute("USERID");
   
   if(UserID==null) {
      String URL = request.getContextPath()+"/ssb/loginMain.jsp";
      response.sendRedirect(URL);
   }
   else if(UserID.equals("admin")) {
      String URL = request.getContextPath()+"/index_admin.jsp";
      response.sendRedirect(URL);
   }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>SSenStone Demo Bank - Main</title> 
   
    <link rel = "stylesheet" href = "style2.css">
    <style>
    a {
      text-decoration: none;
      color:black;
      border: powderblue solid 1px;
    }  /*하이퍼링크의 밑줄을 없애고 글자색을 검정색으로 만듭니다*/
    body {
    width : 300px;
    margin : 0 auto;
    } 
    </style>
  </head>
  <body>
  <br>
  <img src = "logo.png"><br>
  <br><%=UserID %>님 환영합니다.
    <span class = "indexgrid">
      <a href ="payment.jsp"><br>페이</a>
        <a href ="transfer.jsp"><br>이체</a>
        <a href ="loan.jsp"><br>대출</a>
        <a href ="insurance.jsp"><br>보험</a>
    </span>
</html>