<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<script>
	function ck(f){
		if(f.buy_date.value==''){
			alert("매수일자가 입력되지않았습니다!");
			f.buy_date.focus();
			return false;
		} else if(f.stock_item_code.value==""){
			alert("종목코드가 입력되지않았습니다!");
			f.stock_item_code.focus();
			return false;
		} else if(f.buy_number.value==""){
			alert("매수수량이 입력되지 않았습니다!");
			f.buy_number.focus();
			return false;
		} else if(f.buy_price.value==""){
			alert("매수가격이 입력되지 않았습니다!");
			f.buy_price.focus();
			return false;
		} else {
			alert("주식 매수 등록이 완료되었습니다!");
		}
	}
</script>
			<h1>주식 매수 등록</h1>
			<form action="sub2_db.jsp" method="get" onsubmit="return ck(this)">
				<table>
					<tr><th>매수일자</th><td style="text-align:left;"><input type="text" name="buy_date"> 예)20220302</td></tr>
					<tr><th>종목명</th><td style="text-align:left;">
						<select>
							<option value="종목명">종목명</option>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_stock_item");
			while(rs.next()) {
				out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
						</select> 예) [100002] 카카오
					</td></tr>
					<tr><th>종목코드</th><td style="text-align:left;"><input type="text" name="stock_item_code"> 예)100001</td></tr>
					<tr><th>매수수량</th><td style="text-align:left;"><input type="text" name="buy_number">주</td></tr>
					<tr><th>매수가격</th><td style="text-align:left;"><input type="text" name="buy_price">원</td></tr>
					<tr><th>부서코드</th><td style="text-align:left;">
						<select name="dept_code">
							<option value="부서">부서</option>
	<%
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from tbl_dept");
			while(rs.next()) {
				out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
						</select> 예) [100]국내펀드1팀
					</td></tr>
					<tr><td colspan=2><input type="submit" value="주식매수등록"> <input type="reset" value="다시쓰기" onclick="alert('모든 내용이 초기화 됩니다!');"></td></tr>
				</table> 
			</form>
<%@ include file="footer.jsp" %>