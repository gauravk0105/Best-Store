<%-- 
    Document   : loginservlet
    Created on : 6 Jul, 2017, 11:49:03 PM
    Author     : Dell
--%>

<%@page import="store.VendorManager"%>
<%@page import="store.AdminManager"%>
<%@page import="store.CustomerManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>loginServlet</title>
    </head>
    <body>
        <%

            String mail = request.getParameter("mail");
            String pwd = request.getParameter("pwd");
            String userlogin = request.getParameter("user");
            try{
            if( userlogin.equals("customer"))
            {
                if(CustomerManager.validate(mail, pwd) == 1)
                {
                    CustomerManager row = new CustomerManager();
                    row.setCid(mail);
                    CustomerManager row2 = row.getRecord();
                    session.setAttribute("user", "c");
                    session.setAttribute("customer",row2);
                    session.setMaxInactiveInterval(600);
                    response.sendRedirect("index.jsp");
                }
                else
                {
                    if(CustomerManager.validate(mail, pwd) == 2)
                    {
//                        response.sendRedirect("registerError.jsp");
                            out.print("Disable");
                    }
                    else
                    {
//                        response.sendRedirect("Error.jsp");
                        out.print("Invalid User");
                    }
                }
            }
            }
            catch(Exception ex)
            {
                out.print("ERROR : "+ex);
                out.print("<br/><a href='login.jsp'>Re-Login</a>");
            }
            
            try{
            if( userlogin.equals("vendor"))
            {
                if(VendorManager.validate(mail, pwd) == 1)
                {
                    VendorManager row = new VendorManager();
                    row.setVid(mail);
                    VendorManager row2 = row.getRecord();
                    session.setAttribute("user", "v");
                    session.setAttribute("vendor",row2);
                    session.setMaxInactiveInterval(600);
                    response.sendRedirect("vendorProfile.jsp");
                }
                else{
                       if(VendorManager.validate(mail, pwd) == 2)
                       {
                           response.sendRedirect("registerError.jsp");
                       }
                       else
                       {
                            response.sendRedirect("Error.jsp");
                        }
                }  
            }
            }
            catch(Exception ex)
            {
                out.print("ERROR : "+ex);
                out.print("<br/><a href='login.jsp'>Re-Login</a>");
            }
            
            try{
            if( userlogin.equals("admin"))
            {
                if(AdminManager.validate(mail, pwd))
                {
                    AdminManager row = new AdminManager();
                    row.setAdminid(mail);
                    AdminManager row2 = row.getRecord();
                    session.setAttribute("user", "a");
                    session.setAttribute("admin",row2);
                    session.setMaxInactiveInterval(600);
                    response.sendRedirect("adminProfile.jsp");   
                }
                else{
                        response.sendRedirect("Error.jsp");
                }
            }
            }
            catch(Exception ex)
            {
                out.print("ERROR : "+ex);
                out.print("<br/><a href='login.jsp'>Re-Login</a>");
            }
        %>    
    </body>
</html>
