
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

.pg-normal {
	color: #000000;
	font-size: 15px;
	cursor: pointer;
	background: #FF6600;
	padding: 2px 4px 2px 4px;
}

.pg-selected {
	color: #fff;
	font-size: 15px;
	background: #FF6600;
	padding: 2px 4px 2px 4px;
}
</style>
</style>
<!-- script is use for pagging next and previous -->
<script type="text/javascript">

function Pager(tableName, itemsPerPage) {

this.tableName = tableName;

this.itemsPerPage = itemsPerPage;

this.currentPage = 1;

this.pages = 0;

this.inited = false;

this.showRecords = function(from, to) {

var rows = document.getElementById(tableName).rows;

// i starts from 1 to skip table header row

for (var i = 1; i < rows.length; i++) {

if (i < from || i > to)

rows[i].style.display = 'none';

else

rows[i].style.display = '';

}

}

this.showPage = function(pageNumber) {

if (! this.inited) {

alert("not inited");

return;

}

var oldPageAnchor = document.getElementById('pg'+this.currentPage);

oldPageAnchor.className = 'pg-normal';

this.currentPage = pageNumber;

var newPageAnchor = document.getElementById('pg'+this.currentPage);

newPageAnchor.className = 'pg-selected';

var from = (pageNumber - 1) * itemsPerPage + 1;

var to = from + itemsPerPage - 1;

this.showRecords(from, to);

}

this.prev = function() {

if (this.currentPage > 1)

this.showPage(this.currentPage - 1);

}

this.next = function() {

if (this.currentPage < this.pages) {

this.showPage(this.currentPage + 1);

}

}

this.init = function() {

var rows = document.getElementById(tableName).rows;

var records = (rows.length - 1);

this.pages = Math.ceil(records / itemsPerPage);

this.inited = true;

}

this.showPageNav = function(pagerName, positionId) {

if (! this.inited) {

alert("not inited");

return;

}

var element = document.getElementById(positionId);

var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal">Prev </span> ';

for (var page = 1; page <= this.pages; page++)

pagerHtml += '<style id="pg' + page + '" class="pg-normal;"></style> ';

pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next</span>';

element.innerHTML = pagerHtml;

}

}

