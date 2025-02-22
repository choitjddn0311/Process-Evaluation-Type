<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script>
	function ck(f){
		if(f.jumin.value==''){
			alert("주민번호가 입력되지 않았습니다!");
			f.jumin.focus();
			return false;
		} else if(f.name.value==''){
			alert("성명이 입력되지 않았습니다!");
			f.name.focus();
			return false;
		} else if(f.vnumber.value=='투표번호'){
			alert("후보번호가 선택되지 않았습니다");
			f.vnumber.focus();
			return false;
		} else if(f.time.value==''){
			alert("투표시간이 입력되지 않았습니다!");
			f.time.focus();
			return false;
		} else if(f.place.value==''){
			alert("투표장소가 입력되지 않았습니다!");
			f.place.focus();
			return false;
		} else if(!f.check[0].checked && !f.check[1].checked){
			alert("유권자확인이 선택되지 않았습니다!");
			return false;
		} else {
			alert("투표하기 정보가 정상적으로 등록 되었습니다!");
		}
	}
</script>
			<h1>투표하기</h1>
			<form action="sub2_db.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>주민번호</th><td style="text-align:left;"><input type="text" name="jumin"> 예 : 8906153154726</td></tr>
					<tr><th>성명</th><td style="text-align:left;"><input type="text" name="name"></td></tr>
					<tr><th>투표번호</th><td style="text-align:left;">
					<select name="vnumber">
					<option value="투표번호">투표번호</option>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_member_202005");
			while(rs.next()) {
				out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
					</select>
					</td></tr>
					<tr><th>투표시간</th><td style="text-align:left;"><input type="text" name="time"></td></tr>
					<tr><th>투표장소</th><td style="text-align:left;"><input type="text" name="place"></td></tr>
					<tr><th>유권자확인</th><td style="text-align:left;"><input type="radio" name="check" value="Y"> 확인 <input type="radio" name="check" value="N"> 미확인 </td></tr>
					<tr><td colspan=2><input type="submit" value="투표하기"> <input type="reset" value="다시하기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!');"></td></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>