<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String resv_no = request.getParameter("resv_no");
	String cust_no = request.getParameter("cust_no");
	String resv_day = request.getParameter("resv_day");
	String court_no = request.getParameter("court_no");
	String sql = "insert into tbl_resv_202301 values('"+resv_no+"','"+resv_day+"','"+court_no+"','"+cust_no+"')";
	out.print(sql);
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
<%@ include file="footer.jsp" %>
</body>
</html>