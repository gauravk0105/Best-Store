<%-- 
    Document   : wishList
    Created on : 12 Jul, 2017, 1:29:17 AM
    Author     : Dell
--%>

<%@page import="store.CustomerManager"%>
<%@page import="store.VendorManager"%>
<%@page import="store.OrderManager"%>
<%@page import="store.ProductManager"%>
<%@page import="store.CategoryManager"%>
<%@page import="store.BrandManager"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BestStore || WishList</title>
    
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
           if( session.getAttribute("user") == null || session.getAttribute("user") == "a" || session.getAttribute("user") == "a" )
                   {
                        out.println("<h2>Session Expired. <a href='login.jsp' >relogin</a></h2>");
                        return;
                   }
 %>
        
    
    <jsp:include flush="true" page="header.jsp" />
    
     <div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">My WishList</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Viewing Product Ordered List</p>
                        
                </div> 
         </div>   
        
        <table border="2" width="95%" align="center">
            <thead>
                <tr height="50px">
                    <th>S.NO</th> 
                    <th>Order ID</th>    
                    <th>Order Date</th>    
                    <!-- This IS Not Been Added Because This Is Not
                    <!--<th>Product ID</th>-->    
                    <th>Product Name</th>
                    <th>Product Category</th>
                    <th>Product Brand</th>
                    <th>Quantity</th>
                    <th>Amount</th>
                    <th>Paymode</th>
                    <th>Status</th>
                    <th>Update</th>
                </tr>    
            </thead>    
            <tbody>
        <%
            try{
            CustomerManager row11 = (CustomerManager) session.getAttribute("customer");
            String cid = row11.getCid();
            List<OrderManager> list = OrderManager.getRecords("SELECT * FROM OrderMaster WHERE cid = '"+cid+"' ORDER BY orderdate desc,oid");
           
                for(int i=0;i<list.size();i++)
                {
                    // caid , bid , pid 
                    ProductManager row2 = new ProductManager();
                    row2.setPid(list.get(i).getPid());
                    ProductManager row3 = row2.getRecord();
                    CategoryManager row4 = new CategoryManager();
                    row4.setCaid(row3.getCaid());
                    CategoryManager row5 = row4.getRecord();
                    BrandManager row6 = new BrandManager();
                    row6.setBid(row3.getBid());
                    BrandManager row10 = row6.getRecord();
        %>
                    <tr height="40px">
                    <td><%=  (i+1) %></td> 
                    <td><%= list.get(i).getOid() %></td>    
                    <td><%= list.get(i).getOrderdate() %></td>    
                    <!-- This IS Not Been Added Because This Is Not
                    <!--<th>Product ID</th>-->    
                    <td><%= row3.getPname() %></td>
                    <td><%= row5.getCname() %></td>
                    <td><%= row10.getBname() %></td>
                    <td><%= list.get(i).getQty() %></td>
                    <td><%= list.get(i).getAtm() %></td>
                    <td><%= list.get(i).getPaymode() %></td>
                    <td><%= list.get(i).getStatus() %></td>
                    <td>
                        <%
                            // only Appear If pending
                            if(list.get(i).getStatus().equals("PENDING") )
                            {
                        %>    
                        <form action="ChngStatus.jsp" method="post">
                            <input hidden="hidden" name="oid" value=" <%= list.get(i).getOid() %>"  />
                            <input hidden="hidden" name="pid" value=" <%= list.get(i).getPid() %>"  />
                            <input hidden="hidden" name="quantity" value=" <%= list.get(i).getQty() %>"  />
                            <input hidden="hidden" name="chngStatus" value="CANCELLED" />
                            <input type="submit" value="Cancelled" />
                        </form>
                            <%
                                }
                             %>   
                    </td>        
                </tr>    
        <%
                 }
                 }
            catch(Exception e){
                out.print(e.toString());
            }
        %>    
        </table>
        
        <div class="register">
		<div class="container">
        <div class="register-home animated wow slideInUp" data-wow-delay=".5s">
            <a href="index.jsp">Home</a>
			</div>
                        
                </div>
        </div>    

    <jsp:include flush="true" page="footer.jsp" />	
</body>
</html>