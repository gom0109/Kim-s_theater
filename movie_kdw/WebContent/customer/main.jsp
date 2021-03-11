
<%@page import="myPkg.EventDao"%>
<%@page import="myPkg.EventBean"%>
<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
<%@page import="myPkg.JoinlistBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main.jsp<br> -->
<%@include file="mainTop.jsp" %>
<%
	MovieDao mdao = MovieDao.getInstance();
	ArrayList<String>list = mdao.getLinkCount();
	String link="https://www.youtube.com/embed/8c8sBrMvqWY";
	if(list.size()!=0){
		Random random = new Random();
		int randNum = random.nextInt(list.size());
		link = list.get(randNum);
	}
	
%>
<div class="videowrapper">
<iframe width="100%" height="auto"  src="<%=link %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
<%	
    
    	BoardDao bdao = BoardDao.getInstance();
    	ArrayList<BoardBean> count =bdao.getAll();
    	
    	
    	int startRow = 1;
    	int endRow = 5;
    	int number=5;
    	ArrayList<BoardBean> lists =bdao.getlist(startRow, endRow);
    	EventDao edao = EventDao.getInstance();
    	ArrayList<EventBean> eventlist = edao.getlist(startRow, endRow);
    %>
<table border="1" id="boardTable">
	<tr>
		<td colspan="6" class="tt">
		<font size="5"><a href="board.jsp">영화 리뷰</a></font>
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
		for(int i=0;i<lists.size();i++){
			BoardBean bbean = lists.get(i);
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
			
			<a href="content.jsp?boardNum=<%=bbean.getBoardNum()%>&pageNum=1" style="text-decoration: none; color: #013C4D"><%=bbean.getBoardTitle() %></a>
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
	
	
	
	
	

</table>

<table border="1" id="eventTable">
	<tr>
		<td colspan="6" class="tt">
		<font size="5"><a href="customerEventBoard.jsp">이벤트</a></font>
		</td>
	</tr>
	<tr>
		<th class="tt">번호</th>
		<th class="tt">제목</th>
		<th class="tt">작성일</th>
		<th class="tt">조회수</th>
		
	</tr>
	<%int eventNumber=5;
		for(int i=0;i<eventlist.size();i++){
			EventBean ebean = eventlist.get(i);
			%>
			<tr>
				<td class="t2"><%=eventNumber-- %></td>
			<td align="left">
			<a href="customerEvent.jsp?boardNum=<%=ebean.getBoardNum()%>&pageNum=1" style="text-decoration: none; color: #013C4D"><%=ebean.getBoardTitle() %></a>
				<%
					if(ebean.getReadcount()>10){
						%>
							<img src="../images/hot.gif" height="16">
						<%
					}
				
				%>			
			</td>			
			<td class="t2"><%=ebean.getWritedate() %></td>
			<td class="t2"><%=ebean.getReadcount() %></td>
			</tr>
			
			
			
			<%
		}
	
	
	%>
	
	

</table>

<%@include file="mainBottom.jsp" %>