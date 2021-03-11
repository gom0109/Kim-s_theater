<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	int ssn1 = Integer.parseInt(request.getParameter("ssn1"));
	int ssn2 = Integer.parseInt(request.getParameter("ssn2"));
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.updateid(id,password,email,ssn1,ssn2);
	if(cnt >0 ){
		%>
		<script type="text/javascript">
			alert("수정성공");
			location.href="main.jsp"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("수정실패");
			location.href="myPage.jsp?code=1"
		</script>
		<%
	}
%>