<!DOCTYPE html>
<html>
  <head>
    <title>Main</title>
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%
	String UserID = (String)session.getAttribute("USERID");
%>
    <link rel = "stylesheet" href = "style2.css">
    <style>
    a {
      text-decoration: none;
      color:black;
      border: powderblue solid 1px;
    }  /*하이퍼링크의 밑줄을 없애고 글자색을 검정색으로 만듭니다*/
    </style>
  </head>
  <body>
    <h1 id = "bank">SSenStone Bank</h1>
    <%=UserID %>님 환영합니다.
    <span class = "indexgrid">
      <a href ="payment.jsp"><br>페이</a>
      <a href ="transfer.jsp"><br>이체</a>
      <a href ="insurance.jsp"><br>보험</a>
      <a href ="loan.jsp"><br>대출</a>
    </span>
</html>
