
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
	
	
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bbean = bdao.getUpdateContent(boardNum);
	if(!(id.equals(bbean.getWriter()))){
		%>
		 <script type="text/javascript">
				alert("작성자만 수정가능합니다")
				history.go(-1)
			</script>
		<%
	}
	
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




	
<form method="post" name="myform" action="boardUpdateProc.jsp?pageNum=<%=pageNum%>">
<input type="hidden" name="boardNum" value="<%=boardNum%>">
<input type="hidden" name="oldpw" value="<%=bbean.getBoardpw()%>">
<table width="450" border="1" class="movieTable2">
	<tr>
		<td width="100" class="tt" colspan="2"><font size="5">리뷰 수정하기</font></td>
		
	</tr>
	<tr>
		<td width="100" class="tt">작성자</td>
		<td width="350"><input type="text" name="writer" maxlength="10" value="<%=bbean.getWriter() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<td width="100" class="tt">제목</td>
		<td width="350"><input type="text" name="boardTitle" maxlength="20" value="<%= bbean.getBoardTitle()%>"></td>
	</tr>
	<tr>
		<td width="100" class="tt">내용</td>
		<td width="350"><textarea rows="5" cols="30" name="bta" style="resize: none;"><%= bbean.getBta()%></textarea></td>
	</tr>
	<tr>
		<td width="100" class="tt">비밀번호</td>
		<td width="350"><input type="password" name="boardpw" maxlength="10"></td>
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
			<input type="submit" value="글수정" onclick="return checkData()">
			
			<input type="button" value="목록보기" onclick="location.href='board.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
</form>
<%} %>


<%@include file="mainBottom.jsp" %>