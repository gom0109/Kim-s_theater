<%@page import="myPkg.BoardBean"%>
<%@page import="myPkg.BoardDao"%>
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
	



int boardNum = Integer.parseInt(request.getParameter("boardNum"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));



BoardDao dao = BoardDao.getInstance();
BoardBean bbean = dao.getUpdateContent(boardNum);
if(!(id.equals(bbean.getWriter()))){
	%>
	 <script type="text/javascript">
			alert("작성자만 삭제가능합니다")
			history.go(-1)
		</script>
	<%
}
%>

    <script type="text/javascript">
	function checkData(){
		if(myform.boardpw.value==""){
			myform.boardpw.focus()
			alert("비밀번호를 입력해주세요")
			return false;
		}
		if(myform.boardpw.value!=myform.oldpw.value){
			myform.boardpw.focus()
			alert("잘못된 비밀번호 입니다.")
			return false;
		}
		
	}

</script> 
    

<form action="BoardDeleteProc.jsp?pageNum=<%=pageNum%>" method="post" name="myform">
<input type="hidden" name="boardNum" value="<%=boardNum%>">
<input type="hidden" name="oldpw" value="<%=bbean.getBoardpw()%>">
<table border="1" class="movieTable2">
	
	<tr>
		<td class="tt" colspan="2"><font size="5">리뷰 게시판 작성글 삭제</font></td>  
		
			
			
	</tr>
	<tr>
		<td class="tt">비밀번호</td>  
		<td>
		<input type="password" name="boardpw" size="8" maxlength="12">
		</td>
			
			
	</tr>
	<tr>
		<td colspan="2" class="tt"><input type="submit" value="삭제" onclick="return checkData()">
			<input type="button" value="뒤로가기" onclick="history.go(-1)"></td>
	</tr>


</table>
</form>
<%
}
%>

<%@include file="mainBottom.jsp" %>