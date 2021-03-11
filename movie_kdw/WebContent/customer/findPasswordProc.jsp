<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String email = request.getParameter("email");

	MemberDao mdao = MemberDao.getInstance();
	String password = mdao.findPassword(name,id,email);
	if(password==null){ 
		%>
		<script>
			alert("비밀번호를 찾지 못했습니다.")
			location.href="findPassword.jsp"
		</script>
		<%
	}else{
		%>
		<script>
			alert("찾으시는 비밀번호는 <%=password%>입니다")
			location.href="login.jsp"
		</script>
		<%
	}
	
%>

