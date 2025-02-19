<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>과목별 성적조회</h1>
			<form action="subject_grade.jsp">
				<table>
					<tr><th>과목코드</th><td><input type="text" name="subcode"></td><td><input type="submit" value="조회"></td></tr>
				</table>
			</form>
			
			<table style="margin-top: 20px">
				<tr><th>학번</th><th>성명</th><th>학과</th><th>과목</th><th>중간</th><th>기말</th><th>출석</th><th>레포트</th><th>기타</th><th>총점</th><th>학점</th></tr>
	<%
	String subcode = request.getParameter("subcode");
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select s.stuid, s.sname, s.dept_name, j.subname, e.midscore, e.finalscore, e.attend, e.report, e.etc, TO_CHAR((e.midscore + e.finalscore + e.attend + e.report + e.etc)/5,999), TO_NUMBER((e.midscore * 0.3 + e.finalscore * 0.3 + e.attend * 0.2 + e.report * 0.1 + e.etc * 0.1), '999.99') from tbl_student_202210 s, tbl_subject_202210 j, tbl_score_202210 e where s.stuid=e.sid and e.subcode = j.subcode and j.subcode = '"+subcode+"'");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4) + "</td>");
				out.println("    <td>" + rs.getString(5) + "</td>");
				out.println("    <td>" + rs.getString(6) + "</td>");
				out.println("    <td>" + rs.getString(7) + "</td>");
				out.println("    <td>" + rs.getString(8) + "</td>");
				out.println("    <td>" + rs.getString(9) + "</td>");
				out.println("    <td>" + rs.getString(10) + "</td>");
				out.println("    <td>");
				if(rs.getInt(10) >= 95) {
					out.print("A+");
				} else if(rs.getInt(10) >= 90) {
					out.print("A");
				} else if(rs.getInt(10) >= 85) {
					out.print("B+");
				} else if(rs.getInt(10) >= 80) {
					out.print("B");
				} else if(rs.getInt(10) >= 75) {
					out.print("C+");
				} else if(rs.getInt(10) >= 70) {
					out.print("C");
				} else if(rs.getInt(10) >= 65) {
					out.print("D+");
				} else if(rs.getInt(10) >= 60) {
					out.print("D");
				} else {
					out.print("F");
				}
				out.println("</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>