<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>학생 조회</h1>
			<table>
				<tr><th>학번</th><th>학생이름</th><th>과목번호</th><th>과목이름</th><th>수정</th></tr>
<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select s.sno, s.sname, s.partno, p.pname from students s, part p where s.partno=p.partno");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4) + "</td>");
				out.println("    <td><a href='sub2_edit.jsp?sno="+rs.getString(1)+"'>수정</a></td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>