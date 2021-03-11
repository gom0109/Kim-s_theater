<%@page import="myPkg.JoinlistBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mainTop.jsp" %>
<%@include file="movieBookingTop.jsp" %>


<%
if(id==null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="login.jsp"
		</script>
	<%
}
	String location = request.getParameter("location");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(System.currentTimeMillis());
	String path = request.getContextPath()+"/images";
	int count=0;
	if(location!=null){
		
		MovieDao mdao = MovieDao.getInstance();
		ArrayList<JoinlistBean> jl = mdao.getCurrentInfoByLocation(location, today);
		
		if(jl.size()!=0){
			
			%><font size="6" color="#013C4D">예매하실 영화를 선택해주세요</font><br>
		
			<table border="0">
			<tr>
			<%
			
			for(int i=0;i<jl.size();i++){
				count++;
				JoinlistBean jlb= jl.get(i);
				if(jlb!=null){
					%>
					<td align="center"><font size="6" ><a style="text-decoration: none; color: #013C4D" href="timeTable.jsp?num=<%=jlb.getNum()%>">
					<img src="<%=path%>/<%=jlb.getPoster()%>" width="300px" height="450px"><br><%=jlb.getTitle()%></a></font></td>
					<%
					if(count%5==0){
						%></tr><tr><%
					}
				}
			}
			%>
			</tr>
			</table>
			<%
		}else{
			
			%><font size="4" color="#013C4D">현재 <%=location %>극장에서 상영중인 영화가 없습니다.</font><br>
			<%
		}
		
	}
%>



<%@include file="mainBottom.jsp" %>