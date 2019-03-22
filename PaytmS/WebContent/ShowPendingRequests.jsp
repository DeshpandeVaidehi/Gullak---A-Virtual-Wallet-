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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    $('Approved').on('click', function(){
        var tr = $(this).closest('tr');
        var id = tr.find('.r_id').text();
        alert('id: '+id);
    });
});​
​
</script>
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

<h3> *Click on Request ID to approve money request</h3>
<table class = "list" id = "master_table">
	<thead>
		<tr>
    		<th>Request ID</th>
    		<th>Date</th>
    		<th>Request from</th>
    		<th>Amount</th>
    		<th>Description</th>
    		<th>Action</th>
  		</tr>
  	</thead>
<%
	DB db = new DB();
	Login l = new Login();
	ResultSet rs = db.Selection("select * from request_record where from_user = '"+ l.getMobile() +"'  "); 
	while(rs.next()) {
%>
<tbody>
       <tr>
       		<td class = "r_id"><%=rs.getDouble("r_id") %></td>
       		<td><%=rs.getDate("date_time") %></td>
       		<td><%=rs.getDouble("to_user") %></td>
       		<td><%=rs.getFloat("amount") %></td>
       		<td><%=rs.getString("description") %></td>
       		<td><form action="ApproveRequest" method="POST">
    <input type="hidden" name="r_id" value="<%=rs.getDouble("r_id") %>" />
    <input id="button" type="submit" value="Approve" >
</form>

form action="RejectRequest" method="POST">
    <input type="hidden" name="r_id" value="<%=rs.getDouble("r_id") %>" />
    <input id="button" type="submit" value="Reject" >
</form>

</td>
       	</tr>
</tbody>
<%
    }
	
   %>
</table>

<!-- 
<script type="text/javascript">
	var table = document.getElementById("master-table"), r_id;
	for(i=0;i<table.rows.length;i++){
		table.rows[i].onclick = function (){
			r_id = this.rowIndex;
			console.log(rowIndex);
		}
	}
-->
</script>
<%db.close(); %>

</body>
</html>