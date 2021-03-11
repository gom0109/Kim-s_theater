<%@page import="myPkg.EventBean"%>
<%@page import="myPkg.EventDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mainTop.jsp" %>
<%
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	EventDao edao = EventDao.getInstance();
	EventBean ebean = edao.getevent(boardNum);  
	
%>

   

<table width = "700" height = "200" border="1" class="movieTable2">
	<tr>
		<td width = "25%" class="tt" colspan="4">이벤트 내용보기</td>
	</tr>

	<tr>
		<td width = "25%" class="tt">글번호</td>
		<td width = "25%" class="t2"><%=ebean.getBoardNum() %></td>
		<td width = "25%" class="tt">조회수</td>
		<td width = "25%" class="t2"><%=ebean.getReadcount() %></td>
	</tr>
	<tr>
	<td class="tt">글제목</td>
		<td class="t2"><%=ebean.getBoardTitle() %></td>
		<td class="tt">작성일</td>
		<td class="t2"><%=ebean.getWritedate() %></td>
	</tr>
	<tr>
		<td class="tt">글내용</td>
		<td colspan="3" class="t2"><%=ebean.getBta() %></td>
	</tr>
	<tr>		
		<td colspan="4" align="right" bgcolor="#013C4D">
			
			<input type="button" value="뒤로가기" onclick="history.go(-1)">
			<input type="button" value="이벤트 목록보기" onclick="location.href='customerEventBoard.jsp'">
		</td>
	</tr>



</table>

<%@include file="mainBottom.jsp" %>