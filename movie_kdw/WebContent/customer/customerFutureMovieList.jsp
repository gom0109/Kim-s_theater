<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.JoinlistBean"%>
<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mainTop.jsp" %>

<%
	MovieDao mdao = MovieDao.getInstance();
	//ArrayList<MovieBean> list = mdao.getAllMovie();
	String requestFolder = request.getContextPath() + "/images";
	TheaterDao tdao = TheaterDao.getInstance();
	ArrayList<String> tlist = tdao.getlocation();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(System.currentTimeMillis());
	
	if(tlist.size()!=0){
		for(int i=0;i<tlist.size();i++){
			String loc = tlist.get(i);
			//System.out.println(loc);
			ArrayList<JoinlistBean> jl = mdao.getFutureInfoByLocation(loc,today); 
			int count = 0;
			%>
			
			<table border="0" class="movieTable2">
			<tr>
				<td colspan="2" class="t2" align="center"><h1 class="t2"><%=loc %>극장</h1></td>
			</tr>
			<tr>
			<%
			if(jl.size()==0){
				%><td><font size="4" color="#D5441C"><%=loc %>극장에서 개봉 예정중인 영화가 없습니다.</font></td><%
			}
			for(int j=0;j<jl.size();j++){
				JoinlistBean jbl = jl.get(j);
				count++;
				//System.out.println(jbl.getPoster());
				%>	
					<td><table border="1" class="movieTable">
					<tr>
					<td colspan="2"><img src="<%= requestFolder%>/<%=jbl.getPoster()%>" width="300px" height="450px"></td>
					</tr>
					<tr>
					<td class="tt">제목</td>
					<td class="t2"><%=jbl.getTitle() %></td>
					</tr>
					<tr>
					<td class="tt">감독</td>
					<td class="t2"><%=jbl.getTitle() %></td>
					</tr>
					<tr>
					<td class="tt">출연</td>
					<td class="t2"><%=jbl.getActor()%></td>
					</tr>
					<tr>
					<td class="tt">개봉일</td>
					<td class="t2"><%=jbl.getOpenDate() %></td>
					</tr>
					<tr>
					<td class="tt">상영관</td>
					<td class="t2"><%=jbl.getMultiplexnum() %>관</td>
					</tr>
					<td class="tt">상영시간</td>
					<td class="t2"><%=jbl.getRuntime() %>분</td>
					</tr>
					</tr>
					
					<td colspan="2" class="tt">
						<input type="button" value="예고편 보기" onclick="location.href='watchPreview.jsp?title=<%=jbl.getTitle()%>&theater=<%=jbl.getTheater()%>'">
					</td>
					</tr>
					
					</table></td>
				<%
				if(count%3==0){
					%>
					</tr><tr>
					<%
				}
			}
			%>
			</tr>
			</table>
			
			<%
		}
	}else{
		%><h1>등록된 극장이 없습니다</h1><%
	}
	
%>




<%@include file="mainBottom.jsp" %>