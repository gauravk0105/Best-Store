<%-- 
    Document   : cart
    Created on : 10 Jul, 2017, 4:24:31 PM
    Author     : Dell
--%>
<%@page import="store.ProductManager"%>
<%@page import="store.New"%>
<%@page  import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BestStore || Cart</title>
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
    <jsp:include flush="true"  page="header.jsp"/>
    <br/>
    <br/>

    <section>
		<div class="container">
			<div class="row">
				<!--<div class="col-sm-3">-->
					<!--<div class="left-sidebar">-->
                                         <div class="col-sm-15 padding-right">
				<div class="features_items"><!--features_items-->
					<h2 class="title text-center">Features Items</h2> 
                        
    
        <%
            if(session.getAttribute("cartList") == null )
            {
                     out.print("<div class='features_items'><h2 class='title text-center'>Session Expired<br/></h2></div>");
                     return;
            }
             List<New> list = (List<New>)session.getAttribute("cartList");
             if( list.size() == 0 || list == null )
             {
                 out.print("<div class='features_items'><h2 class='title text-center'>No Product Added Empty Cart<br/></h2></div>");
             }
            else
             {
                 
         %>
         
                            <table width="87%" border="1" align="center">
                                <thead>
                                        <th width="50%" colspan="2"><center>Product</center></th>
                                        <th width="20%"><center>Price</center></th>
                                        <th width="20%"><center>Quantity</center></th>
                                        <th width="20%"><center>Delete</center></th>    
                                </thead>
                                <tbody>
         <%
                 for(int i=0;i<list.size();i++)
                 {
                       ProductManager row = new ProductManager();
                       row.setPid(Integer.parseInt(list.get(i).getPid()));
                       ProductManager row2 = row.getRecord();
                       
                        session.setAttribute("cartList", list);
                        session.setMaxInactiveInterval(600);
//                     out.print("<br/>Product pid = "+list.get(i).getPid());
//                     out.print("<br/>Quantity "+list.get(i).getCount()+"<br/>");           
        %>   
                                    <tr>
                                        <th width="17%"><center><img width="100%" height="100%" src="images/Product/<%= list.get(i).getPid() %>.jpg" alt="Not Found"/></center></th>
                                        <th width="28%"><center>Product Name : <%= row2.getPname() %><br/>Product ID : <%= list.get(i).getPid() %><br/>Product Model : <%= row2.getModel() %></center></th>
                                        <th width="25%"><%= row2.getPrice()%></th>
                                       <!-- <th width="25%"><%= list.get(i).getCount()%></th> -->
                                        <th width="25%">
                                                        <form method="post" action="chngQty.jsp">
                                                            <center><input type="number" min="1" size="10" name="selectedQty" max="<%= row2.getQuantity() %>" value="<%= list.get(i).getCount()%>" />
                                                         <input hidden="hidden" name="pid" value="<%= list.get(i).getPid() %>" />
                                                        <input type="submit" value="Change" /></center>
                                                        </form>
                                        </th>    
                                        <th width="25%">
                                            <form action="ProductDeletecartList.jsp">
                                                <input hidden="hidden" value="<%= list.get(i).getPid()%>" name="pid" />
                                                <input type="Submit" value="Remove">
                                            </form>    
                                        </th>
                                        <th> 
                                    </tr>       
        <%
                  }
              }
              // again added So That Further Updation Will Directly Reflect In It
              session.setAttribute("cartList", list);
              session.setMaxInactiveInterval(600);
        %>    
        
                            <tr height="60px">   
                                <%
                                    if(list.size() > 0 )
                                    {
                                %>    
                              <form method="post" action="OrderProcess.jsp">  <th colspan="5"><center><input style="width:30%;height:50px;font-size:20pt;font-family:serif ;" type="submit" value="Purchase" /></center></th></form>  
                                <%
                                    }
                                %>    
                          </tr>    
                
                </tbody>
                            </table>
                               
                              
        </div><!--features_items-->
        </div>
        <div>
	</div>

        </section>  
    
                                         <br/><br/>   
            <jsp:include flush="true" page="footer.jsp" />	                             
    
</body>
</html>