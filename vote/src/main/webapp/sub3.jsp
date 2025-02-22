<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>투표검수조회</h1>
			<table>
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
	<%
	int age;
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select v_name, v_jumin, m_no, v_time, v_confirm from tbl_vote_202005 where v_area = '제1투표장'");
			while(rs.next()) {
				age = Integer.parseInt(rs.getString(2).substring(0,2));
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>19" + rs.getString(2).substring(0,2) + "년" + rs.getString(2).substring(2,4) + "월" + rs.getString(2).substring(4,6) + "일생" + "</td>");
				out.println("    <td>만 " + (125 - age) + "세</td>"); 
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4).substring(0,2) + ":" + rs.getString(4).substring(2,4) + "</td>");
				out.println("    <td>");
				if(rs.getString(5).equals("Y")) out.println("확인");
				else out.println("미확인");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>				
			</table>
<%@ include file="footer.jsp" %>