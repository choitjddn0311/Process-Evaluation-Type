<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>회원정보조회</h1>
			<table>
			<tr>
				<th>수강월</th>
				<th>회원번호</th>
				<th>회원명</th>
				<th>강의명</th>
				<th>강의장소</th>
				<th>수강료</th>
				<th>등급</th>
				
			</tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select c.regist_month, c.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade from tbl_teacher_202201 t, tbl_member_202201 m, tbl_class_202201 c where m.c_no = c.c_no and t.teacher_code = c.teacher_code");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1).substring(0,4) + "년" + rs.getString(1).substring(4,6) + "월" + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4) + "</td>");
				out.println("    <td>" + rs.getString(5) + "</td>");
				out.println("    <td>￦" + String.format("%,d", rs.getInt(6)) + "</td>");
				out.println("    <td>" + rs.getString(7) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>