<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String sno = request.getParameter("sno");
	String sname = request.getParameter("sname");
	String pnew = request.getParameter("pnew");
	String sql = "insert into students values ('"+sno+"','"+sname+"','"+pnew+"')";
	
	
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<script>
		location.href="index.jsp";
	</script>
<%@ include file="footer.jsp" %>