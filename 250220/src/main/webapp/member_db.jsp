<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	String sql = "insert into member_02 values ('"+custno+"','"+custname+"','"+phone+"','"+address+"','"+joindate+"','"+grade+"','"+city+"')";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			out.print(sql);
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<script>
		location.href="list.jsp";
	</script>
<%@ include file="footer.jsp" %>