<%-- 
    Document   : SearchResultServlet
    Created on : 10 Jul, 2017, 12:26:38 AM
    Author     : Dell
--%>
<%@page import="store.BrandManager"%>
<%@page import="store.CategoryManager"%>
<%@page import="java.util.*" %>
<%@page import="store.ProductManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BestStore || Home</title>
    
    <script src="qry/JQR.js"></script>
    <script>
        var sel = jQuery.noConflict();
        sel(document).ready(function(){
                                            sel("img").mouseover(function(){
                                                                                $(this).fadeTo(500,0.7);
                                                                           });
                                            sel("img").mouseout(function(){
                                                                                $(this).fadeTo(500,1);
                                                                           });
                                      });
    </script>
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
//                    if(session.getAttribute("search") == null )
//                            {
//                                response.sendRedirect("index.jsp");
//                                return;
//                            } 
     %>   
    
    
    <jsp:include flush="true" page="header.jsp" />
   <br/><br/><br/>
    <form action="SearchResultServlet.jsp">
        <table border="2" style="border-color:#daa520"   width="85%" align="center">
            <tr>
                <th width="18%">
                    <center>Brand Name:</center>
                    <select name="brand">
                        <option value="all">All</option>
                         <%
                            try{
                                List<BrandManager> list = BrandManager.getRecords("SELECT * FROM BrandMaster ORDER BY bname");
                                for(int i=0;i<list.size();i++)
                                {
                                    out.print("<option value='"+list.get(i).getBid()+"'>"+list.get(i).getBname()+"</option>");
                                 }   
                            }
                            catch(Exception ex)
                            {
                            }
                        %>    
                    </select>   
                </th>   
                 <th width="18%"> 
                     <center>Category Name:</center>
                        <select name="category">
                        <option value="all">All</option>
                        <%
                            try{
                                List<CategoryManager> list = CategoryManager.getRecords("SELECT * FROM CategoryMaster ORDER BY cname");
                                for(int i=0;i<list.size();i++)
                                {
                                    out.print("<option value='"+list.get(i).getCaid()+"'>"+list.get(i).getCname()+"</option>");
                                }
                            }
                            catch(Exception e)
                            {
                            }
                                    
                            
                        %>
                        </select>
                 </th>  
                <th width="18%">   
                        <center>Product Name:</center>
                        <select name="product">
                        <option value="all">All</option>
                           <%
                               try{
                               List<String> list = ProductManager.getColumnData("pname");
                               for(int i=0;i<list.size();i++)
                               {
                                   out.print("<option value="+list.get(i)+">"+list.get(i)+"</option>");
                               }
                               }catch(Exception e){}
                           %>   
                        </select>
                 </th>  
                 <th width="18%">   
                        <center>Price Under:</center>
                        <select name="price">
                        <option value="all">All</option>
                        <option value="5000">5000</option>
                        <option value="10000">10000</option>
                        <option value="20000">20000</option>
                        <option value="25000">25000</option>
                        <option value="30000">30000</option>
                        <option value="50000">50000</option>
                        </select>
                 </th>  
                 <th width="1%">
                     <input type="submit"  value="search" />
                 </th>
             </tr>   
        </table>    
    </form>     
      
    <br/>
    <br/>
    <br/><br/><br/><br/>
    
                        
    <section>
		<div class="container">
			<div class="row">
				<!--<div class="col-sm-3">-->
					<!--<div class="left-sidebar">-->
                                         <div class="col-sm-15 padding-right">
				<div class="features_items"><!--features_items-->
					<h2 class="title text-center">Features Items</h2>   
                                        <!-- Main Code
     
                     <%
                            
            String brand = request.getParameter("brand");
            String category = request.getParameter("category");
            String product = request.getParameter("product");
            String price = request.getParameter("price");
            String qry = "";
            // Before this all  values we get Form is Of String Type
            
            // Best Logic
            if( brand == null && category == null && product == null && price == null  )
            { 
                 String[] a = (String[])session.getAttribute("search");
                 brand = a[0];
                 category = a[1];
                 product = a[2];
                 price = a[3];
                //qry  = "SELECT * FROM ProductMaster WHERE 1=1 ";
            }           

            
             qry = "SELECT * FROM ProductMaster WHERE 1=1 ";
            
            
            if(!brand.equals("all") && brand != null)
            {
                int bid = Integer.parseInt(brand);
                qry = qry+"and bid = "+bid+" ";
            }
            if(!category.equals("all") && category != null)
            {
                int caid = Integer.parseInt(category);
                qry = qry+"and caid = "+caid+" ";
            }
            if(!product.equals("all") && product != null)
            {
                qry = qry+"and pname='"+product+"' ";
            }
            if(!price.equals("all") && price != null)
            {
                float pric = Float.parseFloat(price);
                qry = qry+"and price < "+pric+" ";
            }


            
            String[] search = {brand,category,product,price};
            session.setAttribute("search", search);
            session.setMaxInactiveInterval(600);
            out.print(qry+"<br/>");
            
            try{
                    List<ProductManager> list = ProductManager.getRecords(qry);
                    
                    for(int i=0;i<list.size();i++)
                    {
            %>     
                     <br/><br/>            
                   <!-- // Main Code --> 
                   <form action="addToCart.jsp">                 
                                    <table  align="center" style="border-color:#ffb74d;border-style:solid;border-width:3px;border-radius:5px"  width="40%"  border="1" cellspacing="5" cellpadding="5">
                                        
                                        
                                        <tbody height="400">
                                            <tr height="40px">
                                                <th width="35%" text-align="center"  rowspan="4"><img width="100%" height="40%"  src="images/Product/<%= list.get(i).getPid() %>.jpg" alt="Not Found" /></th>
                                                <th text-align="center"><center>Product Name</center></th>
                                                <th align="center"><center><%= list.get(i).getPname() %></center></th>
                                            </tr>
                                            <tr height="40px">
                                                <th align="center"><center> Price</center></th>
                                                <th align="center"><center><%= list.get(i).getPrice() %></center></th>
                                            </tr>
                                            <tr height="40px">
                                                <th align="center"><center> Model</center></td>
                                                <th align="center"><center><%= list.get(i).getModel() %></center></th>
                                            </tr>
                                            <tr height="40px">
                                                <%
                                                    if(list.get(i).getQuantity() > 0 )
                                                    {
                                                %>    
                                                    <th align="center" colspan="2"><center><input type="checkbox" hidden="hidden" name="pid" checked="checked" value="<%= list.get(i).getPid() %>" > &nbsp;&nbsp;&nbsp;<input type="submit" value="Add To Cart" ></center></th>
                                                <%
                                                    }
                                                    else
                                                        {
                                                %>   
                                                    <th align="center" style="color:red" colspan="2"><center>Not In Stock Currently</center></th>
                                                 <% 
                                                     }
                                                 %>       
                                        </tr>
                                        </tbody>
                                    </table> 
                                </form>       
                   <%
			}
                }
                catch(Exception e) { out.print(e.toString()); }
                    
              %>         
                </div><!--features_items-->
                </div>
			<div>
			</div>
                    </section>  
           
                                     <br/><br/>   
            <jsp:include flush="true" page="footer.jsp" />	                             
                                        
</body>
</html>