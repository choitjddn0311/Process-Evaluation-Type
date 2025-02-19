<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%
	String sid = request.getParameter("sid");
	String subcode = request.getParameter("subcode");
	String midscore = request.getParameter("midscore");
	String finalscore = request.getParameter("finalscore");
	String attend = request.getParameter("attend");
	String report = request.getParameter("report");
	String etc = request.getParameter("etc");
	String sql = "insert into tbl_score_202210 values ('"+sid+"','"+subcode+"','"+midscore+"','"+finalscore+"','"+attend+"','"+report+"','"+etc+"')";
	
%>
	<%
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