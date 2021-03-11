<%@page import="myPkg.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.deleteContent(boardNum);
	
	if(cnt>0){
		int pageSize = 10;
		int recordCount = bdao.getAll().size();
		int pageCount = recordCount/pageSize+ (recordCount%pageSize == 0 ? 0 : 1);
		
		if(pageNum>pageCount){
			pageNum=pageCount;
		}	
		
		response.sendRedirect("board.jsp?pageNum="+pageNum);
	}
	else{
		%>
		<script type="text/javascript">
			location.href="boardDeleteForm.jsp?boardNum=<%=boardNum%>&pageNum=<%=pageNum%>";
			alert("삭제실패");
		
		</script>
		
		
		<%
	}
%>