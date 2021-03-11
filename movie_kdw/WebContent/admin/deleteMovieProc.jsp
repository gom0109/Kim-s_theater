<%@page import="myPkg.MovieBean"%>
<%@page import="myPkg.BookingDao"%>
<%@page import="java.io.File"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- deleteMovieProc.jsp -->
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String poster = request.getParameter("poster");
	String uploadDir = config.getServletContext().getRealPath("/images");
	//System.out.println(poster);
	MovieDao mdao = MovieDao.getInstance();
	MovieBean mbean = mdao.getMovieByNum(num);
	String theater = mbean.getTheater();
	String title = mbean.getTitle();
	mdao.deleteLink(theater, title);
	
	
	File delFile = null;
	File dir = new File(uploadDir);
	if(poster!= null){
		delFile = new File(dir,poster);
		delFile.delete();
	}
	
	
	int cnt = mdao.deleteMovieByNum(num);
	BookingDao bdao = BookingDao.getInstance();
	bdao.deleteBookingByMnum(num);
	
	
	if(cnt>0){
		response.sendRedirect("adminMovieList.jsp");
		
		
		
	}
	else{
		%>
		<script type="text/javascript">
			alert("삭제 실패")
			location.href="adminMovieList.jsp"
		</script>
		<%
		
	}
%>