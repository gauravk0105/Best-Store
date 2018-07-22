<%-- 
    Document   : registerservlet
    Created on : 6 Jul, 2017, 9:40:19 PM
    Author     : Dell
--%>

<%@page import="store.VendorManager"%>
<%@page import="store.CustomerManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registerServlet</title>
    </head>
    <body>
        <%
             // logout
            String name = request.getParameter("name");
            String contact = request.getParameter("contact");
            String mail = request.getParameter("mail");
            String pwd = request.getParameter("pwd");
            String user = request.getParameter("user");
            try{
            if( user.equals("customer"))
            {
                CustomerManager row = new CustomerManager();
                row.setCname(name);
                row.setCid(mail);
                row.setPwd(pwd);
                row.setCcontact(contact);
                row.setCstatus("ENABLE");
                row.insertRecord();
                session.setAttribute("user", "c");
                session.setAttribute("customer", row);
                session.setMaxInactiveInterval(600);
                // continue box
                response.sendRedirect("index.jsp");
            }
            }catch(Exception ex)
            {
                out.print("ERROR : "+ex);
                out.print("<br/><a href='register.jsp'>Re-Register</a>");
            }
            try{
            if( user.equals("vendor"))
            {
                VendorManager row =  new VendorManager();
                row.setVid(mail);
                row.setVname(name);
                row.setPwd(pwd);
                row.setVstatus("ENABLE");
                row.setVcontact(contact);
                row.insertRecord();
                session.setAttribute("user", "v");
                session.setAttribute("vendor", row);
                session.setMaxInactiveInterval(600);
                response.sendRedirect("vendorProfile.jsp");
            }
            }catch(Exception ex)
            {
                out.print("ERROR : "+ex);
                out.print("<br/><a href='register.jsp'>Re-Register</a>");
            }
        %>    
    </body>
</html>
