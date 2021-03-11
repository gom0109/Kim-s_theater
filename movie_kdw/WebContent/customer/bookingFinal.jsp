<%@page import="java.text.DecimalFormat"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.JoinlistBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mainTop.jsp" %>
<%
if(id==null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="login.jsp"
		</script>
	<%
}
	request.setCharacterEncoding("UTF-8");
	String seat = "";
	String[] temp =request.getParameterValues("seat");
	for(int i=0;i<temp.length;i++){
		seat = seat +temp[i]+" ";
	}
	String bookingDate = request.getParameter("bookingDate");
	String time = request.getParameter("time");
	int num = Integer.parseInt(request.getParameter("mnum"));  
	MovieDao mdao = MovieDao.getInstance();
	JoinlistBean jlb = mdao.getAllInfoByMovieNum(num);
	String path = request.getContextPath()+"/images";
	DecimalFormat df = new DecimalFormat("###,###");
	
	
	
%>

<form method="post" action="bookingFinalProc.jsp">
<input type="hidden" name="mnum" value="<%=num%>">
<input type="hidden" name="seat" value="<%=seat%>">
<input type="hidden" name="bookingDate" value="<%=bookingDate%>">
<input type="hidden" name="time" value="<%=time%>">

<table border="1" class="movieTable">
	<tr>
		<td colspan="2">
		<img src="<%=path%>/<%=jlb.getPoster()%>" width="300px">
		</td>
	</tr>
	<tr>
		<td class="tt">제목</td>
		<td class="t2"><%=jlb.getTitle() %></td>
	</tr>
	<tr>
		<td class="tt">상영일</td>
		<td  class="t2"><%=bookingDate %></td>
	</tr>
	<tr>
		<td class="tt">상영시간</td>
		<td  class="t2"><%=time %></td>
	</tr>
	<tr>
		<td class="tt">상영관</td>
		<td  class="t2"><%=jlb.getLocation() %>극장 <%=jlb.getMultiplexnum() %>관</td>
	</tr>
	<tr>
		<td class="tt">선택좌석</td>
		<td  class="t2">
			<%
				for(int i=0;i<temp.length;i++){
					out.print(temp[i]+" ");
				}
			%>
		</td>
	</tr>
	<tr>
		<td class="tt">결재 금액</td>
		<td  class="t2"><%=df.format(temp.length*7000)%>원</td>
	</tr>
	<tr>
		<td colspan="2" class="tt">
		<input type="submit" value="결재하기">
		<input type="button" value="좌석 다시 선택하기" onclick="history.go(-1)">
		<input type="button" value="메인페이지" onclick="location.href='main.jsp'">
		
		</td>
		
	</tr>
	

</table>
</form>



<%@include file="mainBottom.jsp" %>