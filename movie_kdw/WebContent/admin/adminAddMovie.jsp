<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="myPkg.TheaterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		

	})
	function checkData(){
		if(!($("input[name='theater']").is(":checked"))){
			alert("개봉관을 선택하세요")
			
			return false;
		}
		
		if($("input[name='title']").val()==""){
			alert("영화제목을 입력하세요")
			$("input[name='title']").focus();
			return false;
		}
		
		
			
			
		if($("input[name='director']").val()==""){
			alert("감독을 입력하세요")
			$("input[name='director']").focus();
			return false;
		}
		if($("input[name='actor']").val()==""){
			alert("출연을 입력하세요")
			$("input[name='actor']").focus();
			return false;
		}
		if($("input[name='poster']").val()==""){
			alert("포스터를 첨부하세요")
			
			return false;
		}
		if($("input[name='openDate']").val()==""){
			alert("개봉일을 입력하세요")
			
			return false;
		}
		if($("input[name='runtime']").val()==""){
			alert("상영시간을 입력하세요")
			$("input[name='runtime']").focus();
			return false;
		}
	
		if($("input[name='link']").val()==""){
			alert("예고편 링크를 입력하세요")
			$("input[name='link']").focus();
			return false;
		}
		
		 
		 


	
		
		
	}

</script>
    <%
    	TheaterDao tdao = TheaterDao.getInstance();
   	 	ArrayList<TheaterBean> list = tdao.getAllTheater();
   	
   	 	String title = "";
   		MovieDao mdao= MovieDao.getInstance();
    	ArrayList<MovieBean> mlist = mdao.getAllMovie();
    	for(int i=0;i<mlist.size();i++){
    		MovieBean mbean = mlist.get(i);
    		title = title + mbean.getTitle()+ " ";
    		
    	}
    	SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd");
    	String today = sdf.format(System.currentTimeMillis());
    	
   	
    %>
<%@include file="adminMainTop.jsp" %>
<form method="post" action="addMovieProc.jsp" name="myform" enctype="multipart/form-data">
<input type="hidden" name="oldtitle" value="<%=title%>">
<table border="1" width="700px" class="movieTable2" >
	<tr>
		<th colspan="2" class="tt"><font size="5">영화 추가</font></th>
	</tr>
	<tr>
		<td class="tt">개봉관 선택</td>
	
	<td class="t2">
	<%if(list.size()!=0){
		for(int i=0;i<list.size();i++){
			TheaterBean tbean = list.get(i);
			%>
				<input type="radio" name="theater" value="<%=tbean.getNum()%>"><%=tbean.getLocation() %>극장 <%=tbean.getMultiplexnum() %>관
			<%
		}
	}else{
		%>등록된 상영관이 없습니다.<%
	}
		
			
	%>
	</td>
	</tr>
	<tr>
		<td class="tt">영화 제목</td>
		<td class="t2" ><input type="text" name="title"></td>
	</tr>
	<tr>
		<td class="tt">감독</td>
		<td><input type="text" name="director"></td>
	</tr>
	<tr>
		<td class="tt">출연</td>
		<td><input type="text" name="actor"></td>
	</tr>
	<tr>
		<td class="tt">포스터</td>
		<td class="t2"><input type="file" name="poster"></td>
	</tr>
	<tr>
		<td class="tt">개봉일</td>
		<td><input type="date" name="openDate" min="<%=today%>"></td>
	</tr>
	<tr>
		<td class="tt">상영 종료일</td>
		<td><input type="date" name="closeDate" min="<%=today%>"></td>
	</tr>
	
	<tr>
		<td class="tt">상영시간</td>
		<td class="t2">
			<input type="number" name="runtime">분
		</td>
	</tr>
	<tr>
		<td class="tt">예고편 링크</td>
		<td>
			<input type="text" name="link">
		</td>
	</tr>
	
	
	
	
	
		
		
		
	<tr>
	<td colspan="2" class="tt">
		<input type="submit" value="추가" onclick="return checkData()">
		<input type="reset" value="리셋" >
	</td>
		
	</tr>
	
	</table>
	</form>
<%@include file="adminMainBottom.jsp" %>