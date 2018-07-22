<%-- 
    Document   : addProduct
    Created on : 11 Jul, 2017, 3:47:41 PM
    Author     : Dell
--%>

<%@page import="store.ProductManager"%>
<%@page import="store.CategoryManager"%>
<%@page import="java.util.List"%>
<%@page import="store.BrandManager"%>
<%@page import="store.VendorManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BestStore || Vendor Profile || </title>
    <link href="css/boot.css" rel="stylesheet">
    <link href="css/font.css" rel="stylesheet">
    <link href="css/pretty.css" rel="stylesheet">
    <link href="css/price.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    
	<link href="css/c1.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/c2.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="qry/qr1.js"></script>
<!-- //js -->
<!-- cart -->
<script src="qry/qr2.js"></script>
<!-- cart -->
<link rel="stylesheet" type="text/css" href="css/c5.css">
<!-- for bootstrap working -->
<script type="text/javascript" src="qry/qr3.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- timer -->
<link rel="stylesheet" href="css/c3.css" />
<!-- //timer -->
<!-- animation-effect -->
<link href="css/c4.css" rel="stylesheet"> 
<script src="qry/qr4.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	#icon3
	{
		background-image:url(images/icon/email.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	
	}
	
	#icon2
	{
		background-image:url(images/icon/contact.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}
		
	#icon1
	{
		background-image:url(images/icon/user.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}	
	
	#icon4
	{
		background-image:url(images/icon/key.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}
	
	#icon5
	{
		background-image:url(images/icon/check.png);
		background-repeat:no-repeat;
		background-position:2px 3px;
	}
	
	.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 40%;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.lol {
    padding: 2px 16px;
}
	
</style>
	
	<script src="qry/jquery.js"></script>
	<script src="qry/boot.js"></script>
	<script src="qry/min.js"></script>
	<script src="qry/price.js"></script>
    <script src="qry/pretty.js"></script>
    <script src="qry/main.js"></script>
</head><!--/head-->

<body>
    <%
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
        <jsp:include flush="true"  page="header.jsp"/>
    
        <div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Vendor Profile</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Add New Product</p>
                        
                        <div class="login-form-grids">
			
<!---728x90--->
				<h6 class="animated wow slideInUp" data-wow-delay=".5s">Product Information</h6>
                                <form class="animated wow slideInUp" data-wow-delay=".5s" action="registerProduct.jsp" method="post">
					<input id="icon1" name="pname" type="text" placeholder="Product Name..." required=" " >
					<input id="icon5"  name="model" type="text" placeholder="Model..." required=" " ><br/>
                                        <input id="icon3" name="price" type="text" placeholder="Price...." required=" " >
                                        <h6>Quantity</h6> <select name="quantity">
                                      <%
                                          for(int i=1;i<=50;i++)
                                          {
                                      %> 
                                            <option value="<%= i %>"><%= i %></option>
                                       <%   
                                           } 
                                       %>   
                                        </select>
                                        <h6>Select-Brand</h6> <select name="bid">
                                      <%
                                          try{
                                            List<BrandManager> list = BrandManager.getRecords("SELECT * FROM BrandMaster ORDER BY bname");
                                            for(int i=0;i<list.size();i++)
                                          {
                                      %> 
                                            <option value="<%= list.get(i).getBid() %>"><%= list.get(i).getBname() %></option>
                                       <%   
                                           } 
                                        }catch(Exception e){
                                                            }         
                                       %>   
                                        </select> 
                                        <h6>Select-Category</h6> <select name="caid">
                                      <%
                                          try{ 
                                            List<CategoryManager> list = CategoryManager.getRecords("SELECT * FROM CategoryMaster ORDER BY cname");
                                             for(int i=0;i<list.size();i++)
                                          {
                                      %> 
                                            <option value="<%= list.get(i).getCaid() %>"><%= list.get(i).getCname() %></option>
                                       <%   
                                           } 
                                        }catch(Exception e){
                                                            }         
                                       %>   
                                        </select> 
                                        <!-- value of this is product id which is generated Dynamically as Product Registers -->
                                        
                                        <br/>
					<div class="register-check-box">
						<div class="check">
							<h3 align="center"></h3>
					<br/>

					
						</div>
					</div>
					<input type="submit" value="Add New">
				</form>
                        </div>
                        
                            
               </div>
                                        </div>
        
                                        
             <div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Viewing Product List</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Add Upto Yet</p>                           
               
                        <br/><br/>
                                        
                    <table width="90%" border="1" align="center" class="animated wow slideInUp" data-wow-delay=".5s" >                        
                      <thead> 
                            <tr>
                                <th>S.No</th>
                                <th>Product Name</th>
                                <th>Product Model</th>
                                <th>Product Category</th>
                                <th>Product Brand</th>
                                <th>Product Price</th>
                                <th >Product Quantity</th>
                                <th>Update</th>
                            </tr>    
                      </thead>    
                      <tbody>
                          <%
                              try{
                                VendorManager row = (VendorManager) session.getAttribute("vendor");
                                String vid = row.getVid();
                                List<ProductManager> prolist = ProductManager.getRecords("SELECT * FROM ProductMaster WHERE vid='"+vid+"' ORDER BY pid,pname");
                                if(prolist == null || prolist.size() == 0 )
                                {
                                    out.print("<tr><td colspan='8' style='color:green;text-align:center'>No Product Added Yet</td><//tr>");
                                }
                                else{
                                        for(int i=0;i<prolist.size();i++)
                                        {
                                            BrandManager bm = new BrandManager();
                                            bm.setBid(prolist.get(i).getBid());
                                            BrandManager bm1 = bm.getRecord();
                                            CategoryManager cm = new CategoryManager();
                                            cm.setCaid(prolist.get(i).getCaid());
                                            CategoryManager cm1 = cm.getRecord();
                          %>    
                          <tr>
                              <td><%= i+1 %></td>
                              <td><%= prolist.get(i).getPname() %></td>
                              <td><%= prolist.get(i).getModel() %></td>
                              <td><%= cm1.getCname()%></td>
                              <td><%=bm1.getBname()%></td>
                              <td><%= prolist.get(i).getPrice() %></td>
                              <td><%= prolist.get(i).getQuantity() %></td>
                              <td><img src='images/Product/<%= prolist.get(i).getPid()+".jpg" %>' width='100' height="125" >
                                  
                                  <form method="POST" action="uploadProductImage.jsp?pid=<%=prolist.get(i).getPid()%>" enctype="multipart/form-data" >
                                      
                        <input type='file' name='upload' accept="image/*" >
                        <input type='submit' value='Upload' >
                    </form>
                              </td>
                          </tr>
                          <%
                                        }
                                    }
                                }catch(Exception e){ out.print(e.toString());}        
                          %>   
                     </tbody>
                    </table> 
                                        

                     
                      <div class="register">
		<div class="container">
                     
                     <div class="register-home animated wow slideInUp" data-wow-delay=".5s">
            <a href="vendorProfile.jsp">Home</a>
			</div>
                  </div></div>   
                                        <jsp:include flush="true" page="footer.jsp" />	
</body>
</html>