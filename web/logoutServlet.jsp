<%-- 
    Document   : logoutServlet
    Created on : 8 Jul, 2017, 12:17:04 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logoutServlet</title>
    </head>
    <body>
            <%
                if(session.getAttribute("user") != null )
                {
                    // conformation
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                }
                else
                {
                    out.print("Session expired");
                    out.print("<br/><a href='index.jsp'>back</a>");
                }
            %>    
    </body>
</html>
