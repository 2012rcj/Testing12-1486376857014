<!DOCTYPE html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]> <html xmlns="http://www.w3.org/1999/xhtml" xmlns:ipp="" class="no-js ie8 oldie" lang="en"> <![endif]-->
<!-- Consider adding an manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <%@page import="java.sql.Connection"%>
<html class="no-js" lang="en"> <!--<![endif]-->
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>

<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("theName")==null){
    //response.sendRedirect(request.getContextPath() + "/logout.jsp");
 
%>
<BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    <%} %>
<head>
<meta charset="utf-8">
<!-- Use the .htaccess and remove these lines to avoid edge case issues.
More info: h5bp.com/b/378 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<title>99retailsolutionsHR Login</title>
<meta name="description" content="">
<meta name="author" content="">
<!-- Mobile viewport optimized: j.mp/bplateviewport -->
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->


<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js2/minified/lib/modernizr-2.0.6-min.js
"></script>

<!-- CSS: implied media=all -->
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/jquery/jquery-min.css
" rel="Stylesheet"></link>
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/bootstrap/css/bootstrap-min.css
" rel="Stylesheet"></link>

<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/font-awesome/css/font-awesome.min.css
" rel="Stylesheet"></link>
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/style-min.css
" rel="Stylesheet"></link>
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/fonts-min.css
" rel="Stylesheet"></link>
<!--[if lte IE 8]>
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/style_ie8.css
" rel="Stylesheet"></link>
<![endif]-->
<!--[if IE 7]> 
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/bounce/style_ie7.css
" rel="Stylesheet"></link>
<![endif]-->
<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/themes/rex/login3.css
" rel="Stylesheet"></link>

         <style type="text/css">
body {
margin-left: 0px;
margin-top: 0px;
}
.gt-home.ng-scope .row-fluid {
}

</style>
</head>

    <body class="gt-home ng-scope" scroll="" ng-controller="TopNavCtrl" ng-app="gt-home">
 
      <div class="container">
<div class="main span5 offset3">  
    <div class="head-login">
               <img class="logo" src="Image/office_logo.jpg">
                <div class="head-line">
                 <h4>99RetailSolutions</h4>
                 <small>Streamline. Save Time. Better Clime.</small>
                </div>                
            </div>
            <div class="body-login">
                <div class="body-content">
                
                  <div id='login-panel' class='view-panel  '>
                    <div class="left1">
               <div class="line1 s1">
               <div>
              <strong>Sign in&nbsp;</strong><img  src="/themes/rex/images/divider.png" style="width:360px;" height="2"> 
 </div>
               </div>
    <div class= "line12 s2">
    <div class='error-message error-text inner-col hide' id='login_error_message'>
       
    </div>
                        </div>
                           
                        
<form   action="Welcome.jsp"  method="POST">
                <div class="s2">
                                     <span class="line2">User Name</span><input type="text" required="" class="input-large user-input" size="48" id='j_username' name='name' placeholder='User Name' tabindex="2" error-placement="block"/>
                <%request.getSession().setAttribute("Emp_id","name"); %>
                </div><br>
               <div class="s2">
                                    <span class="line2">Password</span>&nbsp;&nbsp;<input type="password" required="" class="input-large user-input" id='j_password' name= 'password' placeholder='Password' tabindex="3"/>&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-info" id='login-button' style="height:35px; width:75px;" tabindex="4" type="submit">Log In</button>
              </div>
                 </div>
                       <div class="line4">
                      <!-- <a href="#" style="color:white;">New User Registration</a>-->
                      <!--    <a href="#reset-panel" id='reset-password-link' class="login-nav s6" tabindex="3">Forgot Password</a>                      
    <a href="#" class=  "s6">Contact Us</a> -->    
                      </div>
                    </form>
     </div>
      
 <div id='reset-panel' class='view-panel hide'> 
<div class='left1'>
<div class="line3 s1">
<div class=""><strong>Reset Password&nbsp;</strong><img src="/themes/rex/images/divider.png" style="width:275px" height="2"> </div>
</div>
<div class='error-message error-text inner-col hide' id="resetpass_error_message">
      </div>
<div class="s2"><small>Request for a fresh password to be sent to your registered email address.</small><br> <br>
 <span class="line2"><b>Enter your User ID or Email ID</b></span>
</div>  <br>
<div class="s2">
 <form class='form-inlin' autocomplete="off">
                          <div class="control-group"><input id='userId' type='text' style="margin-top:7px" class="input-xlarge user-input" name=  'j_username' placeholder='Your User ID or Email' title="Please specify the Employee Number for employee login or user name for named user login." value="" title="Please specify the Employee Number for employee login or user name for named user login." style="margin-top:7px" />&nbsp;&nbsp;&nbsp;&nbsp;
<button class='btn btn-info'id="btnForgotPassword" style="height:36px">Send Password</button> </div>
                       </form>
                        </div>
