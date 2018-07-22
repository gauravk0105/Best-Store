<%-- 
    Document   : index
    Created on : 6 Jul, 2017, 2:47:14 PM
    Author     : Dell
--%>
<%@page import="store.New"%>
<%@page import="store.ProductManager"%>
<%@page import="store.CategoryManager"%>
<%@page import="store.BrandManager"%>
<%@page import="java.util.*"%>
<%@page import="store.VendorManager"%>
<%@page import="store.CustomerManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            $(document).ready(function()            
            {
                $("img").mouseover(function()
                                    {
                                        $(this).fadeTo(500,0.7);
                                    });
                                    
                $("img").mouseout(function()
                                    {
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
        List<New> list1 = new ArrayList<>();
        session.setAttribute("cartList", list1);
        session.setMaxInactiveInterval(6000);
    %>    
    
    <jsp:include flush="true" page="header.jsp" />
    
    
    
   
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
                                   out.print("<option  value='"+list.get(i)+"'>"+list.get(i)+"</option>");
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
    <section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1" class="inactive"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>Best</span>-Store</h1>
									<h2>Shop AnyWhere</h2>
									<p>A Place Where Imagination Meet At Reasonable Cost. </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="images/slider/1.jpg" class="girl img-responsive" alt="" />
									<img src="images/slider/price.png"  class="pricing" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Best</span>-Store</h1>
									<h2>Shop AnyWhere</h2>
									<p>A Place Where Imagination Meet At Reasonable Cost. </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="images/slider/2.jpg" class="girl img-responsive" alt="" />
									<img src="images/slider/price.png"  class="pricing" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Best</span>-Store</h1>
									<h2>Shop AnyWhere</h2>
									<p>A Place Where Imagination Meet At Reasonable Cost. </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
                                                                        <!-- 484*481 -->
									<img src="images/slider/3.jpg" class="girl img-responsive" alt="" />
									<img src="images/slider/price.png" class="pricing" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->

				

		

    
    
    
<!--	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian">category-productsr
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Sportswear
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">Nike </a></li>
											<li><a href="#">Under Armour </a></li>
											<li><a href="#">Adidas </a></li>
											<li><a href="#">Puma</a></li>
											<li><a href="#">ASICS </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Mens
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">Fendi</a></li>
											<li><a href="#">Guess</a></li>
											<li><a href="#">Valentino</a></li>
											<li><a href="#">Dior</a></li>
											<li><a href="#">Versace</a></li>
											<li><a href="#">Armani</a></li>
											<li><a href="#">Prada</a></li>
											<li><a href="#">Dolce and Gabbana</a></li>
											<li><a href="#">Chanel</a></li>
											<li><a href="#">Gucci</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Womens
										</a>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">Fendi</a></li>
											<li><a href="#">Guess</a></li>
											<li><a href="#">Valentino</a></li>
											<li><a href="#">Dior</a></li>
											<li><a href="#">Versace</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Kids</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Fashion</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Households</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Interiors</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Clothing</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Bags</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Shoes</a></h4>
								</div>
							</div>
						</div>/category-products
					
						<div class="brands_products">brands_products
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>Acne</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>Grüne Erde</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>Albiro</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>Ronhill</a></li>
									<li><a href="#"> <span class="pull-right">(5)</span>Oddmolly</a></li>
									<li><a href="#"> <span class="pull-right">(9)</span>Boudestijn</a></li>
									<li><a href="#"> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
								</ul>
							</div>
						</div>/brands_products
						
				</div>
				</div>
				</div>
				</div>
				</section>-->
				
				
			
        <jsp:include flush="true" page="footer.jsp" />	
	
	
	
    </body>	
    
</html>