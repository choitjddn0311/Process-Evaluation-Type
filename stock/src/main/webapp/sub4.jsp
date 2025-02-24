<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>부서별 주식매수 통계</h1>
			<table>
				<tr>
					<th>부서코드</th>
					<th>부서명</th>
					<th>총매수주식수</th>
					<th>총매수주식금액</th>
				</tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select d.dept_code, d.dept_name, sum(b.buy_number), sum(b.buy_price * b.buy_number) from tbl_dept d, tbl_buy_stock b where d.dept_code = b.dept_code group by d.dept_code, d.dept_name order by d.dept_code");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + String.format("%,d",rs.getInt(3)) + "</td>");
				out.println("    <td>￦" + String.format("%,d",rs.getInt(4)) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>