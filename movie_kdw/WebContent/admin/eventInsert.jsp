<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="adminMainTop.jsp" %>
<%  
if(!(id.equals("admin"))){
	%>
		<script type="text/javascript">
			alert("관리자 전용 페이지입니다.");
			location.href="../customer/main.jsp"
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
		
		if(myform.bta.value==""){
			alert("내용을 입력해주세요")
			return false;
		}
	}

</script> 
 
<form action="eventInsertProc.jsp" method="post" name="myform">
<table border="1" width="500px" class="movieTable2">
	<tr>
		<td colspan="2" class="tt"><font size="5">이벤트 게시판 글쓰기</font></td>
	</tr>
	<tr>
		<td class="tt" >제목</td>
		<td align="left"><input type="text" name="boardTitle"></td>
	</tr>
	<tr>
		<td class="tt">내용</td>
		<td align="left"><textarea rows="5" cols="60" name="bta" style="resize: none;"></textarea></td>
	</tr>
	
	
	<tr>
		<td colspan="2"class="tt">
		
		<input type="submit" value="작성" onclick="return checkData()">
		<input type="button" value="뒤로가기" onclick="history.go(-1)"></td>
	</tr>


</table>
</form>

<%@include file="adminMainBottom.jsp" %>