<%-- 
    Document   : registerProduct
    Created on : 11 Jul, 2017, 4:20:34 PM
    Author     : Dell
--%>

<%@page import="store.FileManager"%>
<%@page import="store.ProductManager"%>
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
            // So That Any One Cannot Directly OPen It
             if( session.getAttribute("user") == null || session.getAttribute("user") == "c" || session.getAttribute("user") == "a" )
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
            // ALl Comming From  ' Forum'
            String pname = request.getParameter("pname");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));
            String model = request.getParameter("model");
            int bid = Integer.parseInt(request.getParameter("bid"));
            int caid = Integer.parseInt(request.getParameter("caid"));
            // Vendor ID From Session
                
            VendorManager row = (VendorManager) session.getAttribute("vendor");
            String vid = row.getVid();
            
            // assumption
            
            int pid = ProductManager.getNewId();

//            String pid2 = Integer.toString(pid);
//            String filename=pid2+".jpg";
//            
//            FileManager.upload(application, request, response, "images/Product", new String[]{filename}, 1024*1024*5, null);
            
            
            ProductManager row2 = new ProductManager();
            row2.setBid(bid);
            row2.setCaid(caid);
            row2.setModel(model);
            row2.setPid(pid);
            row2.setPname(pname);
            row2.setPrice(price);
            row2.setQuantity(quantity);
            row2.setVid(vid);
            row2.insertRecord();
            
            response.sendRedirect("addProduct.jsp");
            
//            out.print("<h2>New Product IS Added</h2><br/><a href='vendorProfile.jsp'>Go TO Profile</a> ");
            }
            catch(Exception e)
            {
                out.print(e.toString());
            }
            
            
        %>    
    </body>
</html>
