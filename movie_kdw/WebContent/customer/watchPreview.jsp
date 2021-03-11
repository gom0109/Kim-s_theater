<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String theater = request.getParameter("theater");
	MovieDao mdao = MovieDao.getInstance();
	String link = mdao.getlink(title,theater);
	
	
%>
<%@include file="mainTop.jsp" %>
<div align="center">
<iframe width="1000" height="562" src="<%=link %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
<%@include file="mainBottom.jsp" %>