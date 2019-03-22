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
    <link href="css/bootstrap-responsive.css" rel=
    "stylesheet">

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
        


<script type="text/javascript" src="/js/base64.js"></script>
<script type="text/javascript" src="/js/jsencrypt.min.js"></script>

<script type="text/javascript">


function checkInp()
{
var x=document.forms["login"]["username"].value;
if (isNaN(x)) 
{
alert("Enter valid mobile number");
return false;
}
}

function check()
{
	var MinUnameLength=4;
	var MaxUnameLength=100;
	var MinPasswordLength=6;
	var MaxPasswordLength=20;
	
	if(document.login.username.value.length<MinUnameLength || document.login.username.value.length>MaxUnameLength)
	{	
		alert("Please enter a valid login name. You can enter either your email ID or Mobile number");
		document.login.username.focus();
		return false;
	}

        if(document.login.password.value.length<MinPasswordLength || document.login.password.value.length>MaxPasswordLength)
        {
                alert("Please enter a valid password.");
		document.login.password.value = "";
                document.login.password.focus();
                return false;
        }
	var formpassword = document.login.password.value;
	var crypt = new JSEncrypt();
	crypt.setPublicKey(document.login.publickey.value);
	
	var ciphertext = crypt.encrypt(formpassword);
	document.login.password.value = ciphertext;
	if(document.login.password.value.length<150)
	{
		alert("Password Encryption failed. Please use IE 10 or Firefox or Google Chrome");
		return false;
	}
	document.login.publickey.value="";
	var w=window.innerWidth|| document.documentElement.clientWidth|| document.body.clientWidth;
	var h=window.innerHeight|| document.documentElement.clientHeight|| document.body.clientHeight;
	var screenresolution = screen.width  + "x" + screen.height + "x" + w + "x" + h + "x" + screen.colorDepth;
	var userLang = navigator.language || navigator.userLanguage;
	var browserdetails2 = screenresolution + "|" + navigator.appCodeName + "|" + navigator.appName + "|" + navigator.appVersion + "|" + navigator.cookieEnabled + "|" + navigator.platform + "|" + userLang + "|" + getDetails();
	document.login.bdetails.value = Base64.encode(browserdetails2);
	//document.login.bdetails.value = browserdetails2;
	return true;
}

function getDetails()
{
    var plen = navigator.plugins.length;
    var pluginString;
    for (var i = 0;i<plen; i++)
    {
        pluginString = pluginString + navigator.plugins[i].name + "|" + navigator.plugins[i].filename + "|" + navigator.plugins[i].description + "|" + navigator.plugins[i].version + "|";
    }
    return pluginString;
}

</script>


<p>

    <br>

</p>

<div class="hero-unit">
    <div class="row-fluid form_contener">
		<div class="span11">
			<form   action="LoginUser" method="POST" onsubmit="return checkInp()" class="form-horizontal" name="login">
				<fieldset>
                                <legend>Login</legend>
	      	      	<div class="control-group">
            	    	<label class="control-label" for="username">Mobile No : </label>
                		<div class="controls">
                			<input type="text" id="username"  name="username" value="" maxlength="100" size="30">
                		</div> 
             		</div>
            		<div class="control-group">
        		        <label class="control-label" for="password">Password : </label>
                		<div class="controls">
                			<input class="formbox" id="password" type="password" name="password" value="" maxlength="20" size="30">
                		</div> 
            		</div>
			
			
                      <div class="control-group">        		        
                		<div class="controls">
                			<input class="btn btn-warning" type="submit" name="submit" value="Login">
                		</div> 
            		</div>   
      				
				
                      <div class="control-group">
                                <div class="controls">


<a href="Registration.jsp" class="btn btn-info">Click here to Register</a>


<a href="ForgetPassword.jsp" class="btn btn-info">Reset Password</a>
                                </div>
                        </div>


</fieldset>
			</form>
			</div>
</div>
</div>
</div>
      </div><!--/row-->
      


 </body><!-- InstanceEnd --></html>


