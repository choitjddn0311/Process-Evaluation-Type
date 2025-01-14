<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>네일실적조회</h2>
	<table>
	<tr><th>번호</th><th>고객아이디</th><th>성명</th><th>주소</th><th>고객등급</th><th>네일</th><th>패디</th><th>기타</th><th>방문일자</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_customer c, tbl_ferformance f, tbl_menu m1, tbl_menu m2, tbl_menu m3 where c.customerid=f.customerid and f.menucode1=m1.menucode and f.menucode2=m2.menucode and f.menucode3=m3.menucode order by f.visitdate");
			int i =1;
			while(rs.next()) {
				out.println("    <td>" + i + "</td>");
				out.println("    <td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(5) + "</td>");
				out.println("    <td>");
				if(rs.getString(9).equals("V")) out.print("우수고객");
				else if(rs.getString(9).equals("G")) out.print("일반고객");
				else out.print("학생고객");
				out.println("</td>");
				out.println("    <td>" + rs.getString(15) + "</td>");
				out.println("    <td>" + rs.getString(19) + "</td>");
				out.println("    <td>" + rs.getString(23) + "</td>");
				out.println("    <td>" + rs.getString(13) + "</td></tr>");
				i++;
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
<%@ include file="footer.jsp" %>