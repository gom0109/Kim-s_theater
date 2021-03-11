<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mainTop.jsp<br> -->
<link rel="stylesheet" type="text/css" href= "style.css"/>
<%
	String id = (String)session.getAttribute("id");
	//System.out.println(id);
%>

<table width="100%" height="100%" >
	<tr>
		<td height="5%" bgcolor="#013C4D" align="center">
			
		</td>
		<td colspan="2" align="center" bgcolor="#013C4D">
			<a href="main.jsp"><img src="../images/logo2.png" width="30%"></a>
		</td>
		<td align="right" valign="top" id="log" bgcolor="#013C4D"> 
		<%
			if(id==null){
				%>
				<a href="login.jsp" >로그인</a>|
				<a href="customerJoin.jsp">회원가입</a>
				<%
			}else{
				%>
				<a href="logout.jsp">로그아웃</a>|
				
				<%
				if(id.equals("admin")){
					%>
					<a href="../admin/adminMain.jsp">관리자 페이지</a>
					<%
				}else{
					%><a href="myPage.jsp">마이페이지</a><%
				}
			}
		%>
			
		</td>
	</tr>
	<tr align="center" id="mbar" >
		<td height="5%" ><a href="customerCurrentMovieList.jsp"><font size="6">현재 상영작</font></a></td>
		<td><a href="customerFutureMovieList.jsp"><font size="6">개봉 예정작</font></a></td>
		<td><a href="movieBooking.jsp"><font size="6">예매</font></a></td>
		<td><a href="board.jsp"><font size="6">영화 리뷰</font></a></td>
	</tr>
	<tr>
		<td colspan="4" height="80%" valign="top" id="mainTable">