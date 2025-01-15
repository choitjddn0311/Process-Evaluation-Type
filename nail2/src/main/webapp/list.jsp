<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String num="";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select  max(p_number)+1 from tbl_ferformance");
			rs.next();
			num = rs.getString(1);
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<script>
		function ck(f){
			if(f.custno.value==""){
				alert("고객아이디가 입력되지 않았습니다."); f.custno.focus(); return false;
			}
		}
	</script>
			<h2>네일실적 등록</h2>
			<form action="list_db.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>번호</th><td style="text-align: left"><input type="text" name="number" value="<%=num %>" readonly /> 예)1</td></tr>
					<tr><th>고객아이디</th><td style="text-align: left"><input type="text" name="custno" /> 예)C001</td></tr>
					<tr><th>고객등급</th><td style="text-align: left"><input type="radio" name="code" value="V" />우수고객 &nbsp;<input type="radio" name="code" value="G" />일반고객 &nbsp;<input type="radio" name="code" value="s" />학생고객 &nbsp;</td></tr>
					<tr>
						<th>네일코드</th>
						<td style="text-align: left">
							<select name="nail">
							<%
								try {
									Class.forName ("oracle.jdbc.OracleDriver");
									Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery("select * from tbl_menu where menutype='N'");
									while(rs.next()) {
										out.println("<option value='"+rs.getString(1)+"'>["+rs.getString(1)+"]"+rs.getString(2)+"</option>");
									}
									stmt.close();
									con.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
							</select>예)[N01]풀코트
						</td>
					</tr>
					<tr>
						<th>페디코드</th>
						<td style="text-align: left">
							<select name="pedi" id="">
							<%
								try {
									Class.forName ("oracle.jdbc.OracleDriver");
									Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery("select * from tbl_menu where menutype='P'");
									while(rs.next()) {
										out.println("<option value='"+rs.getString(1)+"'>["+rs.getString(1)+"]"+rs.getString(2)+"</option>");
									}
									stmt.close();
									con.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
							</select>예)[P01]풀코트
						</td>
					</tr>
					<tr>
						<th>기타코드</th>
						<td style="text-align: left">
							<select name="other" id="">
							<%
								try {
									Class.forName ("oracle.jdbc.OracleDriver");
									Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery("select * from tbl_menu where menutype='E'");
									while(rs.next()) {
										out.println("<option value='"+rs.getString(1)+"'>["+rs.getString(1)+"]"+rs.getString(2)+"</option>");
									}
									stmt.close();
									con.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
							</select>예)[E00]해당없음
						</td>
					</tr>
					<tr><th>방문일자</th><td style="text-align: left"><input type="text" name="date" />예)230801</td></tr>
					<tr><th colspan=2><input type="submit" value="등 록"/> <input type="reset" value="다시쓰기" onclick="alert('모든 내용이 초기화 됩니다!');" /></th></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>