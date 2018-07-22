<%-- 
    Document   : registerBrand
    Created on : 13 Jul, 2017, 9:19:06 PM
    Author     : Dell
--%>

<%@page import="store.BrandManager"%>
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
                 AdminManager row = (AdminManager) session.getAttribute("vendor");
                 String name = row.getAdminid();
                 request.setAttribute("name", name);
            }
    }
    %>      
    
    
    <%
        try{
        String bname = request.getParameter("bname");
        int bid = BrandManager.getNewId();
        BrandManager row = new BrandManager();
        row.setBid(bid);
        row.setBname(bname);
        row.insertRecord();
        response.sendRedirect("addBrand.jsp");
        }
        catch(Exception e)
        {
            out.print(e.toString());
        }
    %>   
    </body>
</html>
