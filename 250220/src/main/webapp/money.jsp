<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>회원매출 조회</h1>
	<table>
	<tr><th>회원번호</th><th>회원성명</th><th>매출횟수</th><th>매출수량</th><th>매출액</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select m.custno, m.custname, count(n.custno), sum(n.amount), sum(n.price) from member_02 m left join money_02 n on m.custno = n.custno group by m.custno,m.custname order by m.custno");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getInt(3) + "</td>");
				out.println("    <td>" + rs.getInt(4) + "</td>");
				out.println("    <td>" + rs.getInt(5) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	</table>
<%@ include file="footer.jsp" %>