<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>주식 매수 내역 조회</h1>
			<table>
			<tr>
				<th>매수일자</th>
				<th>종목코드</th>
				<th>종목명</th>
				<th>매수수량</th>
				<th>매수가격</th>
				<th>부서명</th>
			</tr>
	<%
	String sql = "select b.buy_date, b.stock_item_code, s.stock_item_name, b.buy_number, b.buy_price, d.dept_name from tbl_buy_stock b, tbl_stock_item s,  tbl_dept d where b.stock_item_code = s.stock_item_code and b.dept_code = d.dept_code";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1).substring(0,4) + "년" + rs.getString(1).substring(4,6) + "월" + rs.getString(1).substring(6,8) + "일" + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + String.format("%,d", rs.getInt(4)) + "</td>");
				out.println("    <td>￦" + String.format("%,d", rs.getInt(5)) + "</td>");
				out.println("    <td>" + rs.getString(6) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			</table>
<%@ include file="footer.jsp" %>