
<%-- 
    Document   : For_Folder
    Created on : 13 Oct, 2016, 3:07:56 PM
    Author     : rspl-kunal
--%>
<%@ page language="java" import="java.sql.*"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.openstack4j.api.OSClient"%>
<%@ page import="org.openstack4j.openstack.OSFactory"%>
<%@ page import="org.openstack4j.model.storage.object.SwiftAccount"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.openstack4j.model.common.Identifier"%>
<%@ page import="org.openstack4j.api.storage.ObjectStorageService"%>
<%@ page import="org.openstack4j.model.storage.object.SwiftObject"%>
<%@ page import="org.openstack4j.api.storage.ObjectStorageService"%>
<%@ page import="org.openstack4j.model.common.DLPayload"%>
<%@ page import="org.openstack4j.model.storage.object.SwiftContainer"%>
<%@ page import="org.openstack4j.model.storage.object.SwiftObject"%>
<%@ page import="org.openstack4j.model.common.Payloads"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="javax.servlet.http.Part"%>
<%@ page import="org.openstack4j.model.common.Payload"%>
<%@ page import="java.util.*"%>
<%@ page import="org.openstack4j.model.storage.object.SwiftContainer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>For Creating Folder</h1>

<%
String V_Store_Id = (String)request.getParameter("Value");
String Var_Email = "admin@99rstreet.com";
//String V_Session = (String)session.getAttribute("VSID");
  session.setAttribute( "VSID", V_Store_Id );
  
try{

        Class.forName("com.ibm.db2.jcc.DB2Driver");
        //create the connection object
        Connection con11 = DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB:user=dash111138;password=iCju8bMumIfF;");
        //use for calling the store procedure
        CallableStatement cstmt11 = con11.prepareCall("{call  sp_ret_ticket_install_completed(?,?)}");
        //set the value callable stmt object
        cstmt11.setString(1, V_Store_Id);
        cstmt11.setString(2, Var_Email);
        //execute the callable statement
        cstmt11.execute();
        //close the connection object
        con11.close();

String userId = "7f7a82c6a2464a45b0ea5b7c65c90f38";
String password = "lM_EC#0a7U})SE-.";
String auth_url = "https://lon-identity.open.softlayer.com" + "/v3";
String domain = "1090141";
String project = "object_storage_e32c650b_e512_4e44_aeb8_c49fdf1de69f";
Identifier domainIdent = Identifier.byName(domain);
Identifier projectIdent = Identifier.byName(project);

OSClient os = OSFactory.builderV3()
.endpoint(auth_url)
.credentials(userId, password)
.scopeToProject(projectIdent, domainIdent)
.authenticate();

SwiftAccount account = os.objectStorage().account().get();
ObjectStorageService objectStorage = os.objectStorage();

os.objectStorage().containers().create("Nilu");

}catch(Exception e){
e.printStackTrace();
}


%>

<form action="NewServlet2" method="post"  enctype="multipart/form-data"  >
<center>
<input name="file" id="file" type="file"  />
<input id="btnsubmit" value="Upload"  type="submit" name="btnSubmit" />
</center>
</form>
<script>
window.location.href = "#";
</script>

</body>
</html>
