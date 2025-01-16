<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script>
	function ck(f){
		if(f.resv_show.value=="") {
			alert("고객번호가 입력되지 않았습니다");
			f.resv_show.focus();
			return false;
		}
	}
</script>
			<h2>코트 예약 조회</h2>
			<form action="show_result.jsp" onsubmit="return ck(this)">
				<table>
					<tr><th>고객번호를<br>입력하세요</th><td><input type="text" name="resv_show" />예)1001</td></tr>
					<tr><td colspan=2><input type="submit" value="코트예약조회" /> 
					<input type="button" value="홈으로" onclick="location.href='index.jsp'" /></td></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>
</body>
</html>