<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String num = request.getParameter("num");
	String id = request.getParameter("id");
	String vCode = request.getParameter("vCode");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String result = request.getParameter("result");
	String aCode = request.getParameter("aCode");
	String sql = "insert into tbl_vaccination values('"+num+"','"+id+"','"+vCode+"','"+date+"','"+time+"','"+result+"','"+aCode+"')";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<script>alert("예방접종이력등록이 완료 되었습니다"); location.href="list.jsp"</script>
<%@ include file="footer.jsp" %>