<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="a.DB"%>
    <%@page import="a.Login"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Gullak
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="./assets/css/material-kit.css?v=2.0.4" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />
</head>


<body>
<%
 	Login l1 = new Login();
 	float bal1 = l1.getEwalletbalance();
	System.out.println("wallet balance on display ----> " + bal1);
	request.setAttribute("available_balance", bal1);
 		
 %>


   <div class="page-header header-filter clear-filter purple-filter" data-parallax="true" style="background-image: url('./assets/img/bg2.jpg');">
    <div class="container">
      <div class="row">
        <div class="col-md-18 ml-auto mr-auto">
          <div class="brand">
            <h2>Gullak... Go Virtual</h2>
            
          </div>
        </div>
      </div>
    </div>
  </div>
      <div class="container">
        <!--                nav tabs               -->
        <div id="nav-tabs">
          <h1></h1>
          <div class="row">
            <div class="col-md-6">
             
              <!-- Tabs with icons on Card -->
              <div class="card card-nav-tabs">
                <div class="card-header card-header-rose">
                  <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <ul class="nav nav-tabs" data-tabs="tabs">
                         <li class="nav-item">
                          <a class="nav-link active" href="pay.jsp" target="iframe_view" data-toggle="tab">
                            <i class="material-icons">money</i> Send Money
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link " href="RequestMoney.jsp" target="iframe_view" data-toggle="tab">
                            <i class="material-icons">money</i> Request Money
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="addMoneyWithoutCard.jsp" target="iframe_view" data-toggle="tab">
                            <i class="material-icons">money</i> Add Money
                          </a>
                        </li>
                         <li class="nav-item">
                          <a class="nav-link " href="ShowTransactionHistory.jsp" target="iframe_view" data-toggle="tab">
                            <i class="material-icons">message</i> Transactions
                          </a>
                        </li>
                        
                         <li class="nav-item">
                          <a class="nav-link" href="ChangePassword.jsp" target="iframe_view" data-toggle="tab">
                            <i class="material-icons"></i> Change Password
                          </a>
                        </li>
                        
                        <li class="nav-item">
                          <a class="nav-link" href="ShowPendingRequests.jsp" target="iframe_view" data-toggle="tab">
                            <i class="material-icons"></i> Pending Requests
                          </a>
                        </li>
                        
                        <li class="nav-item">
                          <a class="nav-link" href="#settings" target="iframe_view"  data-toggle="tab">
                            <i class="material-icons">face</i> Hello <%=  String.format("%10.0f",l1.getMobile())%>
                          </a>
                        </li> 
                        
                        <li class="nav-item">
                          <a class="nav-link" href="logout.jsp"  data-toggle="tab">
                            <i class="material-icons"></i> Logout
                          </a>
                        </li>
                        
                        <li class="nav-item">
                          <a class="nav-link" href="#settings" target="iframe_view" data-toggle="tab">
                            <i class="material-icons"></i> Wallet Balance ( <%= l1.getEwalletbalance()%> )
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card-body ">
                 <iframe src="pay.jsp" frameBorder="0" width="100%" height="800px" style="padding:50px;" name="iframe_view" >
                </div>
              </div>
              <!-- End Tabs with icons on Card -->
            </div>

          </div>
        </div>
      </div>
    
    <!--              end nav tabs -->

   
  <footer class="footer" data-background-color="black">
    <div class="container">
      <div class="copyright float-right">
        &copy;
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="material-icons">favorite</i> by
        <a href="https://www.creative-tim.com" target="_blank">DigiChips</a> 
      </div>
    </div>
  </footer>
  <!--   Core JS Files   -->
  <script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="./assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="./assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="./assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for Sharrre btn -->
  <script src="./assets/js/plugins/jquery.sharrre.js" type="text/javascript"></script>
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/material-kit.js?v=2.0.4" type="text/javascript"></script>
  <script>
    $(document).ready(function() {
      //init DateTimePickers
      materialKit.initFormExtendedDatetimepickers();

      // Sliders Init
      materialKit.initSliders();
    });


    function scrollToDownload() {
      if ($('.section-download').length != 0) {
        $("html, body").animate({
          scrollTop: $('.section-download').offset().top
        }, 1000);
      }
    }


    $(document).ready(function() {

      $('#facebook').sharrre({
        share: {
          facebook: true
        },
        enableHover: false,
        enableTracking: false,
        enableCounter: false,
        click: function(api, options) {
          api.simulateClick();
          api.openPopup('facebook');
        },
        template: '<i class="fab fa-facebook-f"></i> Facebook',
        url: 'https://demos.creative-tim.com/material-kit/index.html'
      });

      $('#googlePlus').sharrre({
        share: {
          googlePlus: true
        },
        enableCounter: false,
        enableHover: false,
        enableTracking: true,
        click: function(api, options) {
          api.simulateClick();
          api.openPopup('googlePlus');
        },
        template: '<i class="fab fa-google-plus"></i> Google',
        url: 'https://demos.creative-tim.com/material-kit/index.html'
      });

      $('#twitter').sharrre({
        share: {
          twitter: true
        },
        enableHover: false,
        enableTracking: false,
        enableCounter: false,
        buttons: {
          twitter: {
            via: 'CreativeTim'
          }
        },
        click: function(api, options) {
          api.simulateClick();
          api.openPopup('twitter');
        },
        template: '<i class="fab fa-twitter"></i> Twitter',
        url: 'https://demos.creative-tim.com/material-kit/index.html'
      });

    });
  </script>
</body>

</html>