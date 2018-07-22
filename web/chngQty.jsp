<%-- 
    Document   : chngQty
    Created on : 12 Jul, 2017, 10:34:48 AM
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
          String pid = request.getParameter("pid");
          String selectedQty = request.getParameter("selectedQty");
          List<New> list = (List<New>)session.getAttribute("cartList");
          for(int i=0;i<list.size();i++) 
          {
              if(list.get(i).getPid().equals(pid))
              {
                  list.get(i).setCount(Integer.parseInt(selectedQty));
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
