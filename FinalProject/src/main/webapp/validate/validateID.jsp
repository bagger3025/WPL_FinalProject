<%@ page import="Login.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    userStruct us;
    String userID = request.getParameter("id");
    System.out.println(userID);
    if (userID.equals("")){
		us = null;
        out.print("false");
	} else {
		us = HandleLogin.MatchID(userID);
        if (us == null){
            out.print("true");
        }
        else{
            out.print("false");
        }
	}
%>