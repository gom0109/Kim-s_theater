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
		
		/* a = myform.title.value
		b = myform.oldtitle.value
		if(b.includes(a)&&){
			alert("이미 등록된 영화입니다.");
			return false;
		} */
			
			
			
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
		
		if($("input[name='openDate']").val()==""){
			alert("개봉일을 입력하세요")
			
			return false;
		}
		if($("input[name='closeDate']").val()==""){
			alert("개봉일을 입력하세요")
			
			return false;
		}
		if($("input[name='runtime']").val()==""){
			alert("상영시간을 입력하세요")
			$("input[name='runtime']").focus();
			return false;
		}
	
		
		 
		 


	
		
		
	}

</script>
    <%
    	TheaterDao tdao = TheaterDao.getInstance();
   	 	ArrayList<TheaterBean> list = tdao.getAllTheater();
   		 String imgPath=request.getContextPath()+"/images";
   		 	
   	 	
   	
   	 	String title = "";
   		MovieDao mdao= MovieDao.getInstance();
    	ArrayList<MovieBean> mlist = mdao.getAllMovie();
    	for(int i=0;i<mlist.size();i++){
    		MovieBean mbean = mlist.get(i);
    		title = title + mbean.getTitle()+ " ";
    		
    	}
    	int num =Integer.parseInt(request.getParameter("num"));
    	MovieBean mbean = mdao.getMovieByNum(num);
    	
    	SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd");
    	String today = sdf.format(System.currentTimeMillis());
   	
    %>
<%@include file="adminMainTop.jsp" %>
<form method="post" action="updateMovieProc.jsp" name="myform" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%= mbean.getMovienum()%>">
<table border="1" width="700px" class="movieTable2">
	<tr>
		<th colspan="2" class="tt"><font size="5">영화 수정</font></th>
	</tr>
	<tr>
		<td class="tt">개봉관 선택</td>
	
	<td class="t2">
	<%if(list.size()!=0){
		for(int i=0;i<list.size();i++){
			TheaterBean tbean = list.get(i);
			if(tbean.getNum()==Integer.parseInt(mbean.getTheater())){
				%>
				<input type="radio" name="theater" value="<%=tbean.getNum()%>" checked="checked"><%=tbean.getLocation() %><%=tbean.getMultiplexnum() %>관
				<%
			}
			else{
				%>
				<input type="radio" name="theater" value="<%=tbean.getNum()%>"><%=tbean.getLocation() %><%=tbean.getMultiplexnum() %>관
				<%
			}
			
		}
	}else{
		%>등록된 상영관이 없습니다.<%
	}
		
			
	%>
	</td>
	</tr>
	<tr>
		<td class="tt">영화 제목</td>
		<td ><input type="text" name="title" value="<%= mbean.getTitle()%>"></td>
	</tr>
	<tr>
		<td class="tt">감독</td>
		<td><input type="text" name="director" value="<%= mbean.getDirector()%>"></td>
	</tr>
	<tr>
		<td class="tt">출연</td>
		<td><input type="text" name="actor" value="<%= mbean.getActor()%>"></td>
	</tr>
	<tr>
		<td class="tt">포스터</td>
		<td class="t2">
		<img src="<%= imgPath%>/<%=mbean.getPoster() %>" width="100px" height="150px">
		<input type="file" name="newPoster"></td>
		<input type="hidden" name="poster" value="<%=mbean.getPoster() %>" >
	</tr>
	<tr>
		<td class="tt">개봉일</td>
		<td><input type="date" name="openDate" value="<%= mbean.getOpenDate()%>"></td>
	</tr>
	<tr>
		<td class="tt">상영 종료일</td>
		<td><input type="date" name="closeDate" value="<%= mbean.getCloseDate()%>"min="<%=today%>"></td>
	</tr>
	
	<tr>
		<td class="tt">상영시간</td>
		<td class="t2">
			<input type="text" name="runtime" value="<%= mbean.getRuntime()%>">분
		</td>
	</tr>
	
	
	
	
	
		
		
		
	<tr>
	<td colspan="2"  class="tt">
		<input type="submit" value="수정" onclick="return checkData()">
		<input type="reset" value="리셋" >
	</td>
		
	</tr>
	
	</table>
	</form>
<%@include file="adminMainBottom.jsp" %>