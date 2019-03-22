<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="a.DB"%>
    <%@page import="a.Login"%>
    <%@ page import="java.sql.ResultSet" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction History</title>

 <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
<table>
		<tr>
    		<th>Transaction ID</th>
    		<th>TimeStamp</th>
    		<th>From-user</th>
    		<th>To-user</th>
    		<th>amount</th>
    		<th>success flag</th>
    		<th>reward</th>
    		<th>note</th>
  		</tr>
<%
	DB db = new DB();
	Login l = new Login();
	ResultSet rs = db.Selection("select * from passbook where from_user = '"+ l.getMobile() +"' or to_user = '"+ l.getMobile() +"'  "); 
	while(rs.next()) {
%>


       <tr>
       		<td><%=rs.getDouble("t_id") %></td>
       		<td><%=rs.getDate("date_time") %></td>
       		<td><%=rs.getDouble("from_user") %></td>
       		<td><%=rs.getDouble("to_user") %></td>
       		<td><%=rs.getFloat("amount") %></td>
       		<td><%=rs.getInt("success_flag") %></td>
       		<td><%=rs.getFloat("reward_amount") %></td>
       		<td><%=rs.getString("description") %></td>
       	</tr>

<%
    }
	
   %>
</table>

<%db.close(); %>
</body>
</html>