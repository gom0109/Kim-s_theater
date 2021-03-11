<%@page import="myPkg.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%	
    	int pageNum=1;
    	if(request.getParameter("pageNum")!=null){
    		pageNum = Integer.parseInt(request.getParameter("pageNum"));
    	}
    	BoardDao bdao = BoardDao.getInstance();
    	ArrayList<BoardBean> count =bdao.getAll();
    	
    	int pageSize=10;
    	int startRow = (pageNum-1)*pageSize+1;
    	int endRow = pageNum*pageSize;
    	int number=count.size()-(pageNum-1)*pageSize;
    	ArrayList<BoardBean> list =bdao.getlist(startRow, endRow);
    %>
    <style type="text/css">
    #boardTable{
    	text-align: center;
    }
    </style>
    
<%@include file="mainTop.jsp" %>

<table border="1" class="movieTable2" width="50%">
	<tr>
		<td colspan="6" class="tt">
		<font size="5">영화 리뷰 게시판</font>
		</td>
	</tr>
	<tr>
		<td class="tt">번호</td>
		<td class="tt">제목</td>
		<td class="tt">별점</td>
		<td class="tt">작성자</td>
		<td class="tt">작성일</td>
		<td class="tt">조회수</td>
		
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			BoardBean bbean = list.get(i);
			%>
			<tr>
				<td class="t2"><%=number-- %></td>
			<td align="left">
			<% 
					int wid = 0;
					if(bbean.getRe_level() >0){
						wid = 20*bbean.getRe_level();
					%>
						<img src="../images/level.gif" width="<%=wid%>" height="16">
						<img src="../images/re.gif" height="16">
					<%
					}
				%>
			
			<a href="content.jsp?boardNum=<%=bbean.getBoardNum()%>&pageNum=<%=pageNum %>" style="text-decoration: none; color: #013C4D"><%=bbean.getBoardTitle() %></a>
				<%
					if(bbean.getReadcount()>10){
						%>
							<img src="../images/hot.gif" height="16">
						<%
					}
				
				%>			
			</td>
			
			<td class="t2">
				<%	String star = "";
					for(int j=0;j<bbean.getStarPoint();j++){
						star=star+"★";
					}
				%>
			<%=star%></td>
			<td class="t2"><%=bbean.getWriter() %></td>
			<td class="t2"><%=bbean.getWritedate() %></td>
			<td class="t2"><%=bbean.getReadcount() %></td>
			</tr>
			
			
			
			<%
		}
	
	
	%>
	
	
	
	<tr>
		<td colspan="6" class="tt" >
		<%
		if(count.size()>0){
			int startPage = (pageNum-1)/10*10+1;
			int endPage = startPage+9;
			int lastPage = count.size()/10+ (count.size()%10 == 0 ? 0 : 1);;
			if(endPage>lastPage){
				endPage=lastPage;
			}
			if(startPage>1){
				%><a href="board.jsp?pageNum=<%=1%>">[<<]</a><%
				%><a href="board.jsp?pageNum=<%=startPage-10%>" >[<]</a><%
			}
			
			
			for(int i= startPage; i<=endPage;i++){
				%><a href="board.jsp?pageNum=<%=i%>">[<%=i %>]</a><%
				
			}
			if(endPage<lastPage){
				%><a href="board.jsp?pageNum=<%=startPage+10%>" >[>]</a><%
						%><a href="board.jsp?pageNum=<%=lastPage%>" >[>>]</a><%
			}
		}
			
		%>
		
		</td>
	</tr>
	<tr>
		<td colspan="6" align="right" class="tt"><input type="button" value="글쓰기" onclick="location.href='boardInsert.jsp'"></td>
	</tr>
	

</table>


<%@include file="mainBottom.jsp" %>