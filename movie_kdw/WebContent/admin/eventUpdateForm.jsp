
<%@page import="myPkg.EventBean"%>
<%@page import="myPkg.EventDao"%>
<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
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
	


	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	EventDao edao = EventDao.getInstance();
	EventBean ebean = edao.getUpdateContent(boardNum);


	
%>

<script type="text/javascript">
	function checkData(){
		if(myform.boardTitle.value==""){
			myform.boardTitle.focus()
			alert("제목을 작성해주세요")
			return false;
		}
		
		if(myform.bta.value==""){
			myform.bta.focus()
			alert("내용을 입력해주세요")
			return false;
		}
		
	}

</script> 





<form method="post" name="myform" action="eventUpdateProc.jsp?pageNum=<%=pageNum%>">
<input type="hidden" name="boardNum" value="<%=boardNum%>">

<table width="500" border="1" class="movieTable2">
	
	<tr>
		<td class="tt" colspan="2"><font size="5">이벤트 수정</font></td>
	</tr>
	<tr>
		<td class="tt">제목</td>
		<td ><input type="text" name="boardTitle" maxlength="20" value="<%= ebean.getBoardTitle()%>"></td>
	</tr>
	<tr>
		<td class="tt">내용</td>
		<td><textarea rows="5" cols="50" name="bta" style="resize: none;"><%= ebean.getBta()%></textarea></td>
	</tr>
	<tr>
		<td colspan="2" class="tt">
			<input type="submit" value="글수정" onclick="return checkData()">
			
			<input type="button" value="목록보기" onclick="location.href='eventBoard.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
</form>



<%@include file="adminMainBottom.jsp" %>