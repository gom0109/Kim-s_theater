<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="myPkg.BookingBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminMain.jsp<br> -->
<%@include file="adminMainTop.jsp" %>
<%
BookingDao bdao = BookingDao.getInstance();
MovieDao mdao = MovieDao.getInstance();
TheaterDao tdao = TheaterDao.getInstance();

ArrayList<BookingBean> blist = bdao.getAllBooking();
if(blist.size()!=0){
	%>
	<table border="1" width="900px" class="movieTable">
		<tr>
			<td colspan="9" class="tt"><font size="5">전체 예약 현황</font></td>
			
		</tr>
		<tr>
			<td class="tt">영화 제목</td>
			<td class="tt">상영관</td>
			<td class="tt">상영일</td>
			<td class="tt">상영 시간</td>
			<td class="tt">좌석</td>
			<td class="tt">가격</td>
			<td class="tt">예약자 아이디</td>
			<td class="tt">예매 시간</td>
			<td class="tt">예매 취소</td>
		</tr>
	
		<%
		if(blist.size()!=0){
			for(int i=0;i<blist.size();i++){
			BookingBean bbean = blist.get(i);
			MovieBean mbean = mdao.getMovieByNum(bbean.getMnum());
			TheaterBean tbean = tdao.getAllByNum(Integer.parseInt(mbean.getTheater()));
			%>
			<tr>
			<td class="t2"><%=mbean.getTitle() %></td>
			<td class="t2"><%=tbean.getLocation() %>극장 <%=tbean.getMultiplexnum() %>관</td>
			<td class="t2"><%=bbean.getBookingDate() %></td>
			<td class="t2"><%=bbean.getTime() %></td>
			<td class="t2"><%=bbean.getSeat()%></td>
			<td class="t2"><%=bbean.getPrice() %>원</td>
			<td class="t2"><%=bbean.getId() %></td>
			<td class="t2"><%=bbean.getPaytime() %></td>
			<td class="t2"><a href="cancleBooking.jsp?bookingnum=<%=bbean.getBookingnum()%>">예매취소</a></td>
			</tr>
			
			<%
			}
		}else{
			%>
				<tr><td colspan="7" align="center">예매하신 영화가 없습니다.</td></tr>
			<%
		}
		
		
		
		%>
	
	</table>
	
	
	<%
	
	
}


%>

	



<%@include file="adminMainBottom.jsp" %>