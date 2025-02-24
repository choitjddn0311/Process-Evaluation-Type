<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String buy_date = request.getParameter("buy_date");
	String stock_item_code = request.getParameter("stock_item_code");
	String buy_number = request.getParameter("buy_number");
	String buy_price = request.getParameter("buy_price");
	String dept_code = request.getParameter("dept_code");
	String sql = "insert into tbl_buy_stock values ('"+buy_date+"','"+stock_item_code+"','"+buy_number+"','"+buy_price+"','"+dept_code+"')";
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
		location.href="sub3.jsp"
	</script>
<%@ include file="footer.jsp" %>