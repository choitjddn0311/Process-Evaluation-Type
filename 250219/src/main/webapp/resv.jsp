<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %> 
			<h1>근무좌석예약</h1>
			<form action="resv_db.jsp" method="get">
				<table>
					<tr><th>예약번호</th><td style="text-align: left;"><input type="text" name="resvno"> 예) 20210001</td></tr>
					<tr><th>사원번호</th><td style="text-align: left;"><input type="text" name="empno"> 예) 1001</td></tr>
					<tr><th>근무일자</th><td style="text-align: left;"><input type="text" name="wdate"> 예) 20211231</td></tr>
					<tr><th>좌석번호</th><td style="text-align: left;"><input type="text" name="seatno"> 예) S001 ~ S009</td></tr>
					<tr><th colspan=2><input type="submit" value="등록"> <input type="reset" value="다시쓰기"></th></tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>