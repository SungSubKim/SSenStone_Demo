<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<% String s = request.getParameter("signature");
	String p = "[.][.]"; 
    String[] ss = s.split(p);
  %>
<style>
  table {
  
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>

<body>
<h2>���ڼ���</h2>
<table  cellpadding="5" cellspacing="2" border="1" align="center" style="table-layout:fixed; word-break:break-all;">
<tr valign=top>
<td>������</td>
<td width = "500"><%=request.getParameter("userid")%></td>
</tr>
<tr>
<td>����ð�</td>
<td width = "500"><%=request.getParameter("authdatetime") %></td>
</tr>
<tr>
<td>FIDO ��������</td>
<td width = "500"><%=ss[0]%></td>
</tr>    
<tr>
<td>����</td>
<td width = "500"><%=ss[1]%></td>
</tr>    
<tr>
<td>����Ű</td>
<td width = "500"><%=ss[2]%></td>
</tr>    
<tr>
<td>����Ű �˰���</td>
<td width = "500"><%=ss[3]%></td>
</tr>    
<tr>
<td>���ڼ��� �˰���</td>
<td width = "500"><%=ss[4]%></td>
</tr>    
<tr>
<td>FCPARAMS</td>
<td width = "500"><%=ss[5]%></td>
</tr>
<tr>
<td>challenge</td>
<td width = "500"><%=ss[6]%></td>
</tr>
<tr>
<td>���ڼ��� ����</td>
<td width = "500">����</td>
</tr>   


</table>

</body>
</html>
