<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.Cookies" %>
	<%
		response.addCookie(Cookies.createCookie("AUTH","","/", 0)); //쿠키 삭제
		session.invalidate();  //세션 삭제
		response.sendRedirect("main.jsp");
	%>