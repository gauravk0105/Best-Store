<%-- 
    Document   : OrderProcess
    Created on : 10 Jul, 2017, 11:46:38 PM
    Author     : Dell
--%>

<%@page import="store.ProductManager"%>
<%@page import="store.DateManager"%>
<%@page import="store.CustomerManager"%>
<%@page import="java.util.List"%>
<%@page import="store.OrderManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
                                 // all count i.e quantity in list1 is in String
                                 CustomerManager row = (CustomerManager) session.getAttribute("customer");
                                 List<store.New> list1 = (List<store.New>) session.getAttribute("cartList");
                                 int oid = OrderManager.getNewId();
                                 out.print(oid);
                                 String cid = row.getCid();
                                 String orderdate = DateManager.getYyyymmdd(new java.util.Date());
    
    %>

       
                <table  width="90%" align="center" style="border-width:4px;border-color:#F57f17;border-style: dashed;border-radius:13px " cellpadding="15" cellspacing="15">
                    <thead>
                           <th colspan="5" style="font-family:serif;font-size:25pt">
                              <b> <u> Order InVoice </u></b>
                           </th>    
                    </thead>
                    <tbody>
                            <tr>
                                  <td colspan="2" style="font-family:serif;font-size:20pt">
                                      Order ID : #<%= oid %>
                                  <td>    
                                  <td colspan="3" style="font-family:serif;font-size:20pt" align="right">
                                      Order Date : <%= orderdate %>
                                  </td>    
                            </tr>    
                            <tr>
                                <td colspan="5" style="font-family:serif;font-size:20pt">
                                    Customer ID : <%= cid %>
                                </td>    
                            </tr>
                            <tr>
                <td colspan="5">
                    <table width="100%" cellpadding="5" cellspacing="5" border="3" style="border-collapse: collapse">
                        <TR align="left">
                            <Th width="100px">
                               Product Id 
                            </Th>
                            <Th>
                                Product Name
                            </Th>
                            <Th align="right">
                                Price
                            </Th>
                            <Th align="right">
                                Quantity
                            </Th>
                            <Th align="right">
                                Amount
                            </Th>
                        </TR>
                            
      <% 
                            double toa=0;
                            for(int i=0;i<list1.size();i++)
                            {
                                ProductManager row2  = new ProductManager();
                                row2.setPid(Integer.parseInt(list1.get(i).getPid()));
                                ProductManager row3 = row2.getRecord();
          
      %>    
                                    <tr>
                                          <th align="left"> 
                                              <%= list1.get(i).getPid() %> 
                                           </th>   
                                           <th align="left">
                                               <%= row3.getPname() %>
                                           </th>    
                                           <th align="right">
                                               <%= row3.getPrice() %>
                                           </th>
                                           <th align="right">
                                               <%=  list1.get(i).getCount()  %>
                                           </th>   
                                           <th align="right">
                                               <%= row3.getPrice()*( list1.get(i).getCount() )   %>
                                           </th>
                                    </tr>           
      <%
                                toa = toa+row3.getPrice()*( list1.get(i).getCount());
                            }
      %>    
                        <tr>
                            <th colspan="4">Total Amount</th>
                            <th colspan="3" align="right"><%= toa %></th></tr> 
                         </table>   
                         
                       <tr>
                <th colspan="5">
                    <form method="post" action="Confirm.jsp">
                        <input type="hidden" name="oid" value="<%= oid %>" >
                        <input type="hidden" name="orderdate" value="<%= orderdate %>" >
                        <input type="hidden" name="customerid" value="<%= cid %>" >
                    <span class="lbl">
                        <input type="radio" name="paymode" value="cod" checked > COD
                        <input type="radio" name="paymode" value="net" > Net Banking
                        <input type="radio" name="paymode" value="debit" >Debit Card
                        <br/>
                        <br/>
                        <input style="width:30%;height:50px;font-size:20pt;font-family:serif ;"  type="submit" value="Pay" >
                    </span>
                    </form>
                </th>
                
            </tr> 
                    </tbody>    
                </table>    
                                
       <%
                     
                                }
                             catch(Exception e)
                             {
                                 out.print("Session Expired<br/><a href='loginservlet.jsp'>Re-login Plz</a>");
                             }
      
     %>              
</body>
</html>