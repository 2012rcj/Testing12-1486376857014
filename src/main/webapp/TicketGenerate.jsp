

<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket</title>
<style>
    tr:nth-child(even) {background:#FF6600}
    tr:nth-child(odd) {background:#2a2aae}
    tr:nth-child(odd) {color:#FFFFFF}
tr:nth-child(even) {color:#FFFFFF}
</style>
</head>
<body>
<center>
<form name='newticket' action="TicketGenerate.jsp" method="post"  >	
<%
  if(request.getParameter("submit")!=null)
  {
	 String s1=request.getParameter("tcktsts"); 
	
	 String s2=request.getParameter("tcktpesprt");
	
	 String s3=request.getParameter("strid");
	 
	 String s4=request.getParameter("supprity");
	
	 String s5=request.getParameter("teamembr");
	
	 String s6=request.getParameter("comment");
	
	 String s7=request.getParameter("date");
	 String s8=request.getParameter("file");
	  
	  
     try
{
    	// load the  mysql driver class  
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			//  create  the connection object
			//Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
			Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
			// procedure calling for insert data in table
			CallableStatement preparedStmt = con.prepareCall("{call  sp_Ticket_genrate(?,?,?,?,?,?,?,?)}");

       
  preparedStmt.setString(1,s1);
  preparedStmt.setString(2,s2);
  preparedStmt.setString(3,s3);
  preparedStmt.setString(4,s4);
  preparedStmt.setString(5,s5);
  preparedStmt.setString(6,s6);
  preparedStmt.setString(7,s7);
  preparedStmt.setString(8,s8);
  preparedStmt.executeUpdate(); 

         con.close();
         }
         catch (SQLException e)
             {
              // System.err.println("Got an exception!");
              // System.err.println(e.getMessage());
              e.getNextException();
             }

      }
         %>





	
<table border="1" align="center">


	<tr class="EVEN">
        <td>
           Ticket Status
        </td>
       
        <td>
            <%
            try{
            	Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from retail_supp_tick_sta");
                %>
                 <select id="mytext" name="tcktsts" style="width: 275px">
                <% while(rs.next()){ %>
               
<option><%= rs.getString(2) %></option>
                <%}%>
                 </select>
                <%
            }
            catch(Exception e){
                out.println("Exception e = " + e);
            }
            %>
          
        </TD>
 </tr>

 <tr>
 		<tr class="EVEN">
        <td>
            Ticket Type support
        </td>
       
        <td>
            <%
            try{
            	Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from  retail_supp_typ");
                %>
                 <select id="mytext" name="tcktpesprt" style="width: 275px">
                <%while(rs.next()){%>
               
<option><%= rs.getString(2) %></option>
                <%}%>
                 </select>
                <%
            }
            catch(Exception e){
                out.println("Exception e = " + e);
            }
          
            %>
            </TD>
 </tr>
 
 
 <tr>
 		<tr class="EVEN">
        <td>
            Store_Id
        </td>
       
        <td>
            <%
            try{
            	Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select Store_Id from retail_store");
                %>
                 <select id="mytext" name="strid" style="width: 275px">
                <%while(rs.next()){%>
               
<option><%= rs.getString(1) %></option>
                <%}%>
                 </select>
                <%
            }
            catch(Exception e){
                out.println("Exception e = " + e);
            }
            %>
          
        </TD>
 </tr>
 
 <tr>
 		<tr class="EVEN">
        <td>
            Support_Priority
        </td>
       
        <td>
            <%
            try{
            	Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from retail_comp_supp_prty");
                %>
                 <select id="mytext" name="supprity" style="width: 275px">
                <%while(rs.next()){%>
               
<option><%= rs.getString(2) %></option>
                <%}%>
                 </select>
                <%
            }
            catch(Exception e){
                out.println("Exception e = " + e);
            }
            %>
          
        </TD>
 </tr>
 		<tr>
 		<tr class="EVEN">
        <td>
             Team_Member
        </td>
       
        <td>
            <%
            try{
            	Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from retail_team_member");
                %>
                 <select id="mytext" name="teamembr" style="width: 275px">
                <%while(rs.next()){%>
               
<option><%= rs.getString(2) %></option>
                <%}%>
                 </select>
                <%
            }
            catch(Exception e){
                out.println("Exception e = " + e);
            }
            %>
          
        </TD>
 </tr>
 
 	
 
  
 
  
<%-- < <tr>
<td>Email Address: <input type="email" name="email" required placeholder="Enter a valid email address"></td>
</tr>--%>

<tr>
<td>Comment</td>
<td><input type="text" name="comment"style="width: 275px"></td>
</tr>
<tr>
<td>Date</td>
<td><input type="date" name="date"style="width: 275px"></td>
</tr>
<tr>
<td>File Upload:</td>
<td><input type="file" name="file" size="50" /></td>
</tr>
</table>
<center>
<input type="submit" name="submit" value="Submit" />
</center>
 </form>

</center>


</body>

</html>
