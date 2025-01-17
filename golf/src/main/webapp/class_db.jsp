<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String date = request.getParameter("date");
	String custNum = request.getParameter("custNum");
	String place = request.getParameter("place");
	String money = request.getParameter("classMoney");
	String className = request.getParameter("class_name");
	switch(className){
	case"100000":
		className="100";
		break;
	case"200000":
		className="200";
		break;
	case"300000":
		className="300";
		break;
	case"400000":
		className="400";
		break;
	}
	
	String sql = "insert into tbl_class_202201 values('"+date+"','"+custNum+"','"+place+"','"+money+"','"+className+"')";
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
	<script>alert("수강신청이 정상적으로 완료되었습니다!"); location.href="index.jsp"</script>
<%@ include file="footer.jsp" %>