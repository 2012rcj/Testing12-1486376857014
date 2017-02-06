<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
   
    tr:nth-child(even) {background:#FF6600}
    tr:nth-child(odd) {background:#2a2aae}
    tr:nth-child(odd) {color:#FFFFFF}
    tr:nth-child(even) {color:#FFFFFF}

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

</style>

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
<body >
<%
if (request.getParameter("Id") != null ) 
{
try
 {
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	//create  the connection object
	Connection conn = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
  Statement stmt1 = conn.createStatement();
  ResultSet rs1 = stmt1.executeQuery("select str_Nm from retail_store") ;
  %>
<FORM NAME="1" ID="" ACTION="Maint_Report.jsp" METHOD="POST" >
  <table align="center" border="0">
      <tr class="odd">
          <td style="width: 175px" align="center">

             Store Name

          </td>
         <td>
      <select  name="Id" style="width:215px">
	<% 
            while(rs1.next()){
            if(rs1.getString(1).equals(request.getParameter("Id"))) { %>
                <option value='<%=rs1.getString(1)%>' selected><%=rs1.getString(1)%></option>
           <% }else { %>
                   <option value1='<%=rs1.getString(1)%>' ><%=rs1.getString(1)%></option>
            <%} } %>
</select>
 </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <td color="Orange">
        <input type="submit" value="SUBMIT">
        </td>
 </tr>
</table><br>
<%

      String S = (String)request.getParameter("Id");
      //System.out.println(S);
     Statement stm=conn.createStatement();
     ResultSet r2=stm.executeQuery("SELECT Ticket_Id,Subject_Desc,Support_Priority,support_ticket_status,Comment,date FROM retail_store_maint WHERE store_id =(Select Store_Id from retail_store where Str_Nm='"+S+"') ");
   %>
 <TABLE id="tablepaging" BORDER="1" align="center">
       <TR class="odd">
                   <TH align="center" >Ticket_Id</TH>
	           <TH align="center" >Subject_Desc</TH>
                   <TH align="center" >Support_Priority</TH>
                   <TH align="center" >support_ticket_status</TH>
                    <TH align="center" >Comment</TH>
                     <!-- <TH align="center" >LastModified</TH> -->
                     <TH align="center" >Date</TH>
        </TR>
            <% int count = 0;
 
                while(r2.next()){ 
		%>
               <TR class="even">
                   <TD align="center"> <%= r2.getString(1) %></td>
                   <TD align="center"> <%= r2.getString(2) %></TD>
                   <TD align="center"> <%= r2.getString(3) %></TD>
                    <TD align="center"> <%= r2.getString(4) %></TD>
                     <TD align="center"> <%= r2.getString(5) %></TD>
                   
                       <TD align="center"> <%= r2.getString(6) %></TD>
                  
                         
               </TR>
              <%++count;  }%>
</table>
<%if(count<1){ %>
<br>
<table align="center" ><tr align="center" > <td>&nbsp&nbsp No Data available for Select Store Name :&nbsp <%=request.getParameter("Id")%> &nbsp &nbsp </td><tr>  </table>  

                        <% }
   conn.close();
   }
   catch(Exception e)
   {
   out.println(e);
   }


 }else
 {
 try
  {
	 Class.forName("com.ibm.db2.jcc.DB2Driver");
		//create  the connection object
		Connection con1 = DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB:user=dash107813;password=MxX8ewhhVg7f;");
  Statement st = con1.createStatement();
  ResultSet RS = st.executeQuery("select str_Nm from retail_store") ;
  %>
<FORM NAME="1" ID="" ACTION="" METHOD="POST" >
  <table align="center" border="0">
      <tr class="odd">
          <td style="width: 175px" align="center">Store Name</td>
          <td>
            <select name="Id" style="width:215px">
            <% while(RS.next()){ 
            out.println("<option value='"+ RS.getString(1) + "'>" + RS.getString(1) + "</option>");
            } %>
            </select>
         </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <td color="orange"><input type="submit" value="SUBMIT">
        </td>
    </tr></table>
<%
con1.close();
}catch (Exception ee)
{
System.out.println("Hello"+ ee);
}}

%>

<div id="pageNavPosition" style="padding-top: 20px" align="center">
</div>
<script type="text/javascript">
var pager = new Pager('tablepaging',10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
</from>
</body>
</html>
