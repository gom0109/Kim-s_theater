<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.BookingBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.BookingDao"%>
<%@page import="myPkg.MemberBean"%>
<%@page import="myPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	
	
	function checkData(){
		if($("input[name='oldPassword']").val()==""){
			alert("이전 비밀번호를 입력하세요")
			$("input[name='oldPassword']").focus()
			return false;
		}
			if($("input[name='password']").val()==""){
				alert("비밀번호를 입력하세요")
				$("input[name='password']").focus()
				return false;
			}
			if($("input[name='passwordCheck']").val()==""){
				alert("비밀번호 확인란을 입력하세요")
				$("input[name='passwordCheck']").focus()
				return false;
			}
			
			if($("input[name='passwordCheck']").val() != $("input[name='password']").val()){
				alert("비밀번호란과 비밀번호확인란의 값이 다릅니다");
				$("input[name='passwordCheck']").val("")
				$("input[name='passwordCheck']").focus()
				return false;
			}
			if($("input[name='name']").val()==""){
				alert("이름을 입력하세요")
				$("input[name='name']").focus()
				return false;
			}
			if($("input[name='birth']").val()==""){
				alert("생년월일을 입력하세요")
				$("input[name='birth']").focus()
				return false;
			}
			if($("input[name='email']").val()==""){
				alert("이메일을 입력하세요")
				$("input[name='email']").focus()
				return false;
			}
			var emailVal = $("input[name='email']").val();
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (emailVal.match(regExp) == null) {
				alert("유효하지 않은 이메일 형식입니다.");
			    $("input[name='email']").val("")
			    $("input[name='email']").focus()
			    return false;
			}
			
			if($("input[name='ssn1']").val()==""){
				alert("주민등록번호 앞자리를 입력하세요")
				$("input[name='ssn1']").focus()
				return false;
			}
			if(isNaN($("input[name='ssn1']").val())){
				alert("주민등록번호를 숫자로 입력하세요")
				$("input[name='ssn1']").val("")
				$("input[name='ssn1']").focus()
				return false;
			}
			if($("input[name='ssn2']").val()==""){
				alert("주민등록번호 뒷자리를 입력하세요")
				$("input[name='ssn2']").focus()
				return false;
			}
			if(isNaN($("input[name='ssn2']").val())){
				alert("주민등록번호를 숫자로 입력하세요")
				$("input[name='ssn2']").val("")
				$("input[name='ssn2']").focus()
				return false;
			}
			if($("input[name='oldPassword']").val() != $("input[name='pw']").val()){
				alert("잘못된 이전 비밀번호 입니다.");
				$("input[name='oldPassword']").val("")
				$("input[name='oldPassword']").focus()
				return false;
			}
			
			
		}
	function delcheck(){
		if($("input[name='delpasswod']").val() != $("input[name='oldpw']").val()){
			alert("잘못된 비밀번호 입니다.");
			$("input[name='delpasswod']").val("")
			$("input[name='delpasswod']").focus()
			return false;
		}
		location.href='deleteId.jsp'
	}
	
	
	
</script>
<%@include file="mainTop.jsp" %>
<%@include file="myPageTop.jsp" %>
<%
	
	
	if(request.getParameter("code")!=null){
		int code = Integer.parseInt(request.getParameter("code"));
			if(code==1){
				//out.print(1);
				MemberDao mdao =MemberDao.getInstance();
				MemberBean mbean = 	mdao.selectById(id);
				
				%>
					<form method="post" action="idUpdateProc.jsp">
					<input type="hidden" name="pw" value="<%=mbean.getPassword()%>">
					<table border="1" width="600px" class="mpTable">
						<tr> 
							<td class="tt">아이디</td>
							<td><%=id %></td>
						</tr>
						<tr> 
							<td  class="tt">이전 비밀번호</td>
							<td><input type="password" name="oldPassword" ></td>
						</tr>
						<tr> 
							<td  class="tt">새 비밀번호</td>
							<td><input type="password" name="password" ></td>
						</tr>
						<tr> 
							<td  class="tt">새  비밀번호 확인</td>
							<td><input type="password" name="passwordCheck" ></td>
						</tr>
						<tr>
							<td  class="tt">이름</td>
							<td><%=mbean.getName() %></td>
						</tr>
						<tr>
							<td  class="tt">생년월일</td>
							<td><%=mbean.getBirth() %></td>
						</tr>
						<tr>
							<td  class="tt">email</td>
							<td><input type="text" name="email" value="<%=mbean.getEmail()%>"></td>
						</tr>
						<tr>
							<td  class="tt">>주민등록번호</td>
							<td><input type="text" name="ssn1" value="<%=mbean.getSsn1()%>">-<input type="text" name="ssn2" value="<%=mbean.getSsn2()%>"></td>
						</tr>
						<tr>
							<td colspan="2" align="right"  class="tt"><input type="submit" value="수정" onclick="return checkData()"> </td>
							
						</tr>
					</table>
					</form>
				<%
				
				
				
			}else if(code==2){
				BookingDao bdao = BookingDao.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String today = sdf.format(System.currentTimeMillis());
				MovieDao mdao = MovieDao.getInstance();
				TheaterDao tdao = TheaterDao.getInstance();
				//System.out.println(id);
				ArrayList<BookingBean> blist = bdao.getInfoById(id,today);
				//System.out.println(blist.size());
				%>
				<table border="1" width="600px" class="mpTable">
					<tr>
						<td class="tt">영화 제목</td>
						<td class="tt">상영관</td>
						<td class="tt">예매 날짜</td>
						<td class="tt">시간</td>
						<td class="tt">좌석</td>
						<td class="tt">가격</td>
						<td class="tt">예매 취소</td>
					</tr>
				
					<%
					if(blist.size()!=0){
						for(int i=0;i<blist.size();i++){
						BookingBean bbean = blist.get(i);
						MovieBean mbean = mdao.getMovieByNum(bbean.getMnum());
						TheaterBean tbean = tdao.getAllByNum(Integer.parseInt(mbean.getTheater()));
						%>
						<tr align="center">
						<td class="t2"><%=mbean.getTitle() %></td>
						<td class="t2"><%=tbean.getLocation() %>극장 <%=tbean.getMultiplexnum() %>관</td>
						<td class="t2"><%=bbean.getBookingDate() %></td>
						<td class="t2"><%=bbean.getTime() %></td>
						<td class="t2"><%=bbean.getSeat()%></td>
						<td class="t2"><%=bbean.getPrice() %>원</td>
						<td><a href="../admin/cancleBooking.jsp?bookingnum=<%=bbean.getBookingnum()%>">[예매취소]</a></td>
						</tr>
						
						<%
						}
					}else{
						%>
							<tr><td colspan="7" align="center">예매하신 영화가 없습니다.</td></tr>
						<%
					}
					
					
					
					%>
				
				</table>
				
				
				<%
				
				
				
				
			}else{
				MemberDao mdao =MemberDao.getInstance();
				MemberBean mbean = 	mdao.selectById(id);
				%>
				
				<table border="1" width="600px" class="mpTable">
				<tr>
					<td class="tt">탈퇴하시려면<br> 비밀번호를 입력해 주세요</td>
					<input type="hidden" name="oldpw" value="<%=mbean.getPassword()%>">
					<td align="center"><input type="password" name="delpasswod"></td>
					<td class="tt"><input type="button" value="탈퇴" onclick="return delcheck()"></td>
					</tr>
				</table><%
			}

	}
	


%>




<%@include file="mainBottom.jsp" %>