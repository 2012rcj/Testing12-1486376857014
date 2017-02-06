
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
		if (request.getParameter("sbtn") != null) {
			Ticket_Id = request.getParameter("strid");
			System.out.println(Ticket_Id);
			String name = (String) session.getAttribute("tickid");

		}
	%>
	<form name="ticketReport" method="post" action="Other_History.jsp">
		<table align="center" border="0">
			<tr>
			<tr class="EVEN">
				<td><input type="hidden" name="ticket"
					value="<%=request.getParameter("ticket")%>"> Ticket_Id</td>

				<td>
					<%
						////when user login user name save in database
						//String Nilu = request.getParameter("value78");
						//String name = (String) session.getAttribute("thename");
						try {
							// load the driver class 
							Class.forName("com.ibm.db2.jcc.DB2Driver");
						//  create  the connection object
						Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
					
							Statement st = con.createStatement();
							//execute the select query for show the data on page and set the data rs .rs is the object
							ResultSet rs = st.executeQuery("select Tckt_Id from tckt_genrate  ");
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
				<th><input type="submit" name="sbtn" value="submit"></th>
			</tr>

		</table>
	</form>

	<%
		

		if ((request.getParameter("Transaction_Id") != "NULL")) {
			try {
                     String Ticket_Id1=request.getParameter("strid");
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
		
				//it is using for update the value in database
				
				// create the statement object 
				Statement stmt = con.createStatement();
				String sql = "SELECT * FROM tri_tckt_genrate WHERE Tckt_Id ='"
						+ Ticket_Id1 + "'";
				//execute query
				ResultSet r1 = stmt.executeQuery(sql);
	%>

	<TABLE BORDER="1" id="tablepaging" align="center">
		<TR bgcolor="orange">
			<TH>Ticket Status</TH>

			<TH>Team_Member</TH>
			<TH>Ticket Type support</TH>
			<TH>Store ID</TH>
			<TH>Support_Priority</TH>
			
			<TH>Comment</TH>
			<TH>Date</TH>

		</TR>

		<%
			while (r1.next()) {
		%>
		<TR bgcolor="pink">

			
			<TD><%=r1.getString(3)%></TD>
			<TD><%=r1.getString(7)%></TD>
			<td><%=r1.getString(4)%></TD>
			<td><%=r1.getString(5)%></TD>
			<TD><%=r1.getString(6)%></TD>
			<TD><%=r1.getString(8)%></TD>
			<TD><%=r1.getString(10)%></TD>
			
			

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
		} 
		else
		{
	%>
	<%
		try {
				
				//convert into integer value
				
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//  create  the connection object
				Connection con = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
				
				Statement stmt = con.createStatement();
				String sql1 = "SELECT * FROM tri_tckt_genrate WHERE Tckt_Id ='"
						+ Ticket_Id + "'";

				ResultSet r2 = stmt.executeQuery(sql1);
	%>
	<TABLE BORDER="1" align="center">
		<TR bgcolor="orange">
			<<TH>Ticket Status</TH>

			<TH>Team_Member</TH>
			<TH>Ticket Type support</TH>
			<TH>Store ID</TH>
			<TH>Support_Priority</TH>
			
			<TH>Comment</TH>
			<TH>Date</TH>

		</TR>
		<%
			while (r2.next()) {
		%>
		<TR bgcolor="pink">
			

			
			<TD><%=r2.getString(3)%></TD>
			<TD><%=r2.getString(7)%></TD>
			<TD><%=r2.getString(4)%></TD>
			<TD><%=r2.getString(5)%></TD>
			<TD><%=r2.getString(6)%></TD>
			<TD><%=r2.getString(8)%></TD>
			<TD><%=r2.getString(10)%></TD>
			
			

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
var pager = new Pager('tablepaging',20);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
</body>

</html>