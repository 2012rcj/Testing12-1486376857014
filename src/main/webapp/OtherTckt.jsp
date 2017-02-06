
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<!--style is use for background color of even and odd row -->
<style>
tr:nth-child(even) {
	background: #FF6600
}

tr:nth-child(odd) {
	background: #2a2aae
}

tr:nth-child(odd) {
	color: #FFFFFF
}

tr:nth-child(even) {
	color: #FFFFFF
}
</style>
</head>
<body>
	<center>
		<h1></h1>
		<p align="center">
		<form action="PosTcktHistory.jsp" method="post">


			<%
				if (request.getParameter("submit") != null) {
					//when user login user name save in database
					String Nilu = request.getParameter("Value77");
					// out.println("Hi" + Nilu);
					// session.setAttribute( "theName", Nilu );
					String name = (String) session.getAttribute("theName");
					// out.println("Hi budy..." + name);
					//vareiables declaretion and takes values from textfield 
					String s1 = request.getParameter("TcktId");
					session.setAttribute("tickid", s1);
					String s2 = request.getParameter("TeamMemebr");
					String s3 = request.getParameter("suptcksta");
					String s4 = request.getParameter("tmgrpmebr");
					String s5 = request.getParameter("tcktype");
					String s6 = request.getParameter("tckttupesupp");
					String s7 = request.getParameter("strid");
					String s8 = request.getParameter("supty");
					String s9 = request.getParameter("Comment");
					String s10 = request.getParameter("Date");

					try {
						// load the  mysql driver class  
						Class.forName("com.ibm.db2.jcc.DB2Driver");
						//  create  the connection object
						//Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB:user=dash111138;password=iCju8bMumIfF;");
						Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
						// procedure calling for insert data in table
						CallableStatement preparedStmt = con.prepareCall("{call  sp_99_Maint(?,?,?,?,?,?,?,?,?,?,?)}");

						//set the value in callable statement object

						preparedStmt.setString(1, s1);
						preparedStmt.setString(2, s2);
						preparedStmt.setString(3, s3);
						preparedStmt.setString(4, s4);
						preparedStmt.setString(5, s5);
						preparedStmt.setString(6, s6);
						preparedStmt.setString(7, s7);
						preparedStmt.setString(8, s8);
						preparedStmt.setString(9, s9);
						preparedStmt.setString(10, s10);
						preparedStmt.setString(11, name);

						//execute the callable statement object
						preparedStmt.execute();
						//calling the procedure for update the table
						//CallableStatement preparedStmt1 = con.prepareCall("{call  sp_retail_store_maint_update(?,?)}");
						//set the value   
						//preparedStmt1.setString(1, s1);
						//preparedStmt1.setString(2, s7);

						// execute the preparedstatement
						//preparedStmt1.executeUpdate();
						//close the connection object
						con.close();
					} catch (Exception e) {
						// System.err.println("Got an exception!");
						System.err.println(e.getMessage());
					}
			%>
			<script>
				window.location.href = "PosHistory.jsp";
			</script>
			<%
				}
			%>
			<table>
				<tr>
				<tr class="EVEN">
					<td>Ticket_Id</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								//execute the select query for show the data on page and set the data rs .rs is the object
								ResultSet rs = st.executeQuery("select * from retail_store_maint");
						%> <select id="mytext" name="TcktId" style="width: 275px">
							<%
								while (rs.next()) {
										if (rs.getString(1).equals(request.getParameter("TcktId"))) {
							%>
							<option value='<%=rs.getString(1)%>' selected><%=rs.getString(1)%></option>
							<%
								} else {
							%>
							<option value1='<%=rs.getString(1)%>'><%=rs.getString(1)%></option>
							<%
								}
									}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>Team_Member</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								//
								ResultSet rs = st.executeQuery("select * from retail_team_member");
						%> <select id="mytext" name="TeamMemebr" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(2)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>support ticket status</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from retail_supp_tick_sta");
						%> <select id="mytext" name="suptcksta" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(2)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>team group member</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from retail_team_group_member");
						%> <select id="mytext" name="tmgrpmebr" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(2)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>Ticket Type</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from retail_tick_typ");
						%> <select id="mytext" name="tcktype" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(2)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>Ticket Type support</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from  retail_supp_typ");
						%> <select id="mytext" name="tckttupesupp" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(2)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>
					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>Store_Id</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select Store_Id from retail_store_maint");
						%> <select id="mytext" name="strid" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(1)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<tr>
				<tr class="EVEN">
					<td>Support_priority</td>

					<td>
						<%
							try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from retail_comp_supp_prty");
						%> <select id="mytext" name="supty" style="width: 275px">
							<%
								while (rs.next()) {
							%>

							<option><%=rs.getString(2)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>

					</TD>
				</tr>
				<td><label for="Comment">Comment<span class="required">*</span></label></td>
				<td><input type="text" id="Comment" name="Comment"
					style="width: 275px" required autofocus></td>
				<tr>
					<td><label for="Date">Date<span class="required">*</span></label></td>
					<td><input type="Date" id="Date" name="Date"
						style="width: 275px" required autofocus></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="submit" value="Submit" /> <input
						type="submit" name="cancel" value="Cancel" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>

