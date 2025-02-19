<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script>
	function ck(f){
		if(f.sid.value==''){
			alert('학번이 입력되지 않았습니다!');
			f.sid.focus();
			return false;
		} else if(f.midscore.value==''){
			alert('중간고사는 숫자가 아니거나 입력하지 않았습니다!');
			f.midscore.focus();
			return false;
		} else if(f.finalscore.value==''){
			alert('기말고사는 숫자가 아니거나 입력하지 않았습니다!');
			f.finalscore.focus();
			return false;
		} else if(f.attend.value==''){
			alert('출석은 숫자가 아니거나 입력하지 않았습니다!');
			f.attend.focus();
			return false;
		} else if(f.report.value==''){
			alert('레포트는 숫자가 아니거나 입력하지 않았습니다!');
			f.report.focus();
			return false;
		} else if(f.etc.value==''){
			alert('기타는 숫자가 아니거나 입력하지 않았습니다!');
			f.etc.focus();
			return false;
		} else {
			alert('성적정보가 정상적으로 등록되었습니다!');
		}
		}
</script>
			<h1>성적입력</h1>
			<form action="grade_db.jsp" onsubmit="return ck(this)">
				<table>
					<tr><th>학번</th><td><input type="text" name="sid"></td></tr>
					<tr><th>교과코드</th>
						<td>
							<select name="subcode">
		<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_subject_202210");
			while(rs.next()) {
				out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(1) + "-" + rs.getString(2) + "</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
							</select>
						</td>
					</tr>
					<tr><th>중간</th><td><input type="text" name="midscore"></td></tr>
					<tr><th>기말</th><td><input type="text" name="finalscore"></td></tr>
					<tr><th>출석</th><td><input type="text" name="attend"></td></tr>
					<tr><th>레포트</th><td><input type="text" name="report"></td></tr>
					<tr><th>기타</th><td><input type="text" name="etc"></td></tr>
					<tr><td colspan=2><input type="submit" value="등록"> <input type="reset" value="취소"></td></tr>
				</table>
			</form>

<%@ include file="footer.jsp" %>