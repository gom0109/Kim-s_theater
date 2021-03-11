<%@page import="java.util.HashSet"%>
<%@page import="myPkg.TheaterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- addMovieProc.jsp<br> -->
<%
	String uploadDir = config.getServletContext().getRealPath("/images");
	//System.out.println(uploadDir);
	String requestFolder = request.getContextPath() + "/images";
	//System.out.println(requestFolder);
	MultipartRequest mr = new MultipartRequest(request, uploadDir, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
	
	String theater = mr.getParameter("theater");
	String title = mr.getParameter("title");
	String director = mr.getParameter("director");
	String actor = mr.getParameter("actor");
	String poster = mr.getFilesystemName("poster");
	String openDate = mr.getParameter("openDate");
	String closeDate = mr.getParameter("closeDate");
	String runtime = mr.getParameter("runtime");
	String link = mr.getParameter("link");
	//System.out.println("poster: "+poster);
	
	
	 //System.out.println("theater: "+theater);
	
	MovieDao mdao = MovieDao.getInstance();
	MovieBean mbean = new MovieBean(0, theater, title, director, actor, poster, openDate,closeDate, runtime);
	int previewInsertcnt = mdao.insertPreview(theater,title,link);
	System.out.println("previewInsertcnt: "+previewInsertcnt);
	int cnt  = mdao.insertMovie(mbean);
	if(cnt>0){
		%>
		<script type="text/javascript">
			location.href="adminMovieList.jsp";
		</script>
	<%
	}else{
		%>
			<script type="text/javascript">
				alert("삽입실패");
				location.href="adminAddMovie.jsp";
			</script>
		<%
	}
%>