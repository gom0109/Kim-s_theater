<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="mainTop.jsp" %>
<%
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDao dao = BoardDao.getInstance();
	BoardBean bbean = dao.getContent(boardNum);
	int ref =bbean.getRef();
	int re_step = bbean.getRe_step();
	int re_level = bbean.getRe_level();
%>

	
<table width = "700" height = "200" border="1" class="movieTable">
	<tr>
		<td colspan="4" class="tt"><font size="5">글내용 보기</font></td>
	</tr>
	<tr>
		<td width = "25%" class="tt">글번호</td>
		<td width = "25%"><%=bbean.getBoardNum() %></td>
		<td width = "25%" class="tt">조회수</td>
		<td width = "25%"><%=bbean.getReadcount() %></td>
	</tr>
	<tr>
		<td class="tt">작성자</td>
		<td><%=bbean.getWriter() %></td>
		<td class="tt">작성일</td>
		<td><%=bbean.getWritedate() %></td>
	</tr>
	<tr>
		<td class="tt">글제목</td>
		<td ><%=bbean.getBoardTitle() %></td>
		<td class="tt">별점</td>
		<td><%	String star = "";
					for(int j=0;j<bbean.getStarPoint();j++){
						star=star+"★";
					}
				%>
			<%=star%></td>
	</tr>
	<tr>
		<td class="tt">글내용</td>
		<td colspan="3" ><%=bbean.getBta() %></td>
	</tr>
	<tr>		
		<td colspan="4"align="right" class="tt">
			<input type="button" value="글수정" onclick="location.href='boardUpdateForm.jsp?boardNum=<%=boardNum%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" onclick="location.href='boardDeleteForm.jsp?boardNum=<%=boardNum%>&pageNum=<%=pageNum%>'">
			<input type="button" value="답글쓰기" onclick="location.href='boardReplyForm.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
			<input type="button" value="글목록" onclick="location.href='board.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>



</table>

<%@include file="mainBottom.jsp" %>