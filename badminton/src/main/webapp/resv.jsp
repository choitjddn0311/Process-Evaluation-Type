<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script>
	function ck(f){
		if(f.cust_no.value=="") {alert("고객번호가 입력되지 않았습니다."); f.cust_no.focus(); return false;}
	}
</script>
			<h2>코트 예약</h2>
			<form action="resv_db.jsp" onsubmit="return ck(this)">
			<table>
				<tr><th>예약번호</th><td style="text-align: left;"><input type="text" name="resv_no" />예)20230001</td></tr>
				<tr><th>고객번호</th><td style="text-align: left;">
				<select name="cust_no" id="">
					<%
						try {
							Class.forName ("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("select * from tbl_cust_202301");
							while(rs.next()) {
								out.println("<option value='"+rs.getString(1)+"'>[" + rs.getString(1)+ ']'+ rs.getString(2) + "</option>");
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</select>예)1001</td></tr>
				<tr><th>예약일자</th><td style="text-align: left;"><input type="text" name="resv_day"/>예)20230101</td></tr>
				<tr><th>코트번호</th><td style="text-align: left;">
				<select name="court_no" id="">
					<%
						try {
							Class.forName ("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("select * from tbl_court_202301");
							while(rs.next()) {
								out.println("<option value='"+rs.getString(1)+"'>" + rs.getString(1)+ "</option>");
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</select>예)C001~C009</td></tr>
				<tr><td colspan=2><input type="submit" value="예약등록" /> <input type="reset" value="다시쓰기" onclick="alert('모든 내용이 초기화 됩니다!')"/></td></tr>
			</table>
			</form>
			
<%@ include file="footer.jsp" %>
</body>
</html>