</script>
</head>
<body>

	<%
		String Ticket_Id = "";
		if (request.getParameter("Ticket_Id") != null) {
			Ticket_Id = request.getParameter("strid");
			String name = (String) session.getAttribute("tickid");

		}
	%>
	<form name="ticketReport" method="post" action="PosHistory.jsp">
		<table align="center" border="0">
			<tr>
			<tr class="EVEN">
				<td><input type="hidden" name="ticket"
					value="<%=request.getParameter("ticket")%>"> Ticket_Id</td>

				<td>
					<%
						////when user login user name save in database
						String Nilu = request.getParameter("value78");
						String name = (String) session.getAttribute("thename");
						try {
							// load the driver class 
							Class.forName("com.ibm.db2.jcc.DB2Driver");
						//  create  the connection object
						Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
					
							Statement st = con.createStatement();
							//execute the select query for show the data on page and set the data rs .rs is the object
							ResultSet rs = st.executeQuery("select Ticket_Id from retail_store_maint  ");
					%> <select id="mytext" name="strid" style="width: 275px">

						<%
							while (rs.next()) {
									if (rs.getString(1).equals(request.getParameter("strid"))) {
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
				<th><input type="submit" value="submit"></th>
			</tr>

		</table>
	</form>

	<%
		//value is retrieving from textfield
		String s1 = request.getParameter("Transaction_Id");
		String s2 = request.getParameter("TeamMemebr");
		String s3 = request.getParameter("suptcksta");
		String s4 = request.getParameter("tmgrpmebr");
		String s5 = request.getParameter("tcktype");
		String s6 = request.getParameter("tckttupesupp");
		String s7 = request.getParameter("strid");
		String s8 = request.getParameter("supty");
		String s9 = request.getParameter("Comment");
		String s10 = request.getParameter("Comment");
		String s11 = request.getParameter("Date");

		String str = request.getParameter("strid");

		if ((request.getParameter("Transaction_Id") != "NULL")) {
			try {

				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
		
				//it is using for update the value in database
				String query = "UPDATE retail_store_maint_front set Team_Memebr= ?, support_ticket_status= ? where Transaction_Id= ? ";
				PreparedStatement preparedStmt = con.prepareStatement(query);
				//set the value in prparedstm object
				preparedStmt.setString(1, s2);
				preparedStmt.setString(2, s3);
				preparedStmt.setString(3, s1);
				//execute preparedstmt query
				preparedStmt.executeUpdate();
				//prcedure is calling for update the value in table
				CallableStatement preparedStmt1 = con.prepareCall("{call  sp_retail_store_maint_update(?,?,?)}");
				preparedStmt1.setString(1, s2);
				preparedStmt1.setString(2, s3);
				preparedStmt1.setString(3, s1);
				//execute the prepared statement
				preparedStmt1.execute();
				// create the statement object 
				Statement stmt = con.createStatement();
				String sql = "SELECT Transaction_Id,Team_Memebr,support_ticket_status,team_group_member,Ticket_Type,Ticket_Type_Support,Store_Id,Support_Priority,Comment,Last_Modified,date FROM retail_store_maint_front WHERE Ticket_Id ='"
						+ str + "'";
				//execute query
				ResultSet r1 = stmt.executeQuery(sql);
	%>

	<TABLE BORDER="1" id="tablepaging" align="center">
		<TR bgcolor="orange">
			<TH>Transaction_Id</TH>

			<TH>Team_Member</TH>
			<TH>support_ticket_status</TH>
			<TH>team_group_member</TH>
			<TH>Ticket_Type</TH>
			<TH>Ticket_Type_Support</TH>
			<TH>Store_Id</TH>
			<TH>Support_Priority</TH>
			<TH>Comment</TH>
			<TH>LastUpdate</TH>
			<TH>Date</TH>

		</TR>

		<%
			while (r1.next()) {
		%>
		<TR bgcolor="pink">
			<TD><a
				href="PosEditTckt.jsp?Value1=<%=r1.getString(1)%>&Value2=<%=r1.getString(2)%>&Value3=<%=r1.getString(3)%>&Value4=<%=r1.getString(4)%>&Value4=<%=r1.getString(4)%>&Value5=<%=r1.getString(5)%>&Value6=<%=r1.getString(6)%>&Value7=<%=r1.getString(7)%>&Value8=<%=r1.getString(8)%>&Value9=<%=r1.getString(9)%>&Value10=<%=r1.getString(10)%>&Value11=<%=r1.getString(11)%>"
				style="color: cyan"><%=r1.getString(1)%></a></td> 
			<TD><%=r1.getString(2)%></TD>
			<TD><%=r1.getString(3)%></TD>
			<TD><%=r1.getString(4)%></TD>
			<td><%=r1.getString(5)%></TD>
			<td><%=r1.getString(6)%></TD>
			<TD><%=r1.getString(7)%></TD>
			<TD><%=r1.getString(8)%></TD>
			<TD><%=r1.getString(9)%></TD>
			<TD><%=r1.getString(10)%></TD>
			<TD><%=r1.getString(11)%></TD>

		</TR>
		<%
			}
		%>
	</TABLE>
	<%
		//close the connection object
				con.close();

			} catch (Exception e) {
				out.println(e);
			}
		} else {
	%><br>
	<br>
	<%
		try {
				String str1 = request.getParameter("Value1");
				String str2 = request.getParameter("Value2");
				String str3 = request.getParameter("Value3");
				String str4 = request.getParameter("Value4");
				String str5 = request.getParameter("Value5");
				String str6 = request.getParameter("Value6");
				String str7 = request.getParameter("Value7");
				String str8 = request.getParameter("Value8");
				String str9 = request.getParameter("Value9");
				String str10 = request.getParameter("Value10");
				String str11 = request.getParameter("Value11");
				//convert into integer value
				int y1 = Integer.parseInt(str1);
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
				String query = "UPDATE retail_store_maint_front SET Team_Member ='" + str2
						+ "', support_ticket_status ='" + str4
						+ "' where Transaction_Id ='+y1+'OR Value2 IS NOT null ";
				Statement stmt = con.createStatement();
				ResultSet r2 = stmt.executeQuery(
						"SELECT Transaction_Id,Team_Member,Support_Priority,support_ticket_status,Comment,Last_Modified,date FROM retail_store_maint_front");
	%>
	<TABLE BORDER="1" align="center">
		<TR bgcolor="orange">
			<TH>Transaction_Id</TH>
			<TH>Team_Member</TH>
			<TH>Support_Priority</TH>
			<TH>support ticket status</TH>
			<TH>Comment</TH>
			<TH>LastUpdate</TH>
			<TH>Date</TH>

		</TR>
		<%
			while (r2.next()) {
		%>
		<TR bgcolor="pink">
			<TD><a
				href="PosEditTckt.jsp?Value1=<%=r2.getString(1)%>&Value2=<%=r2.getString(2)%>&Value3=<%=r2.getString(3)%>&Value4=<%=r2.getString(4)%>&Value5=<%=r2.getString(5)%>&Value6=<%=r2.getString(6)%>&Value7=<%=r2.getString(7)%>"
				style="color: cyan"><%=r2.getString(1)%></a></td>

			<!-- <TD><%=r2.getString(1)%></a></td>-->

			<TD><%=r2.getInt(2)%></TD>
			<TD><%=r2.getString(3)%></TD>
			<TD><%=r2.getString(4)%></TD>
			<TD><%=r2.getString(5)%></TD>
			<TD><%=r2.getString(6)%></TD>
			<TD><%=r2.getString(7)%></TD>
			<TD><%=r2.getString(8)%></TD>
			<TD><%=r2.getString(9)%></TD>
			<TD><%=r2.getString(10)%></TD>
			<TD><%=r2.getString(11)%></TD>

		</TR>
		<%
			}
					con.close();
				} catch (Exception even) {
					out.println(even);
				}
			}
		%>

	</TABLE>
	<!-- div is use for pagging -->
	<div id="pageNavPosition" style="padding-top: 20px" align="center">
	</div>
	<!-- script is using for pagging next and previous -->
	<script type="text/javascript">
var pager = new Pager('tablepaging',10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
</body>

</html>