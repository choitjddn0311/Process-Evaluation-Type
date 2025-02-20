<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script>
	function ck(f){
		if(f.sno.value==''){
			alert("학생번호가 입력되지 않았습니다");
			f.sno.focus();
			return false;
		} else if(f.sname.value==''){
			alert("학생이름이 입력되지 않았습니다");
			f.sname.focus();
			return false;
		} else {
			alert("등록이 완료 되었습니다!");
		}
	}
</script>
			<h1>학생등록</h1>
			<form action="sub1_db.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>학생번호</th><td><input type="text" name="sno"></td></tr>
					<tr><th>학생이름</th><td><input type="text" name="sname"></td></tr>
					<tr><th>학과지원</th><td>
					<select name="pnew">
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from part");
			while(rs.next()) {
				out.println("<option value='"+rs.getString(1)+"'>" + rs.getString(2) + "</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
					</select>
					</td></tr>
					<tr><td colspan=2><input type="submit" value="등록"> <input type="button" value="조회" onclick="location.href='sub2.jsp'"></td></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>