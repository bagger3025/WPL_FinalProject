<%@ page import="Login.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    userStruct us;
    String userID = request.getParameter("id");
    if (userID.equals("")){
    	// If input userID is null, it fails
        out.print("false");
	} else {
		us = HandleLogin.MatchID(userID);
		// If input userID doesn't exist in db, it succeeds
		// If input userID exists in db, it fails
		out.print(us == null ? "true" : "false");
	}
%>