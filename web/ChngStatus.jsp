<%-- 
    Document   : ChngStatus
    Created on : 12 Jul, 2017, 1:04:41 AM
    Author     : Dell
--%>

<%@page import="store.New"%>
<%@page import="java.util.List"%>
<%@page import="store.ShopManager"%>
<%@page import="store.VendorManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
    if( session.getAttribute("user") == null  || session.getAttribute("user") == "a" )
        {
            response.sendRedirect("index.jsp");
            return;
        }
    else
    {
            if(session.getAttribute("user").equals("v"))
            {
                                                                            // vendor profile facility
                 VendorManager row = (VendorManager) session.getAttribute("vendor");
                 String name = row.getVname();
                 request.setAttribute("name", name);
            }
    }
    
    

   %> 
   
        <%
            try{
             // form data
             
             String oid = (request.getParameter("oid"));
             String pid = (request.getParameter("pid"));
             String quantity = request.getParameter("quantity");
             String chngStatus = request.getParameter("chngStatus");
             ShopManager.executeUpdate("UPDATE OrderMaster set status = '"+chngStatus+"' WHERE oid ="+oid+" AND pid="+pid+"");
             if(session.getAttribute("user").equals("v"))
                 response.sendRedirect("ViewProductServlet.jsp");
             else
                if(session.getAttribute("user").equals("c")) 
                {      
                    ShopManager.executeUpdate("UPDATE ProductMaster set quantity = quantity+"+quantity+" WHERE pid = "+pid+"");
                    response.sendRedirect("wishList.jsp");
                }    
            }
            catch(Exception e)
            {
                out.print(e.toString());
            }
        %>    
    </body>
</html>
