
<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="store.AdminManager"%>
<%@page import="store.VendorManager"%>
<%@page import="store.CustomerManager"%>
<!-- header -- >
<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i>9571548105</a></li>
								<li><a href="mailto:khandelwal.gaurav65@gmai.com"><i class="fa fa-envelope"></i>&nbsp;khandelwal.gaurav65@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--/header_top-->
		
		
		<div class="header-middle">
		<div class="container">
		<div class="row">
						<div class="col-sm-4">
						<div class="logo pull-left">
							<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
                                        <%
                                            if( session.getAttribute("user") == null )
                                                out.print("<h1><a href='index.jsp'>Best Store <span>Shop anywhere</span></a></h1>");
                                            else
                                            {
                                                if(session.getAttribute("user").equals("v"))
                                                                        {
                                                                            // vendor profile facility
                                                                            out.print("<h1><a href='#'>Best Store <span>Shop anywhere</span></a></h1>"); 
                                                                        }
                                                                    
                                                                        if( session.getAttribute("user").equals("c") )
                                                                        {
                                                                            // customer profile facility
                                                                            out.print("<h1><a href='index.jsp'>Best Store <span>Shop anywhere</span></a></h1>"); 
                                                                        }
                                                                        
                                                                        if( session.getAttribute("user").equals("a") )
                                                                        {
                                                                            // customer profile facility
                                                                           // AdminManager row = (AdminManager) session.getAttribute("admin");
                                                                            out.print("<h1><a href='#'>Best Store <span>Shop anywhere</span></a></h1>"); 
                                                                           
                                                                        }
                                            }
                                         %>       
                                                </div>
                                                        </div>
						</div>
						</div>
		<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
                                                                <% 
                                                                    try{
                                                                    if(session.getAttribute("user") == null )
                                                                    {    
                                                                        out.print("<li><a href='cart.jsp'><i class='fa fa-shopping-cart'></i>Cart</a></li>");                                                                        
                                                                    }
                                                                    else
                                                                        if(session.getAttribute("user").equals("c"))
                                                                    {    
                                                                        out.print("<li><a href='cart.jsp'><i class='fa fa-shopping-cart'></i>Cart</a></li>");
                                                                        out.print("<li><a href='wishList.jsp'><i class='fa fa-star'></i>Wishlist</a></li>");
                                                                    }
                                                                    }
                                                                    catch(Exception ex)
                                                                    {
                                                                        out.print(ex.toString());
                                                                    }
								%>
                                                                <li><a href="mail.jsp"><i class="fa fa-envelope"></i>Mail</a></li>       
								<li><a href="register.jsp"><i class="fa fa-book"></i>Register</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                                               <%
                                                                    
                                                                    if(session.getAttribute("user") == null )
                                                                    {    
                                                                        out.print("<li><a href='#'><i class='fa fa-user-md'></i>Hello User</a></li>");  
                                                                    }
                                                                    else
                                                                    {
                                                                        if(session.getAttribute("user").equals("v"))
                                                                        {
                                                                            // vendor profile facility
                                                                            VendorManager row = (VendorManager) session.getAttribute("vendor");
                                                                            out.print("<li><a href='#'><i class='fa fa-user-md'></i>Hello "+row.getVname()+"</a></li>");
                                                                            out.print("<li><a href='logoutServlet.jsp'><i class='fa fa-lock'></i>Logout</a></li>");
                                                                        }
                                                                    
                                                                        if( session.getAttribute("user").equals("c") )
                                                                        {
                                                                            // customer profile facility
                                                                            CustomerManager row = (CustomerManager) session.getAttribute("customer");
                                                                            out.print("<li><a href='#'><i class='fa fa-user-md'></i>Hello " +row.getCname()+"</a></li>");
                                                                            out.print("<li><a href='logoutServlet.jsp'><i class='fa fa-lock'></i>Logout</a></li>");
                                                                        }
                                                                        
                                                                        if( session.getAttribute("user").equals("a") )
                                                                        {
                                                                            // customer profile facility
                                                                           // AdminManager row = (AdminManager) session.getAttribute("admin");
                                                                            out.print("<li><a href='#'><i class='fa fa-user-md'></i>Hello Admin</a></li>");
                                                                            out.print("<li><a href='logoutServlet.jsp'><i class='fa fa-lock'></i>Logout</a></li>");
                                                                        }
                                                                    }
                                                                        

                                                                %>      
							</ul>
						</div>
					</div>
				</div>
			</div>
			</div>
				
		
                                <!--             <div class="header-bottom"><!--header-bottom-->
		<!--	<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">Products</a></li>
										<li><a href="product-details.html">Product Details</a></li> 
										<li><a href="checkout.jsp">Checkout</a></li> 
										<li><a href="cart.jsp">Cart</a></li> 
										<li><a href="login.jsp">Login</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.html">Blog List</a></li>
										<li><a href="blog-single.html">Blog Single</a></li>
                                    </ul>
                                </li> 
								<li><a href="404.html">404</a></li>
								<li><a href="contact-us.html">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div> --><!--/header-bottom-->           
                                                        
                                                        
                                                        
	</header><!--/header-->	