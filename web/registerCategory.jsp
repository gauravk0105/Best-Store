<%-- 
    Document   : registerCategory
    Created on : 13 Jul, 2017, 9:47:12 PM
    Author     : Dell
--%>

<%@page import="store.AdminManager"%>
<%@page import="store.CategoryManager"%>
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
        String cname = request.getParameter("cname");
        int caid = CategoryManager.getNewId();
        CategoryManager row = new CategoryManager();
        row.setCaid(caid);
        row.setCname(cname);
        row.insertRecord();
        response.sendRedirect("addCategory.jsp");
        }
        catch(Exception e)
        {
            out.print(e.toString());
        }
    %>   
    </body>
</html>
