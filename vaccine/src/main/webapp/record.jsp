<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String num = "";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(substr(vaccinate_no,2,3))+1 from tbl_vaccination");
			while(rs.next()) {
				num = String.format("A%03d",rs.getInt(1));
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
<script>
	function ck(f){
		if(f.id.value==""){alert("아이디가 입력되지 않았습니다."); f.id.focus(); return false;}
	}
</script>
			<h2>예방접종이력 등록</h2>
			<form action="record_db.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>접종이력번호</th><td style="text-align:left;"><input type="text" name="num" value="<%=num %>" readonly />예) A001</td></tr>
					<tr><th>아이디</th><td style="text-align:left;">
					<select name="id" id="">
						<option value="">아이디선택</option>
					<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from tbl_vaccination");
								while(rs.next()) {
									out.println("<option value='"+rs.getString(2)+"'>" + rs.getString(2) + "</option>");
								}
								stmt.close();
								con.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>					
					</select>
					예) C001</td></tr>
					<tr><th>백신코드</th><td style="text-align:left;">
					<select name="vCode" id="">
						<option value="">백신코드</option>
						<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from tbl_vaccine");
								while(rs.next()) {
									out.println("<option value='"+rs.getString(1)+"'>[" + rs.getString(1) + "]"+rs.getString(2)+"</option>");
								}
								stmt.close();
								con.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</select> 예) [V007]홍역</td></tr>
					<tr><th>접종일자</th><td style="text-align:left;"><input type="text" name="date" maxlength=6 />예) 230701</td></tr>
					<tr><th>접종회차</th><td style="text-align:left;"><input type="text" name="time" />예) 1</td></tr>
					<tr><th>접종결과</th><td style="text-align:left;">
					<select name="result" id="">
						<option value="">접종결과</option>
						<option value="N">[N] 정상</option>
						<option value="N">[A] 이상</option>
					</select> 예) [N] 정상</td></tr>
					<tr><th>기관코드</th><td style="text-align:left;">
					<select name="aCode" id="">
						<option value="">기관선택</option>
						<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from tbl_vaccination");
								while(rs.next()) {
									out.println("<option value='"+rs.getString(7)+"'>" + rs.getString(7) + "</option>");
								}
								stmt.close();
								con.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</select>예) B023</td></tr>
					<tr><td colspan=2><input type="submit" value="등 록" /> <input type="reset" value="다시쓰기" onclick="alert('모든 내용이 초기화됩니다!');" /></td></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>