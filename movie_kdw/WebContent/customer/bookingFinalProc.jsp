<%@page import="myPkg.BookingBean"%>
<%@page import="myPkg.BookingDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
bookingFinalProc.jsp


<%
	request.setCharacterEncoding("UTF-8");
	int mnum = Integer.parseInt(request.getParameter("mnum")); 
	String bookingDate = request.getParameter("bookingDate");
	String time = request.getParameter("time");
	String seat = request.getParameter("seat");
	/* String [] seat = temp.split(" ");
	for(int i=0;i<seat.length;i++){
		out.print(seat[i]+"<br> ");
	} */

	String id = (String)session.getAttribute("id");
	
	SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	String paytime = sdf.format(System.currentTimeMillis());
	int price = 7000;
	BookingDao bdao = BookingDao.getInstance();
	BookingBean bbean = new BookingBean(0,id,paytime,mnum,bookingDate,time,seat,price);
	int count = bdao.insertBookData(bbean);
	if(count >0 ){
		%>
		<script type="text/javascript">
			alert("예약성공");
			location.href="main.jsp"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("예약실패");
			location.href="main.jsp"
		</script>
		<%
	}
	
%>
<%=id %><br>
<%=mnum%><br>
<%=bookingDate%><br>
<%=paytime%><br>


