<%@page import="myPkg.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cancleBooking.jsp
<%
	int bookingnum = Integer.parseInt(request.getParameter("bookingnum"));
	BookingDao bdao = BookingDao.getInstance();
	int count = bdao.deleteByBookingum(bookingnum);
	String id = (String)session.getAttribute("id");
	if(id.equals("admin")){
		if(count >0 ){
			%>
			<script type="text/javascript">
				alert("취소성공");
				location.href="bookinglist.jsp"
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("취소실패");
				location.href="bookinglist.jsp"
			</script>
			<%
		}
	}else{
		if(count >0 ){
		%>
		<script type="text/javascript">
			alert("취소성공");
			location.href="../customer/myPage.jsp?code=2"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("취소실패");
			location.href="../customer/myPage.jsp?code=2"
		</script>
		<%
	}
	}
	
	
%>
<%=bookingnum%>