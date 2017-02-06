
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
String ticket_id=request.getParameter("tktid");
//System.out.println(ticket_id);
String query="";
%>
<html>
<div id="tkt_typ_supp1"><%
try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								query="select * from  retail_store_maint where TICKET_ID="+ticket_id;
								ResultSet rs = st.executeQuery(query);//  update here
						%> <select id="tkt_typ_supp" name="tckttupesupp" style="width: 275px">
							<%
								while (rs.next()) {
									//System.out.println(rs.getString(3)+"in tkt_typ_supp");
							%>

							<option><%=rs.getString(3)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>
 </div>
 <div id="supp_tkt_stat1">
<%
try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								query="select * from  retail_store_maint where TICKET_ID="+ticket_id;
								ResultSet rs = st.executeQuery(query);//  update here
						%> <select id="supp_tkt_stat" name="suptcksta" style="width: 275px">
							<%
								while (rs.next()) {
									//System.out.println(rs.getString(5)+"in tkt_typ_supp");
							%>

							<option><%=rs.getString(5)%></option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) {
 		out.println("Exception e = " + e);
 	}
 %>
 
<%
try {
								Class.forName("com.ibm.db2.jcc.DB2Driver");
								Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
								Statement st = con.createStatement();
								query="select * from  retail_store_maint where TICKET_ID="+ticket_id;
								ResultSet rs = st.executeQuery(query);//  update here
						%> <select id="str_id" name="strid" style="width: 275px">
							<%
								while (rs.next()) {
									//System.out.println(rs.getString(2)+"in tkt_typ_supp");
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
 </div>
 </html>
 