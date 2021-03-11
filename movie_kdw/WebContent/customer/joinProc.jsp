<%@page import="myPkg.MemberBean"%>
<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
joinProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	int ssn1 = Integer.parseInt(request.getParameter("ssn1"));
	int ssn2 = Integer.parseInt(request.getParameter("ssn2"));

/* 	out.print(id);
	out.print(password);
	out.print(name);
	out.print(birth);
	out.print(email);
	out.print(ssn1);
	out.print(ssn2); */
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mbean = new MemberBean(0, id, password, name, birth, email, ssn1, ssn2);
	int cnt = mdao.joinid(mbean);
	if (cnt>0){
		%>
		<script type="text/javascript">
			alert("회원가입성공")
			location.href="main.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("회원가입실패")
			location.href="customerJoin.jsp";
		</script>
		<%
	}
	
%>
