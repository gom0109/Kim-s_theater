<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	MemberDao mdao = MemberDao.getInstance();
	String id = mdao.findMember(name,email);
	if(id==null){
		%>
		<script>
			alert("아이디를 찾지 못했습니다.")
			location.href="findId.jsp"
		</script>
		<%
	}else{
		%>
		<script>
			alert("찾으시는 아이디는 <%=id%>입니다")
			location.href="login.jsp"
		</script>
		<%
	}
	
%>

