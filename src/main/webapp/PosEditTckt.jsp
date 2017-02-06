
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<body onload="setFocusToTextBox()">
	<form action="PosHistory.jsp" method="post">
		<%
			try {
				// load the driver class 
				Class.forName("com.ibm.db2.jcc.DB2Driver");
						//  create  the connection object
						Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
				//create the statement object
				Statement stmt = con.createStatement();
				//execute the query
				ResultSet r1 = stmt.executeQuery("select * from retail_store_maint_front");
		%>
		<table align="center" border="1">
			<tr>
				<td>Transaction_Id</td>
				<td>Team_Member</td>
				<td>Supp_tckt_Status</td>
				<td>team_group_member</td>
				<td>Ticket_Type</td>
				<td>Ticket_Type_Support</td>
				<td>Store_ID</td>
				<td>Support_Priority</td>
				<td>Comment</td>
				<td>LastUpdate</td>
				<td>Date</td>
			</tr>
			<tr>
				<td>
					<%
						out.println(request.getParameter("Value1"));
					%> <input type="hidden" value=<%=request.getParameter("Value1")%>
					name="Transaction_Id" size=16>
				</td>
				<td>
					<%
						try {Class.forName("com.ibm.db2.jcc.DB2Driver");
						//  create  the connection object
						Connection con1 = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement str = con1.createStatement();
								ResultSet r = str.executeQuery("select * from retail_team_member");
					%> <select id="mytext" name="TeamMemebr">
						<%
							while (r.next()) {
						%>
						<option><%=r.getString(2)%></option>
						<%
							}
						%>
				</select> <%
 	} catch (Exception e) {
 			out.println("Exception e = " + e);
 		}
 %>
				</td>
				<td>
					<%
						try {
							Class.forName("com.ibm.db2.jcc.DB2Driver");
							//  create  the connection object
							Connection con1 = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement str = con1.createStatement();
								ResultSet r = str.executeQuery("select * from retail_supp_tick_sta");
					%> <select id="mytext" name="suptcksta">
						<%
							while (r.next()) {
						%>
						<option><%=r.getString(2)%></option>
						<%
							}
						%>
				</select> <%
 	} catch (Exception e) {
 			out.println("Exception e = " + e);
 		}
 %>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value4"));
					%> <input type="hidden" value=<%=request.getParameter("Value4")%>
					name="tmgrpmebr" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value5"));
					%> <input type="hidden" value=<%=request.getParameter("Value5")%>
					name="Ticket_Type" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value6"));
					%> <input type="hidden" value=<%=request.getParameter("Value6")%>
					name="tckttupesupp" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value7"));
					%> <input type="hidden" value=<%=request.getParameter("Value7")%>
					name="Store_Id" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value8"));
					%> <input type="hidden" value=<%=request.getParameter("Value8")%>
					name="Support_Priority" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value9"));
					%> <input type="hidden" value=<%=request.getParameter("Value9")%>
					name="Comment" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value10"));
					%> <input type="hidden" value=<%=request.getParameter("Value10")%>
					name="LastUpdate" size=16>
				</td>
				<td>
					<%
						out.println(request.getParameter("Value11"));
					%> <input type="hidden" value=<%=request.getParameter("Value11")%>
					name="Date" size=16>
				</td>
			</tr>
		</table>
		<%
			//update the query and set the value 
				String query = "UPDATE retail_store_maint_front SET Team_Memebr='" + request.getParameter("Value2")
						+ "',support_ticket_status='" + request.getParameter("Value3") + "' where Transaction_Id='"
						+ request.getParameter("Value1") + "' ";
				//create the preparedstmt object 
				PreparedStatement pst = con.prepareStatement(query);
				//execute the preparedstmt
				pst.executeUpdate();
				//close the connection object
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		<br>
		<table align="center">
			<tr>
				<td><input type="submit" name="btnSubmit" value="Submit" />
					</form> <a href="PosHistory.jsp" style="color: white"><input
						type="button" value="Cancel"></a></td>
			</tr>
		</table>
</body>
</html>