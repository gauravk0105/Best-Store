<%-- 
    Document   : ProductDeletecartList
    Created on : 12 Jul, 2017, 2:13:55 AM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="store.New"%>
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
            // As All pid In List is in String  
            List<New> list = (List<New>)session.getAttribute("cartList");
            String pid = request.getParameter("pid");
            for(int i=0;i<list.size();i++)
            {
                if( list.get(i).getPid().equals(pid) )
                {
                    list.remove(list.get(i));
                    session.setAttribute("cartList", list);
                    session.setMaxInactiveInterval(600);
                    response.sendRedirect("cart.jsp");
                    return;
                }
            }
            }
            catch(Exception e)
            {
                out.print(e.toString());
            }
        %>    
        
    </body>
</html>
