<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="a.DB"%>

<!DOCTYPE html>
<html lang="en">
   <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="PayOnWeb, PowerToWeb, EbixCash">
    <meta name="author" content="Itzcash">
    <!-- Le styles -->
    
    
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    
    <link rel="shortcut icon" href="ico/favicon.png">
	<link href="css/dropdown_menu.css" media="screen" rel="stylesheet" type="text/css" />
	
	
  </head>
  <body>
   

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span12">
        



<script type="text/javascript">

</script>
<div class="hero-unit">

    <div class="row-fluid form_contener">
		<div class="span12">
	<form action="AddMoneyWithoutCard"  method="POST"  name="frmRegister" autocomplete="off" onSubmit="return check_frmRegister()" class="form-horizontal">
	<div class="page-header">
	<h2> Add Money to Wallet</h2>
	
	</div>
		<fieldset>

		
   		<div class="control-group">
   	    	<label class="control-label" for="amount"><font color="#FF0000">*</font>Enter the amount to be added in wallet : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="13" id="amount" name="amount" size="13" value="" type="text">
       		</div> 
   		</div>
		    <input class="formbox" type="checkbox" value="C" name="default" unchecked name = "default_credit"> Use default card
		    <input class="formbox" type="hidden" value="not_default" name="default" unchecked name = "default_credit"> Use default card
			
		<%
			DB db = new DB();
		    ArrayList cards = new ArrayList();
		    cards = db.showSavedCards();
		    pageContext.setAttribute("cards", cards);   
		    if(cards.isEmpty() == true) {
		    	System.out.println("Please add a card firt to add money");
		    }
		    
		%>
		
		<div class="control-group">
        <label class="control-label">Choose Card: </label>
                <div class="controls">
                     <select  name="select_card" class="formbox">
                      <c:forEach var="item" items="${cards}">
              				<option><c:out value="${item}"/></option>
         			  </c:forEach>
					</select>
				</div>
		</div>
	</div>

     </div>
    </div>
		<div class="control-group">        		        
                		<div class="controls">
                			<input class="btn btn-warning" type="submit" name="submit" value="Add Money to Wallet">
                		</div> 
        </div>  
        
       <a href="AddMoneyToWallet.jsp" class="btn btn-info">Add a new Card</a>

       		</div> 
   		</div>
    	</div>   
	 </fieldset>    
	
	</form>
	</div>
</div>
</div>
</div>
      </div>


     
 </body><!-- InstanceEnd --></html>

