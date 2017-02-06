
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
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
	<!-- script is using for pagging next and previous -->
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
	
	try {
				//load the mysql driver class
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//create the connection object
				Connection conn = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
				//create the statement object
				Statement stmt = conn.createStatement();
				// execute query
				ResultSet r1 = stmt.executeQuery("select * from tckt_genrate where Tckt_Status = 'OPEN'");
	%>
	<TABLE id="tablepaging" BORDER="1" align="center">
		<TR>
			<TH>TICKET ID</TH>
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
		<TR class="even">
			<TD align="center"><%=r1.getString(1)%></TD>
			<TD align="center"><%=r1.getString(2)%></TD>
			<TD align="center"><%=r1.getString(3)%></td>
			<TD align="center"><%=r1.getString(4)%></td>
			<TD align="center"><%=r1.getString(5)%></td>
			<TD align="center"><%=r1.getString(6)%></td>
			<TD align="center"><%=r1.getString(7)%></td>
			<TD align="center"><%=r1.getString(8)%></td>
		</TR>
		<%
			}
	}
	catch(Exception e)
	{
		
	}
	
		%>
	</TABLE>
	<br>
	<!-- div is use for pagging next and previous -->
	<div id="pageNavPosition" style="padding-top: 20px" align="center">
	</div>
	<!-- script is use for pagging next and previous -->
	<script type="text/javascript">
var pager = new Pager('tablepaging',10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
</body>
</html>
