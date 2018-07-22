<%-- 
    Document   : uploadProductImage
    Created on : 14 Jul, 2017, 9:37:07 PM
    Author     : Dell
--%>

<%@page import="store.FileManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
             String productid=request.getParameter("pid");
            
            String filename=productid+".jpg";
            store.FileManager.upload(application, request, response, "images/Product", new String[]{filename}, 1024*1024*5, null);
            response.sendRedirect("addProduct.jsp");
            }
            catch(Exception e)
            {
                out.print(e.toString());
            }
        %>    
    </body>
</html>
