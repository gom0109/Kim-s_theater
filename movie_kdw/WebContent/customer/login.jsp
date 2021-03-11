<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- login.jsp -->

<%@include file="mainTop.jsp" %>

<script type="text/javascript">
	function checkCon() {
		if (document.myform.id.value == "") {
			document.myform.id.focus()
			alert("아이디를 입력하세요");
			return false;
		}
		if (document.myform.password.value == "") {
			document.myform.password.focus()
			alert("패스워드를 입력하세요");
			return false;
		}

	}
</script>


<form method="post" action="loginProc.jsp" name="myform">
	<table border="1" class="movieTable2">
		<tr>
			<td colspan="2" class="tt"><font size="5">로그인</font></td>
		</tr>
		<tr>
			<td class="tt">아이디</td>
			<td align="left"><input type="text" name="id"></td>
		</tr>
		<tr>
			<td class="tt">패스워드</td>
			<td align="left"><input type="password" name="password"></td>
		</tr>
		<tr >
			<td colspan="2" class="tt"><input type="submit" value="로그인" onclick="return checkCon()">
				<input type="button" value="회원가입" onclick="location.href='customerJoin.jsp'">
				<input type="button" value="아이디찾기" onclick="location.href='findId.jsp'">
				<input type="button" value="비밀번호 찾기" onclick="location.href='findPassword.jsp'">
				
			</td>
		</tr>

	</table>
</form>


<%@include file="mainBottom.jsp" %>