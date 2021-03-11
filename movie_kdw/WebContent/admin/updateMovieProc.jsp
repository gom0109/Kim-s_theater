<%@page import="java.util.HashSet"%>
<%@page import="myPkg.TheaterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- updateMovieProc.jsp<br> -->
<%

	String uploadDir = config.getServletContext().getRealPath("/images");

	String requestFolder = request.getContextPath() + "/images";

	MultipartRequest mr = new MultipartRequest(request, uploadDir, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
	
	int num = Integer.parseInt(mr.getParameter("num"));
	String theater = mr.getParameter("theater");
	String title = mr.getParameter("title");
	String director = mr.getParameter("director");
	String actor = mr.getParameter("actor");
	String poster = mr.getParameter("poster");
	String openDate = mr.getParameter("openDate");
	String closeDate = mr.getParameter("closeDate");
	String runtime = mr.getParameter("runtime");
	
	String newPoster=null;
	File delFile = null;
	File dir = new File(uploadDir);
	
	if(mr.getFilesystemName("newPoster")==null){
		newPoster=poster;
	}else{
			newPoster=mr.getFilesystemName("newPoster");
			//System.out.println(newPoster);
			//System.out.println(poster);
			delFile = new File(dir, poster);
			delFile.delete();
	}
	

	
	
	MovieBean mbean = new MovieBean(num,theater, title, director, actor, newPoster, openDate,closeDate, runtime);
	
	MovieDao mdao = MovieDao.getInstance();
	int cnt = mdao.updateMovie(mbean);
	
	if(cnt>0){
		response.sendRedirect("adminMovieList.jsp");
		
	}
	else{
		%>
		<script type="text/javascript">
			alert("수정 실패")
			location.href="updateMovie.jsp?num=<%=num%>"
		</script>
		<%
		
	}
	
%>





















