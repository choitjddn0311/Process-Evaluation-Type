<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %> 
			<h1>좌석예약조회</h1>
			<script>
			function ck(f){
				if(f.empno.value==''){
					alert("사원번호가 입력되지 않았습니다");
					f.empno.focus();
					return false;
				}
			}
			</script>
			<form action="seat_show.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>사원번호를 입력 하시오.</th><td><input type="text" name="empno"></td></tr>
					<tr><td colspan=2><input type="submit" value="좌석예약조회"> <input type="button" value="홈으로" onclick='location.href="index.jsp";'></td></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>