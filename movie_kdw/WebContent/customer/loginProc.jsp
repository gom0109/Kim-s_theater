<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
loginProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//out.print(id);
	//out.print(password);
	MemberDao mdao = MemberDao.getInstance();
	String tid = mdao.loginCheck(id,password);
	if(tid == null){
		%>
			<script type="text/javascript">
				alert("존재하지않는 아이디 또는 비밀번호입니다.")
				location.href="login.jsp"
			</script>
		<%
	}else{
		session.setAttribute("id", tid);
		if(tid.equals("admin")){
			response.sendRedirect("../admin/adminMain.jsp");
		}else{
			response.sendRedirect("main.jsp");
		}
	}
%>
