<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>DigiChips e-Wallet</title>
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
    <h1 style="font-family:Comic sans MS;"><center>DigiChips</center></h1>
    <div class="navbar">
      <div class="top"></div>
      <div class="header">      
        <div class="top-link">
        <ul>
        
        </ul>
        </div>
        </div>  
      
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span12">
        



<script type="text/javascript">

function check_frmRegister(){
	
	//Set the validations here
	var MinUnameLength=6
	var MaxUnameLength=20
	var MinNameLength=1
	var MaxNameLength=30;
	var MaxEmailLength=100;
	var MinPasswordLength=6;
	var MaxPasswordLength=20;
	var MinYearOfBirth=1900;
	var MaxYearOfBirth=2001;
	var MinAddressLength=10;
	var MaxAddressLength=100;
	var MinCityLength=1;
	var MaxCityLength=100;
	var MinPinLength=5;
	var MaxPinLength=6;
	var MinMobileLength=4;
	var MaxMobileLength=13;
	

	if(document.frmRegister.password1.value.length<MinPasswordLength||document.frmRegister.password1.value.length>MaxPasswordLength)
	{
		alert("Passwords should be between "+MinPasswordLength+" and "+MaxPasswordLength+" characters long.");
		document.frmRegister.password1.value="";
		document.frmRegister.password2.value="";
		document.frmRegister.password1.focus();
		return false;
	}
	if(document.frmRegister.password1.value!=document.frmRegister.password2.value)
	{
		alert("The passwords don't match. Please re-enter passwords.");
		document.frmRegister.password1.value="";
		document.frmRegister.password2.value="";
		document.frmRegister.password1.focus();
		return false;
	}





	if(document.frmRegister.fname.value.length<MinNameLength||document.frmRegister.fname.value.length>MaxNameLength){
		alert("First Name should be between "+MinNameLength+" and "+MaxNameLength+" characters long.");
		document.frmRegister.fname.focus();
		return false;
	}
	if(document.frmRegister.mname.value!=""&&(document.frmRegister.mname.value.length<MinNameLength||document.frmRegister.mname.value.length>MaxNameLength)){
		alert("Middle Name should be between "+MinNameLength+" and "+MaxNameLength+" characters long.");
		document.frmRegister.mname.focus();
		return false;
	}
	if(document.frmRegister.lname.value.length<MinNameLength||document.frmRegister.lname.value.length>MaxNameLength){
		alert("Last Name should be between "+MaxNameLength+" characters long.");
		document.frmRegister.lname.focus();
		return false;
	}
        

	if(document.frmRegister.mobileno.value.length<MinMobileLength||document.frmRegister.mobileno.value.length>MaxMobileLength){
		alert("Please enter a valid Mobile phone number.");
		document.frmRegister.mobileno.focus();
		return false;
	}
	if(!document.frmRegister.agree.checked)
	{
                alert("You must Agree to the Terms and Conditions if you want to register. Kindly read the terms and conditions document carefully and please do not register if you do not agree.");
                document.frmRegister.agree.focus();
                return false;
        }

	return true;

}
</script>
<div class="hero-unit">


    <div class="row-fluid form_contener">
		<div class="span12">
	<form name="frmRegister" method="post" action="RegisterServlet" autocomplete="off" onSubmit="return check_frmRegister()" class="form-horizontal">
	<div class="page-header">
	<h2> Registration</h2>
	<small>Please enter the registration information. Fields marked '<font color="#FF0000">*</font>' are mandatory.</small>
	
	</div>
		<fieldset>
		<div class="control-group">
   	    	<label class="control-label" for="name"><font color="#FF0000">*</font>Name : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="30" id="name" name="name" size="20" value="">
       		</div> 
   		</div>
   
   		
   		<!--<div class="control-group">
   	    	<label class="control-label" for="lname"><font color="#FF0000">*</font>Last Name : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="30" id="lname" name="lname" size="20" value="">
       		</div> 
   		</div>-->
	
	
   		<div class="control-group">
   	    	<label class="control-label" for="mobileno"><font color="#FF0000">*</font>Mobile Number : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="13" id="mobileno" name="mobileno" size="13" value="">
       		</div> 
   		</div>

		<div class="control-group">
   	    	<label class="control-label" for="email"><font color="#FF0000">*</font>Email ID : </label>
       		<div class="controls">
       			<input class="formbox" maxLength="100" id="email" name="email" size="100" value="">
       		</div> 
   		</div>
   		
       			
       		<div class="control-group">
                <label class="control-label" for="password1"><font color="#FF0000">*</font>Password : </label>
                        <div class="controls">
                                <input class="formbox" maxLength="30" id="password1" name="password1" size="20" value="" type="password">
                        </div>
                </div>
		
		<div class="control-group">
                <label class="control-label" for="password2"><font color="#FF0000">*</font>Confirm Password : </label>
                        <div class="controls">
                                <input class="formbox" maxLength="30" id="password2" name="password2" size="20" value="" type="password">
                        </div>
                </div>
				
       			
       		</div> 
   		</div>

        



             


        
                

                

        

			

       			<input class="formbox" type="checkbox" value="1" name="agree" checked> I have read the <font color="#FF0000">*</font><a href="Registration.jsp" target="_blank">Terms and Conditions</a> and I Agree.
       	   </small>
   		 <div class="control-group">        		        
          		<div class="controls">
          			<input class="btn btn-warning" type="submit" name="submit" value="Register">
          		</div> 
    	</div>   
	 </fieldset>    
	<noscript>
	<p>*Your browser does not support JavaScript. <a href="http://www.mozilla.com/firefox" target="_blank">Click Here</a> for a browser that does.</p>
	</noscript>
	
	</form>
	</div>
</div>
</div>
</div>
      </div><!--/row-->

      <!--<footer>
        <p>&copy; Company 2012</p>
      </footer>-->

    </div><!--/.fluid-container-->

<!-- InstanceEndEditable --> 
<!--footer-->
<div class="footer">
  <div class="container">

     
 </body><!-- InstanceEnd --></html>

