<%-- 
    Document   : addToCart
    Created on : 10 Jul, 2017, 3:17:30 PM
    Author     : Dell
--%>

<%@page import="store.ProductManager"%>
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
            // All pid are In String Form No Int
            String pid = request.getParameter("pid");
            // form String 
            //response.sendRedirect("SearchResultServlet.jsp"); 
            List<New> list = (List<New>) session.getAttribute("cartList");
            New e = new New();
             e.setPid(pid);
            if( list.size() == 0 || list == null )
            {
                
                list.add(e);
                session.setAttribute("cartList", list);
                session.setMaxInactiveInterval(600);
                response.sendRedirect("SearchResultServlet.jsp");
                return;
            }
            else
            {
                for(int i=0;i<list.size();i++)
                {
                    ProductManager row = new ProductManager();
                    row.setPid(Integer.parseInt(list.get(i).getPid()));
                    ProductManager row2 = row.getRecord();
                    if( list.get(i).getPid().equals(pid))
                    {
                        // found same pid and U have To Increase Count By 1
                          if(list.get(i).getCount() < row2.getQuantity() )   
                                list.get(i).increase();
                          else
                              list.get(i).setCount(row2.getQuantity());
                          session.setAttribute("cartList", list);
                          session.setMaxInactiveInterval(600);
                          response.sendRedirect("SearchResultServlet.jsp"); 
                          return;
                    }    
                }   
                list.add(e);
                session.setAttribute("cartList", list);
                session.setMaxInactiveInterval(600);
                response.sendRedirect("SearchResultServlet.jsp"); 
            }
        %>
    </body>
</html>
