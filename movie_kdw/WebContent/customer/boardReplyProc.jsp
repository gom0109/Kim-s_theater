<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String writer = request.getParameter("writer");
	String boardTitle = request.getParameter("boardTitle");
	String boardpw = request.getParameter("boardpw");
	String bta = request.getParameter("bta");
	int starPoint =Integer.parseInt(request.getParameter("starPoint"));
	int ref =Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String writedate = sdf.format(System.currentTimeMillis());

	BoardDao bdao = BoardDao.getInstance();
	BoardBean bbean = new BoardBean(0, writer,boardTitle,boardpw,writedate,0,bta,starPoint,ref,re_step,re_level);
	int cnt = bdao.insertReply(bbean); 
	if(cnt>0){
		%>
		<script type="text/javascript">
			location.href="board.jsp";
		</script>
	<%
	}else{
		%>
			<script type="text/javascript">
				alert("삽입실패");
				history.go(-1);
			</script>
		<%
	}

%>
<%-- <%=writer%><br>
<%=boardTitle%><br>
<%=boardpw%><br>
<%=boardTextArea%><br>
 --%>
