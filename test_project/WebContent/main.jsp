<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%
	String UserID = (String)session.getAttribute("USERID");
	
	if(UserID==null) {
		String URL = request.getContextPath()+"/ssb/loginMain.jsp";
		response.sendRedirect(URL);
	}
%>
<html>
<head>
<title>QRMain</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- Save for Web Slices (ì¹ë°ëª¨íì´ì§.psd) -->
<table id="__01" width="1920" height="1081" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2" rowspan="3">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_01.png" width="326" height="129" alt=""></td>
		<td colspan="11">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_02.png" width="1594" height="54" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" >
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_03.png" width="630" height="36" alt=""></td>
		<td align="right" background= "<%=request.getContextPath()%>/resources/demo/images/demoMain_04.png" width="133" height="36">
			<div style="margin-right:30px;font-size:24pt">
			<%=UserID%>
			</div>
		</td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_05.png" width="130" height="36" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_06.png" width="140" height="36" alt=""></td>
		<td>
			<a href="./logout.jsp"><img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_07.png" width="115" height="36" alt=""></a></td>
		<td colspan="2" rowspan="2">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_08.png" width="446" height="75" alt=""></td>
	</tr>
	<tr>
		<td colspan="9">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_09.png" width="1148" height="39" alt=""></td>
	</tr>
	<tr>
		<td colspan="13">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_10.png" width="1920" height="130" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_11.png" width="325" height="682" alt=""></td>
		<td colspan="2" rowspan="3">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_12.png" width="240" height="518" alt=""></td>
		<td rowspan="3">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_13.png" width="52" height="518" alt=""></td>
		<td colspan="8">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_14.png" width="978" height="165" alt=""></td>
		<td rowspan="4">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_15.png" width="325" height="682" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_16.png" width="136" height="33" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_17.png" width="128" height="33" alt=""></td>
		<td colspan="6">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_18.png" width="714" height="33" alt=""></td>
	</tr>
	<tr>
		<td colspan="8">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_19.png" width="978" height="320" alt=""></td>
	</tr>
	<tr>
		<td colspan="11">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_20.png" width="1270" height="164" alt=""></td>
	</tr>
	<tr>
		<td colspan="13">
			<img src="<%=request.getContextPath()%>/resources/demo/images/demoMain_21.png" width="1920" height="139" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="325" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="1" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="239" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="52" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="136" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="128" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="75" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="133" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="130" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="140" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="115" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="121" height="1" alt=""></td>
		<td>
			<img src="<%=request.getContextPath()%>/resources/demo/images/space.gif" width="325" height="1" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>