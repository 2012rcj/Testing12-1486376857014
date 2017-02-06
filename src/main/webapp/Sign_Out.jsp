<%-- 
    Document   : Sign_Out
    Created on : 1 Oct, 2016, 10:18:19 AM
    Author     : rspl-kunal
--%>


<!DOCTYPE html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
	<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
	<!--[if IE 7]>	<html class="no-js ie7 oldie" lang="en"> <![endif]-->
	<!--[if IE 8]>	<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ipp="" class="no-js ie8 oldie" lang="en"> <![endif]-->
	<!-- Consider adding an manifest.appcache: h5bp.com/d/Offline -->
	<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">
	
		<!-- Use the .htaccess and remove these lines to avoid edge case issues.
			More info: h5bp.com/b/378 -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
		<title>Logout</title>
		<meta name="description" content="">
		<meta name="author" content="">
 
		<!-- Mobile viewport optimized: j.mp/bplateviewport -->
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->


	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/minified/lib/modernizr-2.0.6-min.js
"></script>

	 	<!-- CSS: implied media=all -->
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/jquery/jquery-min.css
" rel="Stylesheet"></link>
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/bootstrap/css/bootstrap-min.css
" rel="Stylesheet"></link>

	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/font-awesome/css/font-awesome.min.css
" rel="Stylesheet"></link>
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/style-min.css
" rel="Stylesheet"></link>
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/fonts-min.css
" rel="Stylesheet"></link>
		<!--[if lte IE 8]>
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/style_ie8.css
" rel="Stylesheet"></link>
		<![endif]-->
		<!--[if IE 7]> 
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/bounce/style_ie7.css
" rel="Stylesheet"></link>
		<![endif]-->
	<link type="text/css" href="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/themes/rex/login3.css
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
    <script>
			window.universal_variable = {
				  "account":{
				    "client_id" : "99rstreet.com",
					"plan" : "",
					"company_name": "99 Retail Solutions Pvt Ltd",
					"service_provider_name": "rstreet",
					"demo_mode" : "false"
				  }
				};
		</script>
    <body class="gt-home ng-scope" scroll="" ng-controller="TopNavCtrl" ng-app="gt-home">
 
      <div class="container">
		<div class="main span5 offset3">	  
    		<div class="head-login">
               <img class="logo" src="Images_Of_99_Retail_Street/office_logo.jpg">
                <div class="head-line">
                 <h4>99 Retail Solutions Pvt Ltd</h4>
                 <small>Streamline. Save Time. Better Clime.</small>
                </div>                
            </div>
            <div class="body-login">
                <div class="body-content">
                
                  <div id='login-panel' class='view-panel  hide'>
                    <div class="left1">
		                <div class="line1 s1">
		              	  <div>
		              		<strong>Sign in&nbsp;</strong><img  src="Images_Of_99_Retail_Street/divider.png" style="width:360px;" height="2"> 
						  </div>
		                </div>
					     <div class= "line12 s2">
					     <div class='error-message error-text inner-col hide' id='login_error_message'>
					        
					     </div>
                        </div>
						 <form class='form-inline center' id='loginForm' action="j_spring_security_check" autocomplete="off" method="POST">
		                 <div class="s2">
		               	   <span class="line2">User Name</span><input type="text" class="input-large user-input" size="48" id='j_username' name='j_username' placeholder='User Name' tabindex="2" error-placement="block"/>
		                 </div><br>
		                <div class="s2">
		                  <span class="line2">Password</span>&nbsp;&nbsp;<input type="password" class="input-large user-input" id='j_password' name= 'j_password' placeholder='Password' tabindex="3"/>&nbsp;&nbsp;&nbsp;&nbsp;
						   <button class="btn btn-info" id='login-button' style="height:35px; width:75px;" tabindex="4">Log In</button>
		               </div>
				    </div>
                       <div class="line4">
                         <img src="Images_Of_99_Retail_Street/divider.png" style="width:230px" height="2"><a href="#reset-panel" id='reset-password-link' class="login-nav s6" tabindex="5">Forgot Password</a>                      
					     <a href="mailto:kunal.Jain@99rstreet.com?subject=Trouble logging into greytHR." class=  "s6">Contact Us</a>				     
                      </div>
                    </form>
			      </div>
		       
				  <div id='reset-panel' class='view-panel hide'>					
					<div class='left1'>
						<div class="line3 s1">
							<div class=""><strong>Reset Password&nbsp;</strong><img src="Images_Of_99_Retail_Street/divider.png" style="width:275px" height="2"> </div>
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
                     <img src="Images_Of_99_Retail_Street/divider.png" style="width:330px" height="2" />		<a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

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
                      <img src="Images_Of_99_Retail_Street/divider.png" style="width:330px" height="2" />		<a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

			        </div>
				  </div>  

				  <div id="logout-panel" class="view-panel ">
					<div class='left1'>
					    <div class="line13 s1">
							<div><strong>Sign Out&nbsp;</strong><img src="Images_Of_99_Retail_Street/divider.png" style="width:340px" height="2"> </div>
						</div>													 
						   <div class="line11 sign-out1 signout1-text inner-col">
						     You are now signed out.
						   </div>
						   <div class="sign-out2  signout2-image inner-col">
						    <img src="Images_Of_99_Retail_Street/check.png">
						   </div>
					  </div><br>
					<div class="line8">
                     <img src="Images_Of_99_Retail_Street/divider.png" style="width:320px" height="2" />		<a href="index.jsp" class='login-nav back-to-login-btn s6'>Back to Login</a>

                    </div>
				  </div>
				  
			 </div>	  
            </div>
 
            <div class="foot-login">
                  <div style="margin-top:-20px;">
	           	    <div class="s5"><strong>Use your Open ID to login</strong></div>
	                 <form class='openid-login' autocomplete="off" method="POST">
	                  <div class="open-id-btn">
	                  <a class='openid' href="#" provider="google" scope="https://www.googleapis.com/auth/userinfo.profile"><img src="Images_Of_99_Retail_Street/g-btn.png" provider="google" scope="https://www.googleapis.com/auth/userinfo.profile"></a>&nbsp;
	                  <a href="#"><img src="Images_Of_99_Retail_Street/f-btn.png" provider="facebook"></a>&nbsp;
	                  <a href="#"><img src="Images_Of_99_Retail_Street/t-btn.png" provider="twitter"></a>&nbsp;
	                  <input name="scope" type="hidden" />
	                  </div>
	                 </form>
	              </div>   
            </div>
            <div class="row-fluid">
	            <div class='span4'>
				   <div class="footer_link">&copy; 99 Retail Solutions Pvt. Ltd.<br>
					<a href="docs/privacy.html" target="new" class="s7">Privacy Policy</a> |
					<a href="docs/terms_of_use.html" target="new" class="s7">Terms Of Use</a>
				   </div>
				</div>
			   <div class="span4">
				</div>

		 </div><br><br><br>

        <div id="footer-pattren" style="vertical-align:bottom"></div>  
		
      </div>
    </div> 
   
   </body>
   </html>
	<!-- PNG Fix-->
	<!--[if lt IE 7]>
			<script type="text/javascript" src ="/js/pngfix.js?5.3.3a"></script>
			<script type='text/javascript'>
				try	{
					DD_belatedPNG.fix('.png_bg');
				}catch (e){};
			</script>
	<![endif]-->


	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/minified/lib/libs-min.js
"></script>

	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/minified/core-lib/core-min.js
"></script>
		
	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/minified/jquery/jquery-min.js
"></script>

	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/minified/gts/gts-min.js
"></script>

		<!--[if lt IE 9]>
	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/minified/lib/excanvas-min.js
"></script>
		<![endif]-->

	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js/ga/in.js
"></script>
		<script>
			ga('send', 'pageview');
		</script>

	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/integration/webenage.js
"></script>
	<script type="text/javascript" src="https://ds2dwxpm3ele2.cloudfront.net/5.3.3a/js2/integration/segment1.js
"></script>

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
				view : 'logout-panel',
				openId : {
					path: "https://openid.greytip.in",
					accessId: "NNDmlTD60oqKNxatXythQraMl7Bot",
					redirect: "https://rstreet.com:/"
				}
			});
		});
	</script>


