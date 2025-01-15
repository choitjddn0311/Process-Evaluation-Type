<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>예방접종통계</h2>
			<table>
			<tr><th>백신코드</th><th>대상감염병</th><th>백신종류</th><th>정상접종횟수</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select v.vaccine_code, v.infectious_disease, v.vaccines, count(n.vaccine_code) from tbl_vaccine v, tbl_vaccination n where v.vaccine_code=n.vaccine_code group by v.vaccine_code, v.infectious_disease, v.vaccines order by v.vaccine_code");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
			</table>
<%@ include file="footer.jsp" %>