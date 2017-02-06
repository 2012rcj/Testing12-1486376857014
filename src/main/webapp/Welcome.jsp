
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
         <style>
       
h1 {
text-shadow: 0 0 3px #FF0000;
}


.a {
list-style-type: circle;
    margin: 0;
    padding-left: 20px;
}

#nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

#nav li {
    float: left;
    
}

#nav li:last-child {
    border-right: none;
}

#nav li a {
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

#nav li a:hover:not(.active) {
    background-color: #111;
}

#nav .active {
    background-color: #1976D2;
}



body {background-color: #1976D2;}

table { table-layout: fixed; }
td { width: 20%; }
         </style>
         <style>
* {
padding:0px;
}
<!---rules for navigation---->

ul#navmenu, ul.sub1, ul.sub2 {
list-style-type:none;
font-size:16px;
} 
ul#navmenu li{ 
width:100px; /*Displays width of Manufacturer Solution hyperlink*/
text-align:left;  /*Adjust the heading of hyperlink to center---------*/
position:relative; /*Helps to adjust position of hypelink*/
float:left; /*Set the direction of Manufacturer Solution hyperlink*/ 
display:block;
font-size:18px;
height:25px;
line-height:25px; 
} 
ul#navmenu a{
position:relative; /* position tag not required*/
text-decoration:none; /*Removes underline from hyperlinks*/
display:block; /*Displays outer layout of the hyperlink*/
width:180px; /*Set width of block type Manufacturer hyperlink*/
height:25px;
text-align:center;
line-height:25px;
background-color:#1976D2;
border-radius:0px;
color:#212121;
float:left;
} 
ul#navmenu .sub1 li{
display:block;
margin-top:1px;
width:120px;

                margin-left:px;/*Adjusts distance between sub-list within primary list*/ 
