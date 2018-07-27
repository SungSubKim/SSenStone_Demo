<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	final int ROWSIZE = 10;  // 한페이지에 보일 게시물 수
	final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정
	
	int pg = 1; //기본 페이지값
	String sfl = "";
	String stx = "";
	
	if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
	}
	if(request.getParameter("sfl")!=null) {
		sfl = request.getParameter("sfl");
	}
	if(request.getParameter("stx")!=null) {
		stx = request.getParameter("stx");
	}
	
	int allPage = 0; // 전체 페이지수
	
	int startRow = (pg-1)*ROWSIZE; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
	int endRow = ROWSIZE; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 
	
%>


<html>
<head>
<title>관리자페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
a:link {text-decoration: none; color: blue;}
a:visited {text-decoration: none; color: green;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
<!--
//var timerId = setTimeout("location.reload(true)",2000);

function searchText() {
	
	fsearch.submit();
}

function popupPayWin() {
	
	var url = '<%=request.getContextPath()%>/votc/votc_reg.jsp';
	window.open(url,'CPAYWIN', 'width=860, height=600, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200, location=no');

}


function startTimer() {
	
	//timerId = setTimeout("location.reload(true)",2000);

}

function stopTimer() {
	
	//clearTimeout(timerId);

}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- Save for Web Slices (ê´ë¦¬ìíì´ì§-íë©´ë§.png) -->
<table id="__01" width="1280" height="800" border="0" cellpadding="0" cellspacing="0" valign=top>
	<tr>
		<td rowspan="3" valign=top>
			<img src="<%=request.getContextPath()%>/resources/images/administratior_full_page_01.png" width="218" height="800" alt="">
			<div style="position: relative; left:40px; top: -40px;"><a href="javascript:popupPayWin()">.</a></div>
			<div style="position: relative; left:40px; top: -20px;"><a href="javascript:startTimer()">.</a></div>
			<div style="position: relative; left:80px; top: -20px;"><a href="javascript:stopTimer()">.</a></div>
			</td>
		<td>
			<table id="__01" width="1100" height="801" border="0" cellpadding="0" cellspacing="0" valign=top>
				<tr valign=top>
					<td width="1100" height="108" >
						<img src="<%=request.getContextPath()%>/resources/images/spacer.gif" width="1062" height="108" alt=""></td>
				</tr>
				<tr valign=top>
					<td width="1100" valign=top >
						<table id="__02" width="1100" height="801" border="0" cellpadding="0" cellspacing="0" valign=top>
							<tr valign=top>
								<td width="60" >
									<img src="<%=request.getContextPath()%>/resources/images/spacer.gif" width="60" alt="">
								</td>
								<td valign=top>
									<table id="__03" width="1100" border="0" cellpadding="0" cellspacing="0" valign=top>
										<tr valign=top>
											<form name="fsearch" method="get">
											<td><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_03.png" width="302" height="28" alt=""></td>
											<td><img src="<%=request.getContextPath()%>/resources/images/spacer.gif" width="185" height="28" alt=""></td>
											<td>
												<select name="sfl" style="height:28px; width:90px">>
													<option value="">선택</option>
													<option value="name" selected>이름</option>
													<option value="cardnum">카드번호</option>
												</select>
											</td>
											<td align="right"><input type="text" name="stx" value="" id="stx" size="30" maxlength="40" style="height:28px; width:200px"></td>
											<td align="right"><a href="javascript:searchText();"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_07.png" width="31" height="28" alt=""></a></td>
											</form>
										</tr>
										
										<tr valign=top>
											<td colspan="5"><img src="<%=request.getContextPath()%>/resources/images/spacer.gif" height="50" alt=""></td>
											
										</tr>
										
										<tr valign=top>
											<td colspan="5">
											<table id="__04" width="1100" border="0" cellpadding="0" cellspacing="0" valign=top>
											
											<tr valign=top>
												<td width="150" align="center"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_13.png" width="89" height="35" alt=""></td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/admin_exp.png" width="89" height="35" alt=""></td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/admin_cvc.png" width="89" height="35" alt=""></td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/admin_votc.png" width="89" height="35" alt=""></td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/admin_exp.png" width="89" height="35" alt=""></td>
												<td align="center">
												<!-- <img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_23.png" width="53" height="35" alt="">-->
												</td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_15.png" width="54" height="35" alt=""></td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_21.png" width="89" height="35" alt=""></td>
												<td align="center"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_17.png" width="58" height="35" alt=""></td>
											</tr>
											<tr valign=top>
												<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/spacer.gif" height="6" alt=""></td>
												
												</tr>
											<tr valign=top>
												<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_32.png" width="1100" height="2" alt=""></td>
												
											</tr>
											
											
											<% 
									        Class.forName("com.mysql.jdbc.Driver");
									        Connection conn = null;
									        PreparedStatement pstmt = null;
									        PreparedStatement pstmt2 = null;
									        ResultSet rs = null;
									        ResultSet rs2 = null;
									         
									        try{
									            //String jdbcDriver = "jdbc:mysql://121.78.119.98:3333/stonepass";
									            //String dbUser = "ssendstone";
									            //String dbPwd = "tpstmxhs1!";
									             
									            String jdbcDriver = "jdbc:mysql://52.79.212.175/stonepass";
									            String dbUser = "root";
									            String dbPwd = "P@ssw0rd!@#";
									            
									            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
									            String wheresql = "";
									            if(stx.length()>0) {
									            	if(sfl.isEmpty()) {
									            		wheresql = "";
									            	}
									            	else if(sfl.equals("name")) {
									            		wheresql = " AND tsvl.USERNAME like '%" + stx + "%'";
									            	}
													else if(sfl.equals("cardnum")) {
														wheresql = " AND tsvl.CARDNUM like '%" + stx + "%'";
									            	}
												}
									            String sql = "select tsvl.*,tsv.CARDNUM as ORGCARDNUM,tsv.CVC as ORGCVC from tb_sp_votcmembers tsv, tb_sp_votccard_log tsvl where tsvl.UID = tsv.UID "+wheresql+" order by tsvl.USERNUM desc limit "+startRow+","+endRow+";";
									            String totalcntsql = "select count(*) as ORGCARDNUM from tb_sp_votcmembers tsv, tb_sp_votccard_log tsvl where tsvl.UID = tsv.UID " + wheresql + " ;";
									             
									            
									            //out.println(sql);
									            pstmt = conn.prepareStatement(sql);
									            pstmt2 = conn.prepareStatement(totalcntsql);
									             
									            rs = pstmt.executeQuery();
									            rs2 = pstmt2.executeQuery();
									            
									            int rowcount = 0;
									            
									            if(rs2.next()){ //Data의 총합구하는 식
									            	rowcount = rs2.getInt(1);
									            }
									            allPage = (rowcount-1)/ROWSIZE+1;// 전체 페이지수


									            while(rs.next()){
									    	%>
									    		<tr valign=top>
												<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/spacer.gif" height="10" alt=""></td>
												
												</tr>
												
									            <tr class="" onclick ="window.open('popUp.jsp','APPLOGINWIN', 'width=476, height=486, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200, location=no');">
									            	<td width="180" ><%
									            		String cardNum = rs.getString("ORGCARDNUM");
									            		cardNum = cardNum.toUpperCase();
									            		//out.println(cardNum);
									            		if(cardNum.substring(0,2).equals("40")) {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,8));
									            			out.print("-");
									            			out.print(cardNum.substring(8,12));
									            			out.print("-");
									            			out.print(cardNum.substring(12,16));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("51")
									            				||cardNum.substring(0,2).equals("52")
									            				||cardNum.substring(0,2).equals("53")
									            				||cardNum.substring(0,2).equals("54")
									            				||cardNum.substring(0,2).equals("55")
									            				) {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,8));
									            			out.print("-");
									            			out.print(cardNum.substring(8,12));
									            			out.print("-");
									            			out.print(cardNum.substring(12,16));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("34")
									            				||cardNum.substring(0,2).equals("37")
									            				) {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,10));
									            			out.print("-");
									            			out.print(cardNum.substring(10,15));
															
									            		}
									            		else {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,10));
									            			out.print("-");
									            			out.print(cardNum.substring(10,14));
															
									            		}
									            		%>
									            	</td>
									            	<td width="90" align="center"><%
									            		cardNum = rs.getString("CARDNUM");
									            		cardNum = cardNum.toUpperCase();
									            		//out.println(cardNum);
									            		if(cardNum.substring(0,2).equals("40")) {
									            			out.print(cardNum.substring(16,20));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("51")
									            				||cardNum.substring(0,2).equals("52")
									            				||cardNum.substring(0,2).equals("53")
									            				||cardNum.substring(0,2).equals("54")
									            				||cardNum.substring(0,2).equals("55")
									            				) {
									            			
									            			out.print(cardNum.substring(16,20));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("34")
									            				||cardNum.substring(0,2).equals("37")
									            				) {
									            			out.print(cardNum.substring(15,19));
									            			
									            		}
									            		else {
									            			out.print(cardNum.substring(14,18));
															
									            		}
									            		%>
									            	</td>
									            	<td width="80" align="center"><%= rs.getString("ORGCVC")	%>
									            	</td>
									            	<td width="190" ><%
									            		cardNum = rs.getString("CARDNUM");
									            		cardNum = cardNum.toUpperCase();
									            		//out.println(cardNum);
									            		if(cardNum.substring(0,2).equals("40")) {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,8));
									            			out.print("-");
									            			out.print(cardNum.substring(8,12));
									            			out.print("-");
									            			out.print(cardNum.substring(12,16));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("51")
									            				||cardNum.substring(0,2).equals("52")
									            				||cardNum.substring(0,2).equals("53")
									            				||cardNum.substring(0,2).equals("54")
									            				||cardNum.substring(0,2).equals("55")
									            				) {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,8));
									            			out.print("-");
									            			out.print(cardNum.substring(8,12));
									            			out.print("-");
									            			out.print(cardNum.substring(12,16));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("34")
									            				||cardNum.substring(0,2).equals("37")
									            				) {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,10));
									            			out.print("-");
									            			out.print(cardNum.substring(10,15));
															
									            		}
									            		else {
									            			out.print(cardNum.substring(0,4));
									            			out.print("-");
									            			out.print(cardNum.substring(4,10));
									            			out.print("-");
									            			out.print(cardNum.substring(10,14));
															
									            		}
									            		%>
									            	</td>
									            	
									            	<td width="80" align="center"><%
									            		cardNum = rs.getString("CARDNUM");
									            		cardNum = cardNum.toUpperCase();
									            		//out.println(cardNum);
									            		if(cardNum.substring(0,2).equals("40")) {
									            			out.print(cardNum.substring(16,20));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("51")
									            				||cardNum.substring(0,2).equals("52")
									            				||cardNum.substring(0,2).equals("53")
									            				||cardNum.substring(0,2).equals("54")
									            				||cardNum.substring(0,2).equals("55")
									            				) {
									            			
									            			out.print(cardNum.substring(16,20));
									            			
									            		}
									            		else if(cardNum.substring(0,2).equals("34")
									            				||cardNum.substring(0,2).equals("37")
									            				) {
									            			out.print(cardNum.substring(15,19));
									            			
									            		}
									            		else {
									            			out.print(cardNum.substring(14,18));
															
									            		}
									            		%>
									            	</td>
									            	<td align = "center">
									            	<!--  <%= rs.getString("OTP").toUpperCase() %>-->
									            	</td>
													<td width="90" align = "center"><%= rs.getString("USERNAME") %></td>
													<td width="90" align = "right"><%= rs.getString("PRICE") %>&nbsp;원&nbsp;</td>
													<td align = "center" width="150" ><%= rs.getString("REGDATE").substring(0,19) %></td>
													
												</tr>
												<tr valign=top>
												<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/spacer.gif" height="10" alt=""></td>
												
												</tr>
											
												<tr valign=top>
												<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_35.png" width="1100" height="1" alt=""></td>
												
												</tr>
												
									        <%
									            }
									        }catch(SQLException se){
									            se.printStackTrace();
									        }finally{
									            if(rs != null) rs.close();
									            if(pstmt != null) pstmt.close();
									            if(conn != null) conn.close();
									        }
									    	%>
    	
											<tr valign=top>
												<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/ADMIN_2_35.png" width="1100" height="1" alt=""></td>
												
											</tr>
											<tr valign=top>
											<td colspan="9"><img src="<%=request.getContextPath()%>/resources/images/spacer.gif" height="20" alt=""></td>
											
											</tr>
											
											<tr>
										        <td colspan="9" align="center">
										        <%
										        int PageBlock = BLOCK; //페이징 블럭 갯수 (5개씩)
										    	int pageCount = allPage; //페이징 개수 전체 카운트
										    	int startPage = (PageBlock*((pg-1)/PageBlock))+1; //시작페이지
										    	int endPage = startPage+(PageBlock-1); //끝페이지
										
										    	if(pageCount < endPage) endPage = pageCount; //마지막 페이지가 전체 페이징 개수 보다 크면 값을 같게 한다.
										    	if(startPage > PageBlock) { //시작 페이지가 블럭갯수보다 크면 [이전] 버튼 생성 
											    %> 
											    <a href="votc_reg_list.jsp?pg=<%=startPage-1%>&sfl=<%=sfl%>&stx=<%=stx%>">[이전]</a>
											    <%
											    	}
											    	for(int i=startPage; i<=endPage; i++){ //현재 페이지이면 링크 없애는 기능
											    	if(pg == i){ //시작페이지가 현재 페이지와 같으면 
											    %>
											    &nbsp;[<%=i%>]&nbsp; <!-- 링크를 없앤다. -->
											    <%
											    	}else{ 
											    %> <!-- 만악 다르면 -->
											    &nbsp;<a href="votc_reg_list.jsp?pg=<%=i%>&sfl=<%=sfl%>&stx=<%=stx%>">[<%=i%>]</a>&nbsp; <!-- 링크를 걸어준다. -->
											    <% 
											    	} 
											     }
											     if(endPage<pageCount) { //마지막 페이지보다 전체 페이징 개수가 크면
											    %> 
											    &nbsp;<a href="votc_reg_list.jsp?pg=<%=startPage+PageBlock%>&sfl=<%=sfl%>&stx=<%=stx%>">[다음]</a> <!-- 다음 페이지를 보여준다. -->
											    <% 
											     }
										        %>
										        </td>
										        </tr>
											
											
											</table>
											</td>
										</tr>
										
									</table>
								</td>
							</tr>
						</table>
					</td>
					
					
				</tr>
				
			</table>
		</td>
	</tr>
	
</table>
<!-- End Save for Web Slices -->
</body>
</html>