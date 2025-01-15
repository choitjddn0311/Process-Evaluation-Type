<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>예방접종이력조회</h2>
			<table>
			<tr><th>접종이력번호</th><th>아이디</th><th>성명</th><th>백신코드</th><th>백신종류</th><th>백신권장</th><th>접종일차</th><th>접종회차</th><th>접종결과</th><th>기관이름</th></tr>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select n.vaccinate_no,n.people_id,p.people_name,n.vaccine_code,v.vaccines,v.vaccine_recommendation,n.vaccinate_date,n.vaccinate_round,n.vaccinate_result,i.institutional_name from tbl_vaccination n, tbl_people p,tbl_vaccine v,tbl_institutional i where n.people_id=p.people_id and n.vaccine_code=v.vaccine_code and n.visit_agency=i.visit_agency order by n.vaccinate_no");
			while(rs.next()) {
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4) + "</td>");
				out.println("    <td>" + rs.getString(5) + "</td>");
				out.println("    <td>");
				if(rs.getString(6).equals("1")) out.print("연령권장");
				else out.print("위험군권장");
				out.println("   </td>");
				out.println("    <td>" + rs.getString(7) + "</td>");
				out.println("    <td>" + rs.getString(8) + "회차 </td>");
				out.println("    <td>");
				if(rs.getString(9).equals("N")) out.print("정상");
				else out.print("이상");
				out.println("   </td>");
				out.println("    <td>" + rs.getString(10) + "</td></tr>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
			</table>
<%@ include file="footer.jsp" %>