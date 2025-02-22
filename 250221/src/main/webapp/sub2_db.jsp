<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
	<%
	String regist_name = request.getParameter("regist_name");
	String c_name = request.getParameter("c_name");
	String class_area = request.getParameter("class_area");
	String tuition = request.getParameter("tuition");
	String class_name = request.getParameter("class_name");
	switch(class_name){
	case"100000":
		class_name="100";
		break;
	case"200000":
		class_name="200";
		break;
	case"300000":
		class_name="300";
		break;
	case"400000":
		class_name="400";
		break;
	}
	String sql = "insert into tbl_class_202201 values ('"+regist_name+"','"+c_name+"','"+class_area+"','"+tuition+"','"+class_name+"')";
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select sysdate from dual");
			while(rs.next()) {
				out.println();
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<script>
		location.href="index.jsp";
	</script>
<%@ include file="footer.jsp" %>