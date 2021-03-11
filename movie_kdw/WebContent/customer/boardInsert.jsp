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
}  


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
 
<form action="boardInsertProc.jsp" method="post" name="myform">
<table border="1" class="movieTable2">
	<tr>
		<td colspan="2" class="tt"><font size="5">영화 리뷰 게시판 글쓰기</font></td>
	</tr>
	<tr>
		<td class="tt">작성자</td>
		<td><input type="text" name="writer" value="<%=id %>" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="tt" >제목</td>
		<td><input type="text" name="boardTitle"></td>
	</tr>
	<tr>
		<td class="tt">비밀번호</td>
		<td><input type="password" name="boardpw"></td>
	</tr>
	<tr>
		<td class="tt">내용</td>
		<td><textarea rows="5" cols="30" name="bta" style="resize: none;"></textarea></td>
	</tr>
	<tr>
		<td class="tt">별점</td>
		<td>
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
		<td colspan="2"class="tt">
		
		<input type="submit" value="작성" onclick="return checkData()">
		<input type="button" value="뒤로가기" onclick="history.go(-1)"></td>
	</tr>


</table>
</form>

<%@include file="mainBottom.jsp" %>