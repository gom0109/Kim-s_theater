<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminMainTop.jsp<br> -->
<link rel="stylesheet" type="text/css" href= "style.css"/>
<%
	String id = (String)session.getAttribute("id");
	//System.out.println(id);
	if(id==null){
		response.sendRedirect("../customer/login.jsp");
	}
	else{
		if(id.equals("admin")){
		%>
		<table width="100%" height="100%" >
	<tr>
		<td  height="5%" bgcolor="#013C4D" align="center" >
			<a href="adminMain.jsp" style="text-decoration: none;"><font color="#D5441C" size="6">관리자 페이지</h1></font></a>
			
		</td>
		<td colspan="3" bgcolor="#013C4D" align="center">
			
			<a href="adminMain.jsp"><img src="../images/logo2.png" width="30%"></a>
		</td>
		<td align="right" valign="top" id="log" bgcolor="#013C4D">
				<a href="../customer/logout.jsp">로그아웃</a>|
				<a href="../customer/main.jsp">사용자 메인페이지</a>
		</td>
	</tr>
	<tr align="center" id="mbar" >
		<td width="20%" height="5%"><a href="manageTheater.jsp"><h2>상영관 관리</h2></a></td>
		<td width="20%"><a href="adminAddMovie.jsp"><h2>영화 추가</h2></a></td>
		<td width="20%"><a href="adminMovieList.jsp"><h2>영화 목록</h2></a></td>
		<!-- <td width="20%" height="8%"><a href="timeSet.jsp"><h2>영화 시간설정</h2></a></td> -->
		
		<td width="20%"><a href="bookinglist.jsp"><h2>예매 현황</h2></a></td>
		<td width="20%"><a href="eventBoard.jsp"><h2>이벤트 게시판</h2></a></td>
	</tr>
	<tr>
		<td colspan="5" height="70%" valign="top">
		<%
	}else{
		response.sendRedirect("../customer/main.jsp");
		
	}
	}
	
%>

