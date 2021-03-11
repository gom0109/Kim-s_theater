<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateTheaterProc.jsp

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String location = request.getParameter("location");
	int multiplexnum = Integer.parseInt(request.getParameter("multiplexnum"));
	int seatnum = Integer.parseInt(request.getParameter("seatnum"));
	
	/* out.print(num +"<br>");
	out.print(location +"<br>");
	out.print(multiplexnum +"<br>");
	out.print(seatnum +"<br>");
	 */
	
	 TheaterDao tdao = TheaterDao.getInstance();
	 TheaterBean tbean = new TheaterBean(num,location,multiplexnum,seatnum);
	 
	
	 
	 
	 
	 int cnt = tdao.updateTheater(tbean);
	 if(cnt>0){
			response.sendRedirect("manageTheater.jsp");
			
		}else{
			%>
			<script type="text/javascript">
				alert("삽입실패");
				location.href="updateTheater.jsp?num=<%=num%>"
			</script>
			<%
			
		}
	 
%>