padding:0px;
} 
ul#navmenu .sub1 a {
display:compact;
position:relative;
text-align:center
width:145spx;/* this gives distance between list items and sub list items under Manufacturer Solution*/
line-height:25px; 
background-color:#1976D2;
}
ul#navmenu .sub2 a{
margin-left: 55px;
background-color:#1976D2;
position:relative;
display:block;
} 
ul#navmenu li:hover>a{
display:block;
position:relative;
background-color:#FFFFFF; 
} 
ul#navmenu li:hover a:hover{
background-color:#FFFFFF;
display:block;
position:relative; 
} 
ul#navmenu ul.sub1 {
display:none;
position:absolute;
top:26px;
left: 0px;
                        
} 
ul#navmenu ul.sub2 {
display: none;
position:absolute;
top:0px;
left: 126px;
}
ul#navmenu li:hover .sub1 {
display:block;
position:absolute; 
}
ul#navmenu .sub1 li:hover .sub2 {
display:block;
} 
</style>
    </head>
    <%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    
       String V_Nm = request.getParameter("name");
       String V_Ps = request.getParameter("password");
       //out.println(V_Nm + V_Ps);
       session.setAttribute( "theName", V_Nm );
       if(session.getAttribute("theName")!=null){
     
      String V_Session = (String)session.getAttribute("theName");
     try
        {
        Class.forName("com.ibm.db2.jcc.DB2Driver");    
	//Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
	    Statement st = con.createStatement();
        String query="select * from retail_registration where NAME=? and Password=?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString  (1, V_Nm);
        preparedStmt.setString  (2, V_Ps);
        
        ResultSet rs =  preparedStmt.executeQuery();
          if(rs.next())
              {
        	  
        	   
                   %>
 
     
    <body style="max-height:100%;min-width:100%;margin-left:0%;margin-right:0%;margin-top:5%">
       
        <table border="0" width ="80%" height="100%" align="center" bgcolor="#FDF3E7">
            <tr>
        <td width="20%" height="100%"><img src="Images_Of_99_Retail_Street/office_logo.jpg" alt="99Logo" style="color:#FF6600;width:262;height:100; padding-left: 116px"></td>
        <td width="20%" height="100%" style="text-align: right;padding-right: 116px">  
		
                        <h1> Welcome <%= session.getAttribute("theName") %> </h1>
        <br>
        
        </td>
        
            </tr>
			
		<tr><td colspan="2" >
		<table style="max-height:100%;min-width:100%" width ="80%" border="0" align="center" bgcolor="#FDF3E7">
		
    <tr>
            <td colspan="3"   bgcolor="#1976D2">
               
			<ul id="nav" style="list-style-type: none; float:right"  >
          
              <li><a href="Sign_Out.jsp">Sign Out</a></li>
 
</ul>		
			</td>       
    </tr>
     <tr>
       <td>
<%String v_value = request.getParameter("Value1");
   // session.setAttribute( "theName", v_value );%> 
<ul id="navmenu">
	<li><a href="#">&nbsp&nbsp&nbspMaintenance Process
</a>

        <ul class="sub1">
           
        
 <li><a href="#">POS Maintenance</a>
                  <ul class="sub2">
                       <li><a href="Pos_Maintenance.jsp?Value77=<%= request.getParameter("Value1") %>" target="ck">Pre Maintenance</a></li> 
	         <!-- <li align="center"><a href="Final_Maintenance.jsp" target="ck">Final Maintenance</a></li>-->
                  <li align="center"><a href="dropdown.jsp" target="ck">Pos History</a></li>
                <li align="center"><a href="PosHistory.jsp" target="ck">Pos Final History</a></li>
 <li align="center"><a href="Maint_Report.jsp" target="ck">MaintReport</a></li>
                 </ul>
                 </li>
		 <li>
                   <a href="#">Other Maintenance</a>
                  <ul class="sub2">
		<li><a href="TicketGenerate.jsp" target="ck">Generate Ticket</a></li> 
		 <li><a href="ShowTcktStatus.jsp" target="ck">showtckStatus</a></li>
              <li><a href="Showtickgen.jsp" target="ck">Assign Ticket</a></li>
                 <li><a href="Other_History.jsp" target="ck">TicketHistory</a></li>
               
              
</ul>
       </li>
      </ul>

    

</td>
    </tr>
     <tr bgcolor="#FDF3E7" >
             <td style="z-index:-10">
    <iframe  src=""  width="885" height="605" frameborder="0" name="ck" id="ck" style="margin-top:3%">
    </iframe>
</td>
                
</tr>
            <tr bgcolor="#FDF3E7" >
                <td style="padding-left: 70px; padding-top: 50px">
                
                <br><br><br><br><br><br><br><br><br><br><br><br>				
                </td>	
				<td style="padding-left: 70px; padding-bottom: 35px; padding-top: 50px">
               
            <br><br><br><br><br><br><br><br><br><br><br><br>
				</td>
            
            
				<td style="padding-left: 70px; padding-top: 50px">   
                
             
             <br><br><br><br><br><br><br><br><br><br><br><br>
				</td>
			 </tr>
           
        </table></td>
		</tr>
        </table>
       <%
              }
        
       
                else
                    {
                    out.println("Sorry, username or password error!");
                        %>
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
		              		<strong>Sign in&nbsp;</strong><img  src="Image/divider.png" style="width:360px;" height="2"> 
						  </div>
		                </div>
					     <div class= "line12 s2">
					     <div class='error-message error-text inner-col hide' id='login_error_message'>
					        
					     </div>
                        </div>
						 <form   action="Welcome.jsp"  method="POST">
		                 <div class="s2">
                                     <span class="line2">User Name</span><input type="text" required="" class="input-large user-input" size="48" id='j_username' name='name' placeholder='User Name' tabindex="2" error-placement="block"/>
		                 </div><br>
		                <div class="s2">
                                    <span class="line2">Password</span>&nbsp;&nbsp;<input type="password" required="" class="input-large user-input" id='j_password' name= 'password' placeholder='Password' tabindex="3"/>&nbsp;&nbsp;&nbsp;&nbsp;
						   <button class="btn btn-info" id='login-button' style="height:35px; width:75px;" tabindex="4">Log In</button>
		               </div>
				    </div>
                       <div class="line4">
                         <div class="line4">
                    <!--   <a href="#reset-panel" style="color:white;">New User Registration</a>-->
                              
                    
                   <!--    <a href="#" id='reset-password-link' class="login-nav s6" tabindex="5">Forgot Password</a>                      
					     <a href="#" class=  "s6">Contact Us</a>-->				     
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
                     <img src="Image/divider.png" style="width:330px" height="2" />		<a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

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
                     <img src="Image/divider.png"style="width:330px" height="2" />		<a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

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
                      <img src="Image/divider.png" style="width:330px" height="2" />		<a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

			        </div>
				  </div>  

				  <div id="logout-panel" class="view-panel hide">
					<div class='left1'>
					    <div class="line13 s1">
							<div><strong>Sign Out&nbsp;</strong><img src="/themes/rex/images/divider.png" style="width:340px" height="2"> </div>
						</div>													 
						   <div class="line11 sign-out1 signout1-text inner-col">
						     You are now signed out.
						   </div>
						   <div class="sign-out2  signout2-image inner-col">
						    <img src="/themes/rex/images/check.png">
						   </div>
					  </div><br>
					<div class="line8">
                     <img src="/themes/rex/images/divider.png" style="width:320px" height="2" />		<a href="#login-panel" class='login-nav back-to-login-btn s6'>Back to Login</a>

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
	                  <a href="#"><img src="Image/f-btn.png" provider="facebook"></a>&nbsp;
	                  <a href="#"><img src="Image/t-btn.png" provider="twitter"></a>&nbsp;
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
				try	{
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
				//	path: "https://openid.greytip.in",
				//	accessId: "NNDmlTD60oqKNxatXythQraMl7Bot",
				//	redirect: "https://promantiaglobal.greytip.in:443/"
				}
			});
		});
	</script>                       
<%
               
                            }
           con.close();
}
catch(Exception e)
{
	out.println("Exception occured at line no 328 = "+e);
}
        %>                                  
        </body>
        <%
       }else{
    	   response.sendRedirect("Emp_login.jsp");
       }
        %>
</html>