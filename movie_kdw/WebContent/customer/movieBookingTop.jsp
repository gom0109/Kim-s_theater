<%@page import="myPkg.TheaterBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TheaterDao tdao = TheaterDao.getInstance();
	ArrayList<String> loclist = tdao.getlocation();
%>
    
<font size="6" color="#013C4D" class="cen">-극장을 선택해주세요-</font><br>

<%
	for(int i=0;i<loclist.size();i++){
		%><font size="5" class="cen"><a style="text-decoration: none; color: #D5441C" href="movieBooking.jsp?location=<%=loclist.get(i) %>">[<%=loclist.get(i) %>극장] </a></font> <%
	}
%>
<br>
<br>