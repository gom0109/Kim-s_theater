<%@page import="myPkg.BookingDao"%>
<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	BookingDao bdao = BookingDao.getInstance();
	bdao.deleteBookingById(id);
	MemberDao mdao = MemberDao.getInstance();
	int count = mdao.goodBye(id);
	
	
	if(count >0 ){
		session.invalidate();
		%>
		<script type="text/javascript">
			alert("그동안 이용해주셔서 감사합니다.");
			location.href="main.jsp"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("삭제실패");
			location.href="myPage.jsp?code=3"
		</script>
		<%
	}
	
%>
