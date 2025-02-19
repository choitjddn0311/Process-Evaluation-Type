<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>    
<%
	String empno = request.getParameter("empno");
	String sql = "select '"+ empno +"', e.empname, r.resvdate, s.seatno, s.office, s.callno from tbl_emp_202108 e, tbl_seat_202108 s, tbl_resv_202108 r where e.empno = r.empno and s.seatno = r.seatno and e.empno = '" + empno +"'";
%>
	<%
	
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				out.println("<h1>사원번호:" + empno + "님의 좌석예약조회</h1>");
				out.println("<table>");
				out.println("<tr><th>사원번호</th><th>이름</th><th>근무일자</th><th>좌석번호</th><th>좌석위치</th><th>내선번호</th></tr>");
				out.println("<tr><td>" + rs.getString(1) + "</td>");
				out.println("    <td>" + rs.getString(2) + "</td>");
				out.println("    <td>" + rs.getString(3) + "</td>");
				out.println("    <td>" + rs.getString(4) + "</td>");
				out.println("    <td>" + rs.getString(5) + "</td>");
				out.println("    <td>" + rs.getString(6) + "</td></tr></table>");
				out.println("<input type='button' value='돌아가기' class='yes' id='back'>");
			} else {
				out.println("<div class='not'>");
				out.println("<h2>좌석예매 정보가 존재하지 않습니다</h2>");
				out.println("<input type='button' value='돌아가기' id='back'>");
				out.println("</div>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<script>
		const back = document.getElementById("back");
		back.addEventListener('click' , () => {
	    	location.href="seat.jsp";
		})
	</script>
<%@ include file="footer.jsp" %>