
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
	//vareiables declaretion and takes values from textfield
		String Var_TcktId = request.getParameter("TcktId");
		String Var_StrId = request.getParameter("StrId");
		String Var_SubDesc = request.getParameter("SubDesc");
		String Var_SuppPrior = request.getParameter("SuppPrior");
		String Var_SuppSta = "In Process";
		String Var_TmDesc = request.getParameter("TmDesc");
		String Var_TmNm = request.getParameter("TmNm");
		String Var_Cmnt = request.getParameter("Comnt");
		//when user login user name save in database
		String Nilu = request.getParameter("Value77");
		String username = (String) session.getAttribute("theName");

		if (request.getParameter("btnSubmit") != null) {
			try {
				String s = request.getParameter("Value");
				// load the mysql driver class
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//create  the connection object
				Connection c = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");

				String query1 = "UPDATE retail_store_maint set Store_Id=?,Subject_Desc=?,Support_Priority=?,Support_Ticket_Status=?,Team_Group=?,Team_Member=?,Comment=?,user=? where Ticket_Id= ? ";
				PreparedStatement preparedStmt = c.prepareStatement(query1);
				//set the value in prepstmt object
				preparedStmt.setString(1, Var_StrId);
				preparedStmt.setString(2, Var_SubDesc);
				preparedStmt.setString(3, Var_SuppPrior);
				preparedStmt.setString(4, Var_SuppSta);
				preparedStmt.setString(5, Var_TmDesc);
				preparedStmt.setString(6, Var_TmNm);
				preparedStmt.setString(7, Var_Cmnt);
				preparedStmt.setString(8, username);
				preparedStmt.setString(9, Var_TcktId);
				//execute the prepared statement
				preparedStmt.executeUpdate();
				//close the connection object
				c.close();
			} catch (Exception e) {
				out.println("Exception = " + e);
			}

		}
	%>
	<%
		{
			try {
				//load the mysql driver class
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				//create the connection object
				Connection conn = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
				//create the statement object
				Statement stmt = conn.createStatement();
				// execute query
				ResultSet r1 = stmt.executeQuery("select * from retail_store_maint where Support_Ticket_Status = 'Open'");
	%>
	<TABLE id="tablepaging" BORDER="1" align="center" style="margin-left:15%">
		<TR>
			<TH>TICKET ID</TH>
			<TH>STORE ID</TH>
			<TH>SUBJECT NAME</TH>
			<TH>SUPPORT PRIORITY</TH>
			<TH>SUPPORT TICKET STATUS</TH>
			<TH>TEAM GROUP</TH>
			<TH>TEAM MEMBER</TH>
			<TH>COMMENT</TH>
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
		%>
	</TABLE>
	<%
		//close the connection object
				conn.close();
			} catch (Exception e) {
				out.println(e);
			}
		}
	%><br>
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
