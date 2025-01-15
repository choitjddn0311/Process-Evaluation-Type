<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%
String number = request.getParameter("number");
String custno = request.getParameter("custno");
String code = request.getParameter("code");
String nail = request.getParameter("nail");
String pedi = request.getParameter("pedi");
String other = request.getParameter("other");
String date = request.getParameter("date");

String sql = "insert into tbl_ferformance values('"+number+"','"+custno+"','"+code+"','"+nail+"','"+pedi+"','"+other+"','"+date+"')";
out.print(sql);
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
<%@ include file="footer.jsp" %>