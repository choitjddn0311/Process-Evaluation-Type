<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String sno = request.getParameter("sno");
	String sname = request.getParameter("sname");
	String pname = request.getParameter("pname");
	String sql = "insert into students values ('"+sno+"','"+sname+"','"+pname+"')";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			out.print(sql);
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
<%@ include file="footer.jsp" %>