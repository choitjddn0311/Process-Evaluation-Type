<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>사용일수집계</h2>
			<table><tr><th>고객번호</th><th>이름</th><th>사용일수</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select c.cust_no, c.cust_name, count(*) from tbl_cust_202301 c,tbl_resv_202301 r where c.cust_no=r.cust_no group by c.cust_no, c.cust_name order by c.cust_no");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
			</table>
<%@ include file="footer.jsp" %>
</body>
</html>