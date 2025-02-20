<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
		String new_no = "";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(custno+1) from member_02");
			rs.next();
				new_no = rs.getString(1);
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			<h1>홈쇼핑 회원 등록</h1>
			<form action="member_db.jsp" method="get">
				<table>
					<tr><th>회원번호</th><td><input type="text" name="custno" value="<%=new_no%>" readonly></td></tr>
					<tr><th>회원성명</th><td><input type="text" name="custname"></td></tr>
					<tr><th>회원전화</th><td><input type="text" name="phone"></td></tr>
					<tr><th>회원주소</th><td><input type="text" name="address"></td></tr>
					<tr><th>가입일자</th><td><input type="text" name="joindate"></td></tr>
					<tr><th>고객등급</th><td><input type="text" name="grade"></td></tr>
					<tr><th>도시코드</th><td><input type="text" name="city"></td></tr>
					<tr><td colspan=2><input type="submit" value="등 록"> <input type="button" value="조 회"></td></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>