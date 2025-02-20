<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%
	String sno = request.getParameter("sno");
%>
			<h1>학생 수정</h1>
			<form action="sub2_change.jsp" method="get">
				<table>
					<tr><th>학생번호</th><td>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select s.sno, s.sname, p.pname from students s, part p where s.partno=p.partno and s.sno='"+sno+"'");
			while(rs.next()) {
				out.println("<input type='text' value='"+rs.getString(1)+"' name='sno'>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
					</td></tr>
					<tr><th>학생이름</th><td>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select s.sno, s.sname, p.pname from students s, part p where s.partno=p.partno and s.sno='"+sno+"'");
			while(rs.next()) {
				out.println("<input type='text' value='"+rs.getString(2)+"' name='sname'>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
					</td></tr>
					<tr><th>학과지원</th><td>
					<select name="pname">
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from part where status=1");
			while(rs.next()) {
				out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
					</select>
					</td></tr>
					<tr><th colspan=2><input type="submit" value="수정"> <input type="button" value="조회" onclick="location.href='sub2.jsp'"></th></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>