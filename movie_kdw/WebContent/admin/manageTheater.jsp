<%@page import="myPkg.TheaterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	TheaterDao tdao = TheaterDao.getInstance();
	ArrayList<TheaterBean> list = tdao.getAllTheater();


%>
    
<%@include file="adminMainTop.jsp" %>

<table border="1" width="700px" class="movieTable2">
	<tr>
		<td colspan="5" class="tt"><font size="5">상영관 목록</font></td>
	</tr>
	<tr >
		<th class="tt">번호</th>
		<th class="tt">지역</th>
		<th class="tt">상영관 번호</th>
		<th class="tt">좌석수</th>
		<th class="tt">수정 | 삭제</th>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			TheaterBean tbean = list.get(i);
			%>
				<tr align="center">
					<td class="t2"><%=tbean.getNum() %></td>
					<td class="t2"><%=tbean.getLocation() %></td>
					<td class="t2"><%=tbean.getMultiplexnum() %>관</td>
					<td class="t2"><%=tbean.getSeatnum() %></td>
					<td><a href="updateTheater.jsp?num=<%=tbean.getNum() %>">수정 |</a><a href="deleteTheater.jsp?num=<%=tbean.getNum() %>"> 삭제</a></td>
				</tr>
			<%
			
		}
	%>
	<tr>
		<td colspan="5" align="right" style="background-color: #013C4D;"><input type="button" value="상영관 추가" onclick="location.href='addTheater.jsp'"></td>
	</tr>

</table>



<%@include file="adminMainBottom.jsp" %>