<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.BookingDao"%>
<%@page import="myPkg.JoinlistBean"%>
<%@page import="myPkg.MovieDao"%>
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
	String bookingDate = request.getParameter("bookingDate");
	String time = request.getParameter("time");
	int num = Integer.parseInt(request.getParameter("mnum"));  
	
	MovieDao mdao = MovieDao.getInstance();
	JoinlistBean jlb = mdao.getAllInfoByMovieNum(num);
	int seatNum = jlb.getSeatnum();
	
	BookingDao bdao = BookingDao.getInstance();
	ArrayList<String> blist = bdao.getBookedSeat(num,bookingDate,time);
	
	
	 String bookedSeat = "";
	for(int i=0;i<blist.size();i++){
		bookedSeat = bookedSeat + blist.get(i)+ " ";
	}
	//out.print(blist.size()+"<br>"); 
	//out.print(jlb.getSeatnum()+"<br>"); 
	if(blist.size()>=jlb.getSeatnum()){
		%>
		<script type="text/javascript">
			alert("매진되었습니다.");
			history.go(-1);
		</script>
	<%
	}
%>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function checkData(){
	var count=0;
	$('input[type="checkbox"]').each(function() {
		if(this.checked){//checked 처리된 항목의 값
			count++;
	    }

	});
	if(count==0){
		alert("최소 한개의 좌석을 선택해 주세요")
		return false;
	}
	
}



</script>



<form method="post" action="bookingFinal.jsp">
<input type="hidden" name="mnum" value="<%=num%>">
<input type="hidden" name="bookingDate" value="<%=bookingDate%>">
<input type="hidden" name="time" value="<%=time%>">


<br>
<table border="1" id="t1">
<tr>
	<td class="tt">영화 제목 </td>
	<td class="t2"><%=jlb.getTitle() %></td>
</tr>
<tr>
	<td class="tt">상영일 </td>
	<td class="t2"><%=bookingDate %></td>
</tr>
<tr>
	<td class="tt">상영관 </td>
	<td class="t2"><%=jlb.getLocation() %>극장 <%=jlb.getMultiplexnum() %>관</td>
</tr>
<tr>
	<td class="tt">상영시간 </td>
	<td class="t2"><%=time %></td>
</tr>

</table>
<br>

<table border="1" class="movieTable">
	<tr>
		<td colspan="5" width="1000px" height="10%" bgcolor="black">
		<font size="10" style="font-weight: bolder;" color="white"> s c r e e n </font></td>
	</tr>
	<tr>
		<td width="30%" height="500px">
		<table >
		<tr>
		<%
			int count=0;
		for(int i=1;i<=seatNum/3+seatNum%3;i++){
			count++;
			String seat ="";
			if(i<10){
				seat = "L0"+i;
			}else{
				seat = "L"+i;
			}
			
			if(bookedSeat.contains(seat)){
				%><td class="t2">X</td><%
			}else{
				%><td class="t2"><input type="checkbox" name="seat" value="<%=seat%>"><%=seat%></td><%
			}
			
			
			if(count%5==0){
				%></tr><tr><%
			}
		}		
		%>
		</tr>
		</table>
		
		</td>
		<td width="5%" class="t2"><font size="5">A<br>i<br>s<br>l<br>e</font></td>
		<td width="30%" height="500px">
		<table >
		<tr>
		<%
			count=0;
			for(int i=1;i<=seatNum/3+seatNum%3;i++){
				count++;
				String seat ="";
				if(i<10){
					seat = "M0"+i;
				}else{
					seat = "M"+i;
				}
				
				if(bookedSeat.contains(seat)){
					%><td align="center" class="t2">X</td><%
				}else{
					%><td class="t2"><input type="checkbox" name="seat" value="<%=seat%>"><%=seat%></td><%
				}
				
				
				if(count%5==0){
					%></tr><tr><%
				}
			}		
		%>
		</tr>
		</table border="1">
		
		</td>
		<td width="5%" class="t2"><font size="5">A<br>i<br>s<br>l<br>e</font></td>
		<td width="30%" height="500px">
		<table >
		<tr>
		<%
			count=0;
		for(int i=1;i<=seatNum/3+seatNum%3;i++){
			count++;
			String seat ="";
			if(i<10){
				seat = "R0"+i;
			}else{
				seat = "R"+i;
			}
			
			if(bookedSeat.contains(seat)){
				%><td class="t2">X</td><%
			}else{
				%><td class="t2"><input type="checkbox" name="seat" value="<%=seat%>"><%=seat%></td><%
			}
			
			
			if(count%5==0){
				%></tr><tr><%
			}
		}	
		%>
		</tr>
		</table>
		
		</td>
	</tr>
	
	<tr>
		<td colspan="5" class="tt">
			<input type="submit" value="예약하러가기" onclick="return checkData()">
			<input type="reset" value="리셋">
			<input type="button" value="뒤로가기" onclick='history.go(-1)'>
			<input type="button" value="메인페이지" onclick="location.href='main.jsp'">
		</td>
		
		
	</tr>

</table>
</form>




<%@include file="mainBottom.jsp" %>