<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>후보조회</h1>
			<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select m.m_no, m.m_name, m.p_code, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3 from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>");
				if(rs.getString(4).equals("1")) out.println("고졸");
				else if(rs.getString(4).equals("2")) out.println("학사");
				else if(rs.getString(4).equals("3")) out.println("석사");
				else out.print("박사");
				out.println("   </td>");
				out.println("    <td>" + rs.getString(5).substring(0,6) + "-" + rs.getString(5).substring(6,13) + "</td>");
				out.println("    <td>" + rs.getString(6) + "</td>");
				out.println("    <td>" + rs.getString(7) + "-" + rs.getString(8) + "-" + rs.getString(9) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>