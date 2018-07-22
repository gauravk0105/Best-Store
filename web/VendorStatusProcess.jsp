<%-- 
    Document   : VendorStatusProcess
    Created on : 14 Jul, 2017, 12:31:14 AM
    Author     : Dell
--%>

<%@page import="store.AdminManager"%>
<%@page import="store.ShopManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if( session.getAttribute("user") == null || session.getAttribute("user") == "c" || session.getAttribute("user") == "v" )
        {
            response.sendRedirect("index.jsp");
            return;
        }
         else
    {
            if(session.getAttribute("user").equals("v"))
            {
                                                                            // vendor profile facility
                 AdminManager row = (AdminManager) session.getAttribute("admin");
                 String name = row.getAdminid();
                 request.setAttribute("name", name);
            }
    }
    %>
    
    
    <%
        try{
        String vid = request.getParameter("id");
        String cs = request.getParameter("cs");
        
//        ShopManager.executeUpdate("update CustomerMaster set cstatus='LOL' where cid='"+cid+"'");
        ShopManager.executeUpdate("UPDATE VendorMaster set vstatus='"+cs+"' WHERE vid='"+vid+"' ");
        response.sendRedirect("VendorStatusChng.jsp");
        }
        catch(Exception e)
        
        {
            out.print(e.toString());
        }
    %>   
    </body>
</html>
