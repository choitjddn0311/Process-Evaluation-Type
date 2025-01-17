<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h2>수강신청</h2>
			<form action="class_db.jsp" onsubmit="return ck(this)">
				<table>
					<tr><th>수강월</th><td style="text-align: left"><input type="text" name="date" />예)202203</td></tr>
					<tr><th>회원명</th><td style="text-align: left">
					<select name="cust_name" id="custName" onchange="cust()">
					<option value="">회원명</option>
						<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from tbl_member_202201");
								while(rs.next()) {
									out.println("<option value='"+rs.getString(1)+"'>" + rs.getString(2) + "</option>");
								}
								stmt.close();
								con.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</select>
					</td></tr>
					<tr><th>회원번호</th><td style="text-align: left"><input type="text" id="custNum" name="custNum" readonly /></td></tr>
					<tr><th>강의장소</th><td style="text-align: left"><input type="radio" name="place" value="서울분원" /> 서울분원 <input type="radio" name="place" value="성남분원" /> 성남분원 <input type="radio" name="place" value="대전분원" /> 대전분원 <input type="radio" name="place" value="부산분원" /> 부산분원 <input type="radio" name="place" value="대구분원" /> 대구분원 </td></tr>
					<tr><th>강의명</th><td style="text-align: left">
					<select name="class_name" id="className" onchange="cust()">
					<option value="">강의명</option>
						<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from tbl_teacher_202201");
								while(rs.next()) {
									out.println("<option value='"+rs.getInt(4)+"'>" + rs.getString(3) + "</option>");
								}
								stmt.close();
								con.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
						%> 
					</select>
					</td></tr>
					<tr><th>수강료</th><td style="text-align: left;"><input type="text" id="classMoney" name="classMoney" />원</td></tr>
					<tr><td colspan=2><input type="submit" value="수강신청" /> <input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다.')" /></td></tr>
				</table>
			</form>
			<script src="script.js"></script>
<%@ include file="footer.jsp" %>