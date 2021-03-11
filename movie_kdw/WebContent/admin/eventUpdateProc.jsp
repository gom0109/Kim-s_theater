<%@page import="myPkg.EventDao"%>
<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));	
	String boardTitle = request.getParameter("boardTitle");
	String bta = request.getParameter("bta");
	
	EventDao edao = EventDao.getInstance();
	
	int cnt = edao.updateEvent(boardNum,boardTitle,bta); 
	if(cnt>0){
		response.sendRedirect("eventBoard.jsp?pageNum="+pageNum);
	}else{
		%>
		<script type="text/javascript">
			alert("수정실패");
			<%-- location.href="updateForm.jsp?num=<%=bean.getNum()%>"; --%>
			history.back();
			/* history.go(-1); */
		</script>
		
		<%
		//response.sendRedirect("updateForm.jsp?num="+bean.getNum());
	}
%>