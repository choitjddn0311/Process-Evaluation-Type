<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%
	String resv_show = request.getParameter("resv_show");
	String sql = "select c.cust_no, c.cust_name, r.resv_date,r.court_no  from tbl_cust_202301 c,tbl_resv_202301 r where c.cust_no=r.cust_no and c.cust_no='"+resv_show+"'";
 %>
	<table>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
					out.println("<h2>고객번호:"+resv_show+"님의 코트예약 조회</h2>");
					out.println("<tr><th>고객번호</th><th>이름</th><th>코트사용일자</th><th>코트번호</th></tr>");
					out.println("<tr><td>" + rs.getString(1) + "</td>");
					out.println("    <td>" + rs.getString(2) + "</td>");
					out.println("    <td>" + rs.getString(3).substring(0,4) + '년' + rs.getString(3).substring(4,6) + '월' + rs.getString(3).substring(6,8) + '일' +"</td>");
					out.println("    <td>" + rs.getString(4) + "</td></tr>");
					out.println("<tr><td colspan=4><input type='button' value='돌아가기' onclick=\"location.href='show.jsp'\" /></td>");
			} else {
				out.println("<div class='not'>");
				out.println("<h2>코트예약 정보가 존재하지 않습니다</h2>");
				out.println("<input type='button' value='돌아가기' onclick=\"location.href='show.jsp'\" />");
				out.println("</div>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
<%@ include file="footer.jsp" %>
</body>
</html>