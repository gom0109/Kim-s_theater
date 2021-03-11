<%@page import="myPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mbean = mdao.selectById(id);
	if(mbean == null){
		out.print("YES");
	}else{
		out.print("NO");
	}
%>