



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
        
        	<!--<li id="logout"><A href="../jsp/Login.jsp">Home</A></li>
        -->
        </ul>
        </div>
        </div>  
      
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span12">
        

<script type="text/javascript">
function check()
{
        var MinUnameLength=6;
        var MaxUnameLength=20;
        var MaxMobileLength=10;

        // Email format checking
        if(!(document.login.mobileno.value.match(/^\d{10}$/)))
        {
                alert("Please enter a valid Mobile Number.");
                document.login.mobileno.focus();
                return false;
        }

        // Mobile No length checking
        if(document.login.mobileno.value.length>MaxMobileLength)
        {
                alert("Please enter a valid Mobile Number.");
                document.login.mobileno.focus();
                return false;
        }

	return true;
}
</script>
<p>

    <br>

</p>

<div class="hero-unit">
    <div class="row-fluid form_contener">
		<div class="span12">
		<form name="login" method="post" action="../servlet/UserResetPasswordServlet" autocomplete="off" onSubmit="return check()" class="form-horizontal">
		<legend> Reset Password</legend>
		<fieldset>
		<div class="control-group">
		     	    	<label class="control-label" for="email">Mobile No: </label>
		         		<div class="controls">
		         			<input class="formbox" type="text" id="mobileno" name="mobileno" value="" maxlength="10" size="20">
		         		</div> 
		      		</div>
                                <label class="control-label" for="email">Send Password By: </label>
                                        <div class="controls">
                                                <input class="formbox" type="radio" name="deliverymode" value="E" checked>Email<br>
                                                <input class="formbox" type="radio" name="deliverymode" value="M">SMS
                                        </div>
                                </div>
	      		
		      		 <div class="control-group">        		        
		          		<div class="controls">
		          		<input class="btn btn-warning" type="submit" name="submit" value="Submit">
		          		</div> 
		    	</div>   
		</fieldset>
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

 </body><!-- InstanceEnd --></html>

