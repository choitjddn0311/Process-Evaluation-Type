<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %> 
			<h1>부서별근무일수집계</h1>
			<table>
			<tr>
				<th>사원번호</th>
				<th>이름</th>
				<th>부서명</th>
				<th>근무일수</th>
			</tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select e.empno, e.empname, e.deptcode, count(e.empno) from tbl_emp_202108 e, tbl_resv_202108 r where e.empno = r.empno group by e.empno, e.empname, e.deptcode order by e.deptcode");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>");
				if(rs.getString(3).equals("10")) out.print("영업팀");
				else if(rs.getString(3).equals("20")) out.print("총무팀");
				else out.print("구매팀");
				out.println("    <td>" + rs.getString(4) + "</td>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>