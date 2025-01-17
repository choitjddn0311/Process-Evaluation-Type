<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>강사매출현황</h2>
			<table>
				<tr><th>강사코드</th><th>강의명</th><th>강사명</th><th>총매출</th></tr>
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("select t.teacher_code,t.class_name,t.teacher_name,sum(c.tuition) from tbl_teacher_202201 t, tbl_class_202201 c where t.teacher_code=c.teacher_code group by t.teacher_code, t.class_name,t.teacher_name");
						while(rs.next()) {
							out.println("<tr><td>" + rs.getString(1) + "</td>");
							out.println("    <td>" + rs.getString(2) + "</td>");
							out.println("    <td>" + rs.getString(3) + "</td>");
							out.println("    <td>￦" + String.format("%,d",rs.getInt(4)) + "</td></tr>");
						}
						stmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
<%@ include file="footer.jsp" %>