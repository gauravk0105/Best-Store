<%-- 
    Document   : Confirm
    Created on : 11 Jul, 2017, 12:19:31 PM
    Author     : Dell
--%>

<%@page import="store.ShopManager"%>
<%@page import="store.CustomerManager"%>
<%@page import="store.ProductManager"%>
<%@page import="java.util.List"%>
<%@page import="store.New"%>
<%@page import="store.OrderManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conformation Page</title>
    </head>
    <body>
       <%
           if( session.getAttribute("user") == null || session.getAttribute("user") == "a" || session.getAttribute("user") == "a" )
                   {
                        out.println("<h2>Session Expired. <a href='login.jsp' >relogin</a></h2>");
                        return;
                   }
 %>
        
        <%
            try{
            String oid = request.getParameter("oid");
            CustomerManager row10 = (CustomerManager) session.getAttribute("customer");
            String cid = row10.getCid();
            String orderdate = request.getParameter("orderdate");
            String paymode = request.getParameter("paymode");
            List<New> list2 = (List<New>)session.getAttribute("cartList");
            
            
            
            for(int i=0;i<list2.size();i++)
            {
                ProductManager row2  = new ProductManager();
                row2.setPid(Integer.parseInt(list2.get(i).getPid()));
                ProductManager row3 = row2.getRecord();
                OrderManager row = new OrderManager();
                row.setStatus("PENDING");
                row.setOid(Integer.parseInt(oid));
                row.setCid(cid);
                row.setOrderdate(orderdate);
                row.setTax(0);
                row.setAtm( row3.getPrice()*( list2.get(i).getCount())   );
                row.setPaymode(paymode);
                row.setQty(list2.get(i).getCount());
                row.setPid(Integer.parseInt((list2.get(i).getPid())));
                row.insertRecord();
                ShopManager.executeUpdate("UPDATE ProductMaster set quantity = quantity-"+list2.get(i).getCount()+" WHERE pid = "+Integer.parseInt(list2.get(i).getPid())+" ");
            }
            out.print("<h2>Order Successfull</h2>");
            out.print("<br/><a href='index.jsp'>HOME</a> ");
            }
            catch(Exception e)
            {
                out.print(e.toString());
            }  
        %>  
    </body>
</html>
