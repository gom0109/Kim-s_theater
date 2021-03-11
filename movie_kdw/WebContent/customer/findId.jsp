<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="mainTop.jsp" %>
<script type="text/javascript">
	function checkCon() {
		if (document.myform.name.value == "") {
			document.myform.name.focus()
			alert("이름을 입력하세요");
			return false;
		}
		if (document.myform.email.value == "") {
			document.myform.email.focus()
			alert("이메일 주소를 입력하세요");
			return false;
		}

	}
</script>



<form method="post" action="findIdProc.jsp" name="myform">
	<table border="1" class="movieTable2">
		<tr>
			<td colspan="2" class="tt"><a href="findId.jsp" style="color: #D5441C; text-decoration: none;"><font size="5">아이디 찾기</font></a><font size="5"> | </font><a href="findPassword.jsp" style="color: #D5441C; text-decoration: none;"><font size="5">비밀번호 찾기</font></a></td>
		</tr>
		<tr>
			<td class="tt">이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td class="tt">이메일 주소</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td colspan="2" class="tt"><input type="submit" value="확인" onclick="return checkCon()">
				
				
			</td>
		</tr>

	</table>
</form>
<%@include file="mainBottom.jsp" %>