</div>
<div class="line5">
                     <img src="/themes/rex/images/divider.png" style="width:330px" height="2" /> <a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

                    </div>
 </div>
 
 <div id='passAnswer-panel' class='hide view-panel'>  
<div class='left1'>  
  <div class="line1 s1">
<div class="line10 s2">
 <div class='error-message error-text1 inner-col hide' id="passAnswer_error_message"></div> 
<form class='form-inline' autocomplete="off"> 
  <center><div id="userName"></div></center><br>
<div id="question"></div><br>
<div class='control-group'>
 <input type='password'  id='answer' class="input-large" name='answer' placeholder='Your answer' title="Please provide the ans for the question to get the password in you email id."/>&nbsp;&nbsp;&nbsp;&nbsp;<button class='btn btn-info' id="btnSubmitAnswer" style="height:35px; width:75px;">Submit</button>
</div>
</form> 
</div>
 </div>
</div>
<div class="line6">
                     <img src="/themes/rex/images/divider.png"style="width:330px" height="2" /> <a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

                    </div>
 </div>
 <div id='passAnswer-success' class='hide view-panel'>
<div class='left1'>
<div class="line2">
 <div class="line9 s2">
<h3>Check your mail box for the password reset link.</h3>
</div>
 </div>
</div>
<div class="line7">
                      <img src="/themes/rex/images/divider.png" style="width:330px" height="2" /><a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

       </div>
 </div>  

 <div id="logout-panel" class="view-panel hide">
<div class='left1'>
   <div class="line13 s1">
<div><strong><a href="Login.jsp">Sign Out&nbsp;</a></strong><img src="/themes/rex/images/divider.png" style="width:340px" height="2"> </div>
</div>  
  <div class="line11 sign-out1 signout1-text inner-col">
    You are now signed out.
  </div>
  <div class="sign-out2  signout2-image inner-col">
   <img src="/themes/rex/images/check.png">
  </div>
 </div><br>
<div class="line8">
                     <img src="/themes/rex/images/divider.png" style="width:320px" height="2" /> <a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

                    </div>
 </div>
 
</div>  
            </div>
 
            <div class="foot-login">
                  <div style="margin-top:-20px;">
             <div class="s5"><strong>Use your Open ID to login</strong></div>
                <form class='openid-login' autocomplete="off" method="POST">
                 <div class="open-id-btn">
              <!--  <a class='openid' href="#" provider="google" scope="https://www.googleapis.com/auth/userinfo.profile"><img src="Images_Of_99_Retail_Street/g-btn.png" provider="google" scope="https://www.googleapis.com/auth/userinfo.profile"></a>&nbsp;-->
                 <a href="https://www.facebook.com/"><img src="Image/f-btn.png" provider="facebook"></a>&nbsp;
                 <a href="https://twitter.com/login"><img src="Image/t-btn.png" provider="twitter"></a>&nbsp;
                 <a href="https://plus.google.com/"><img src="Image/Google-plus.png" provider="Google+"></a>&nbsp;
                 <input name="scope" type="hidden" />
                 </div>
                </form>
             </div>   
            </div>
            <div class="row-fluid">
           <div class='span4'>
  <div class="footer_link">&copy; 99 Retail Solutions Pvt. Ltd.<br>
<a href="#" target="" class="s7">Privacy Policy</a> |
<a href="#" target="" class="s7">Terms Of Use</a>
  </div>
</div>
  <div class="span4">
</div>
<div class="span2 pull-right" style="margin-right:-35px;">
<div class="powered-by-info">
<div class="#"></div> 
</div>
</div>
</div><br><br><br>

        <div id="footer-pattren" style="vertical-align:bottom"></div>  
      </div>
    </div> 
   
   </body>
   </html>
<!-- PNG Fix-->
<!--[if lt IE 7]>
<script type="text/javascript" src ="/js/pngfix.js?5.0"></script>
<script type='text/javascript'>
try {
DD_belatedPNG.fix('.png_bg');
}catch (e){};
</script>
<![endif]-->


<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js2/minified/lib/libs-min.js
"></script>

<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js2/minified/core-lib/core-min.js
"></script>
<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js2/minified/jquery/jquery-min.js
"></script>

<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js2/minified/gts/gts-min.js
"></script>

<!--[if lt IE 9]>
<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js2/minified/lib/excanvas-min.js
"></script>
<![endif]-->

<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.0/js/ga/in.js
"></script>
<script>
ga('send', 'pageview');
</script>
<script language='javascript' async='true' type='text/javascript' src='https://whatfix.com/embed/embed.nocache.js'></script>

<script type="text/javascript" src ="/js2/bounce/login.js"></script>
<script language="javascript" >
var _active_menu_id = "";
var _error_message = "";
var _confirm_message = "";
var _context = "";

var _companyName = "99 Retail Solution Pvt. Ltd";

$(function(){
new gts.external.Main("#front-page", {
reason : '',
view : '',
openId : {
}
});
});
</script>


