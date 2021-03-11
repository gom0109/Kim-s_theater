<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
addTheaterProc.jsp
<%
	request.setCharacterEncoding("UTF-8");
	String location = request.getParameter("location");
	int multiplexnum =Integer.parseInt(request.getParameter("multiplexnum"));
	int seatnum =Integer.parseInt(request.getParameter("seatnum"));
	TheaterBean tbean = new TheaterBean(0,location,multiplexnum,seatnum);
	TheaterDao tdao = TheaterDao.getInstance();
	int cnt = tdao.insertData(tbean);
	if(cnt>0){
		response.sendRedirect("manageTheater.jsp");
		
	}else{
		%>
		<script type="text/javascript">
			alert("삽입실패");
			location.href="addTheater.jsp"
		</script>
		<%
		
	}
%>
