<%@page import="myPkg.EventBean"%>
<%@page import="myPkg.EventDao"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminMainTop.jsp" %>

 <%	
    	int pageNum=1;
    	if(request.getParameter("pageNum")!=null){
    		pageNum = Integer.parseInt(request.getParameter("pageNum"));
    	}
    	EventDao edao = EventDao.getInstance();
    	ArrayList<EventBean> count = edao.getAll();
    	
    	int pageSize=10;
    	int startRow = (pageNum-1)*pageSize+1;
    	int endRow = pageNum*pageSize;
    	int number=count.size()-(pageNum-1)*pageSize;
    	ArrayList<EventBean> list = edao.getlist(startRow, endRow);
    %>
    


<table border="1" width=500px class="movieTable2">
	<tr>
		<td colspan="6" class="tt"><font size="5">이벤트 게시판</font></td>
	</tr>
	<tr>
		<th class="tt">번호</th>
		<th class="tt">제목</th>
		<th class="tt">작성일</th>
		<th class="tt">조회수</th>
		
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			EventBean ebean = list.get(i);
			%>
			<tr>
				<td class="t2" align="center"><%=number-- %></td>
			<td align="left">
			<a href="event.jsp?boardNum=<%=ebean.getBoardNum()%>&pageNum=<%=pageNum %>" style="text-decoration: none; color: #013C4D"><%=ebean.getBoardTitle() %></a>
				<%
					if(ebean.getReadcount()>10){
						%>
							<img src="../images/hot.gif" height="16">
						<%
					}
				
				%>			
			</td>			
			<td class="t2"  align="center"><%=ebean.getWritedate() %></td>
			<td class="t2"  align="center"><%=ebean.getReadcount() %></td>
			</tr>
			
			
			
			<%
		}
	
	
	%>
	
	
	
	<tr>
		<td colspan="6" class="tt">
		<%
		if(count.size()>0){
			int startPage = (pageNum-1)/10*10+1;
			int endPage = startPage+9;
			int lastPage = count.size()/10+ (count.size()%10 == 0 ? 0 : 1);;
			if(endPage>lastPage){
				endPage=lastPage;
			}
			if(startPage>1){
				%><a href="eventBoard.jsp?pageNum=<%=1%>">[<<]</a><%
				%><a href="eventBoard.jsp?pageNum=<%=startPage-10%>" >[<]</a><%
			}
			
			
			for(int i= startPage; i<=endPage;i++){
				%><a href="eventBoard.jsp?pageNum=<%=i%>" >[<%=i %>]</a><%
				
			}
			if(endPage<lastPage){
				%><a href="eventBoard.jsp?pageNum=<%=startPage+10%>">[>]</a><%
						%><a href="eventBoard.jsp?pageNum=<%=lastPage%>">[>>]</a><%
			}
		}
			
		%>
		
		</td>
	</tr>
	<tr>
		<td colspan="6" align="right" bgcolor="#013C4D"><input type="button" value="글쓰기" onclick="location.href='eventInsert.jsp'"></td>
	</tr>
	

</table>



<%@include file="adminMainBottom.jsp" %>