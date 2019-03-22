
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
	<form action="AddMoneyToWallet"   method="POST"  name="frmRegister" autocomplete="off" onSubmit="return check_frmRegister()" class="form-horizontal">
	<div class="page-header">
	<h2> Add Card</h2>
	
	</div>
		<fieldset>

		<div class="control-group">
   	    	<label class="control-label" for="cname"><font color="#FF0000">*</font>Name on Card : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="30" id="cname" name="lname" size="20" value="">
       		</div> 
   		</div>
		
   		<div class="control-group">
   	    	<label class="control-label" for="amount"><font color="#FF0000">*</font>Enter the amount to be added in wallet : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="13" id="amount" name="amount" size="13" value="" type="text">
       		</div> 
   		</div>
		
		<div class="control-group">
        <label class="control-label"><font color="#FF0000">*</font>Card Type: </label>
                <div class="controls">
                     <select size="1" name="cardtype" class="formbox">
						<option value="C">Credit Card</option>
						<option value="D">Debit Card</option>
					</select>
				</div>
		</div>
	</div>
	<div class="control-group">
   	    	<label class="control-label" for="cardNo"><font color="#FF0000">*</font>Card Number : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="16" id="amount" name="cnum" size="16" value="" type="text">
       		</div> 
   		</div>

	<div class="control-group">
   	    	<label class="control-label" for="edate"><font color="#FF0000">*</font>Expiry date : </label>
       		<div class="controls">
       			<input type="month"  class="formbox" maxLength="6" id="amount" name="ex_date" size="6" value="" >
       		</div> 
   		</div>
    <input class="formbox" type="checkbox" value="1" name="default" checked name = "default"> Set as default.

     </div>
    </div>
     
		<div class="control-group">        		        
                		<div class="controls">
                			<input class="btn btn-warning" type="submit" name="submit" value="Add Card">
                		</div> 
            		</div>  
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

