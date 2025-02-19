<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>    
	<%
		String resvno = request.getParameter("resvno");
		String empno = request.getParameter("empno");
		String wdate = request.getParameter("wdate");
		String seatno = request.getParameter("seatno");
	
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("insert into tbl_resv_202108 values('"+resvno+"','"+empno+"','"+wdate+"','"+seatno+"')");
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<script>location.href="index.jsp"</script>
<%@ include file="footer.jsp" %>