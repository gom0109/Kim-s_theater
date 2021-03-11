<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.BookingBean"%>
<%@page import="myPkg.MemberDao"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminMainTop.jsp" %>
<%@include file="bookingListTop.jsp" %> 
<%
BookingDao bdao = BookingDao.getInstance();
MovieDao mdao = MovieDao.getInstance();
TheaterDao tdao = TheaterDao.getInstance();
String memid = request.getParameter("memid");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String today = sdf.format(System.currentTimeMillis());

if(memid!=null){
	ArrayList<BookingBean> blist = bdao.getInfoById(memid,today);
	%>
	<table border="1" width="600px" class="mpTable">
		<tr>
			<td class="tt">영화 제목</td>
			<td class="tt">상영관</td>
			<td class="tt">예매 날짜</td>
			<td class="tt">시간</td>
			<td class="tt">좌석</td>
			<td class="tt">가격</td>
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
			<td><a href="cancleBooking.jsp?bookingnum=<%=bbean.getBookingnum()%>">예매취소</a></td>
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