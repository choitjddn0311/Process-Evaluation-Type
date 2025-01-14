<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>방문일자별 네일아트(네일)통계</h2>
	<table class="mtable">
	<tr><th>방문일자</th><th>총건수</th><th>총가격</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select f.visitdate,count(f.visitdate), sum(m.price) from tbl_ferformance f join tbl_menu m on f.menucode1=m.menucode and menucode1!='N00' group by f.visitdate order by f.visitdate");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>￦" + String.format("%,d",rs.getInt(3)) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
<%@ include file="footer.jsp" %>