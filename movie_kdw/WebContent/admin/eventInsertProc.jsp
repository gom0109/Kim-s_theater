<%@page import="myPkg.EventDao"%>
<%@page import="myPkg.EventBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String boardTitle = request.getParameter("boardTitle");
	
	String bta = request.getParameter("bta");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String writedate = sdf.format(System.currentTimeMillis());

	EventDao edao = EventDao.getInstance();
	int cnt = edao.insertBoard(boardTitle,writedate,bta);  
	if(cnt>0){
		%>
		<script type="text/javascript">
			location.href="eventBoard.jsp";
		</script>
	<%
	}else{
		%>
			<script type="text/javascript">
				alert("삽입실패");
				location.href="eventInsert.jsp";
			</script>
		<%
	}

%>

