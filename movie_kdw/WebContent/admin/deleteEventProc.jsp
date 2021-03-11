<%@page import="myPkg.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	EventDao edao = EventDao.getInstance();
	int cnt = edao.deleteEvent(boardNum); 
	
	if(cnt>0){
		int pageSize = 10;
		int recordCount = edao.getAll().size();
		int pageCount = recordCount/pageSize+ (recordCount%pageSize == 0 ? 0 : 1);
		
		if(pageNum>pageCount){
			pageNum=pageCount;
		}	
		
		response.sendRedirect("eventBoard.jsp?pageNum="+pageNum);
	}
	else{
		%>
		<script type="text/javascript">
			location.href="event.jsp?boardNum=<%=boardNum%>&pageNum=<%=pageNum%>";
			alert("삭제실패");
		
		</script>
		
		
		<%
	}
%>