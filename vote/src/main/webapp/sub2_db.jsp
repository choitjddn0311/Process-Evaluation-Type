<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String jumin = request.getParameter("jumin");
	String name = request.getParameter("name");
	String vnumber = request.getParameter("vnumber");
	String time = request.getParameter("time");
	String place = request.getParameter("place");
	String check = request.getParameter("check");
	String sql = "insert into tbl_vote_202005 values ('"+jumin+"','"+name+"','"+vnumber+"','"+time+"','"+place+"','"+check+"')";
	
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
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