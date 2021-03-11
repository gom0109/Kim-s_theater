<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	//out.print(num);
	TheaterDao tdao = TheaterDao.getInstance();
	MovieDao mdao = MovieDao.getInstance();
	
	int cnt = tdao.deleteTheaterByNum(Integer.parseInt(num));
	mdao.deleteMovieByTheater(num); 
	if(cnt>0){
		response.sendRedirect("manageTheater.jsp");
	}else{
		%>
		<script>
			alert("삭제 실패");
			location.href="manageTheater.jsp"
		</script>
		<%
		
	}
%>
