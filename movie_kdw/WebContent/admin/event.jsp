<%@page import="myPkg.EventBean"%>
<%@page import="myPkg.EventDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminMainTop.jsp" %>
<%
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	EventDao edao = EventDao.getInstance();
	EventBean ebean = edao.getevent(boardNum);  
	
%>


    <script type="text/javascript">
    	function deleteCheck(){
    		var ans = confirm("정말 삭제하시겠습니까?");
    		if(ans==true){
    			location.href='deleteEventProc.jsp?boardNum=<%=boardNum%>&pageNum=<%=pageNum%>'
    		}
    	}
    
    </script>

<table width = "700" height = "200" border="1" class="movieTable">
	<tr>
		<td width = "25%" class="tt" colspan="4"><font size="5">이벤트 내용보기</font></td>
	</tr>

	<tr>
		<td width = "25%" class="tt">글번호</td>
		<td width = "25%"><%=ebean.getBoardNum() %></td>
		<td width = "25%" class="tt">조회수</td>
		<td width = "25%"><%=ebean.getReadcount() %></td>
	</tr>
	<tr>
	<td class="tt">글제목</td>
		<td ><%=ebean.getBoardTitle() %></td>
		<td class="tt">작성일</td>
		<td><%=ebean.getWritedate() %></td>
	</tr>
	<tr>
		<td class="tt">글내용</td>
		<td colspan="3" ><%=ebean.getBta() %></td>
	</tr>
	<tr>		
		<td colspan="4"align="right" class="tt">
			<input type="button" value="글수정" onclick="location.href='eventUpdateForm.jsp?boardNum=<%=boardNum%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" onclick="deleteCheck()">
			<input type="button" value="글목록" onclick="location.href='eventBoard.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>



</table>


<%@include file="adminMainBottom.jsp" %>