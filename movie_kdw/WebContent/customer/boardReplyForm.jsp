<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="mainTop.jsp" %>
<%  
if(id==null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="login.jsp"
		</script>
	<%
}else{

int ref =Integer.parseInt(request.getParameter("ref"));
int re_step = Integer.parseInt(request.getParameter("re_step"));
int re_level = Integer.parseInt(request.getParameter("re_level"));


%>  
    
<script type="text/javascript">
	function checkData(){
		if(myform.boardTitle.value==""){
			alert("제목을 작성해주세요")
			return false;
		}
		if(myform.boardpw.value==""){
			alert("비밀번호를 입력해주세요")
			return false;
		}
		if(myform.bta.value==""){
			alert("내용을 입력해주세요")
			return false;
		}
	}

</script> 
 
<form action="boardReplyProc.jsp" method="post" name="myform">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">
<table border="1" class="movieTable2">
	<tr>
		<td colspan="2" class="tt"><font size="5">답글쓰기</font></td>
	</tr>
	<tr>
		<td class="tt">작성자</td>
		<td align="left"><input type="text" name="writer" value="<%=id %>" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="tt" >제목</td>
		<td align="left"><input type="text" name="boardTitle"></td>
	</tr>
	<tr>
		<td class="tt">비밀번호</td>
		<td align="left"><input type="password" name="boardpw"></td>
	</tr>
	<tr>
		<td class="tt">내용</td>
		<td align="left"><textarea rows="5" cols="30" name="bta" style="resize: none;"></textarea></td>
	</tr>
	<tr>
		<td class="tt">별점</td>
		<td align="left">
		<select name="starPoint">
			<option value="5">★★★★★
			<option value="4">★★★★
			<option value="3">★★★
			<option value="2">★★
			<option value="1">★
		</select>
		
		</td>
	</tr>
	<tr>
		<td colspan="2" class="tt">
		<input type="submit" value="작성" onclick="return checkData()">
		<input type="button" value="뒤로가기" onclick="history.go(-1)">
		</td>
	</tr>
	


</table>
</form>
<%
}
%>
<%@include file="mainBottom.jsp" %>