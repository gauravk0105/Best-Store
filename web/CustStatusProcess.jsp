<%-- 
    Document   : CustStatusProcess
    Created on : 13 Jul, 2017, 11:04:18 PM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="store.CustomerManager"%>
<%@page import="store.ShopManager"%>
<%@page import="store.AdminManager"%>
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
        String cid = request.getParameter("id");
        String cs = request.getParameter("cs");
        
//        ShopManager.executeUpdate("update CustomerMaster set cstatus='LOL' where cid='"+cid+"'");
        ShopManager.executeUpdate("UPDATE CustomerMaster set cstatus='"+cs+"' WHERE cid='"+cid+"' ");
        response.sendRedirect("CustStatusChng.jsp");
        }
        catch(Exception e)
        
        {
            out.print(e.toString());
        }
    %>   
    </body>
</html>
