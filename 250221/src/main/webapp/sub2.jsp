<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<h1>수강신청</h1>
			<form action="sub2_db.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>수강월</th><td style="text-align:left;"><input type="input" name="regist_name">2022년03월 예)202203</td></tr>
					<tr><th>회원명</th><td style="text-align:left;">
					<select name="c_name" id="custName" onchange="cust()">
					<option>회원명</option>
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
			out.print(e);
		}
	%>
					</select>
					</td></tr>
					<tr><th>회원번호</th><td style="text-align:left;"><input type="input" name="c_no" value="" id="custNum" readonly>예)10001</td></tr>
					<tr><th>강의장소</th><td style="text-align:left;">
					<select name="class_area">
					<option>강의장소</option>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_class_202201");
			while(rs.next()) {
				out.println("<option value='"+rs.getString(3)+"'>" + rs.getString(3) + "</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
					</select>
					</td></tr>
					<tr><th>강의명</th><td style="text-align:left;">
					<select name="class_name" id="className" onchange="cust()">
					<option>강의신청</option>
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
			out.print(e);
		}
	%>
					</select>
					</td></tr>
					<tr><th>수강료</th><td style="text-align:left;"><input type="input" name="tuition" id="classMoney" readonly>원</td></tr>
					<tr><td colspan=2><input type="submit" value="수강신청"> <input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!.');"></td></tr>
				</table>
			</form>
			<script>
			function cust() {
				const custName = document.getElementById("custName");
				const custNum = document.getElementById("custNum");
				custNum.value = custName.value;
				const className = document.getElementById("className");
				const classMoney = document.getElementById("classMoney");
				classMoney.value = className.value;
				if(custName.value > 20000){
					classMoney.value = className.value/2;
				}
			}
			
			function ck(f) {
				if(f.regist_name.value==''){
					alert("수강월을 입력해주세요");
					f.regist_name.focus();
					return false;
				} else {
					alert("수강신청이 정상적으로 완료되었습니다!");
					location.href="index.jsp";
				}
			}
			</script>
<%@ include file="footer.jsp" %>