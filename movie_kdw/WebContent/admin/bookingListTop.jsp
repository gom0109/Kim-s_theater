<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDao memdao = MemberDao.getInstance();
ArrayList<String> memlist= memdao.allId();

int count=0;
%>
<table border="1" width="600px"class="movieTable">
	<tr>
		<td colspan="5" class="tt"><font size="5" >회원 목록</font></td>
	</tr>
	<tr>
		<%
			for(int i=0;i<memlist.size();i++){
				String memid = memlist.get(i);
				%><td align="center" width="20%"><a href="bookinglist.jsp?memid=<%=memid %>" style="text-decoration: none;"><font color="#D5441C" style="font-weight: bold"><%=memid %></font></a></td><%
				count++;
				if(count%5==0){
					%><tr></tr><%
				}
			}
		%>
	</tr>


</table>