<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>성적현황</h1>
			<table>
			<tr><th>학번</th><th>성명</th><th>교과목</th><th>교과목코드</th><th>담당교수</th><th>중간</th><th>기말</th><th>출석</th><th>레포트</th><th>기타</th><th>평균</th><th>총점</th><th>학점</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select s.stuid, s.sname, j.subname, j.subcode, j.proname, e.midscore, e.finalscore, e.attend, e.report, e.etc, TO_CHAR((e.midscore + e.finalscore + e.attend + e.report + e.etc)/5,999), TO_NUMBER((e.midscore * 0.3 + e.finalscore * 0.3 + e.attend * 0.2 + e.report * 0.1 + e.etc * 0.1), '999.99') from tbl_student_202210 s, tbl_subject_202210 j, tbl_score_202210 e where s.stuid=e.sid and e.subcode = j.subcode");
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
				out.println("    <td>" + rs.getString(11) + "</td>");
				out.println("    <td>" + rs.getString(12) + "</td>");
				out.println("    <td>");
				if(rs.getInt(12) >= 95) {
					out.print("A+");
				} else if(rs.getInt(12) >= 90) {
					out.print("A");
				} else if(rs.getInt(12) >= 85) {
					out.print("B+");
				} else if(rs.getInt(12) >= 80) {
					out.print("B");
				} else if(rs.getInt(12) >= 75) {
					out.print("C+");
				} else if(rs.getInt(12) >= 70) {
					out.print("C");
				} else if(rs.getInt(12) >= 65) {
					out.print("D+");
				} else if(rs.getInt(12) >= 60) {
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