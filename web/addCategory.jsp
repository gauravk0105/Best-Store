<%-- 
    Document   : addCategory
    Created on : 13 Jul, 2017, 9:46:57 PM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="store.CategoryManager"%>
<%@page import="store.AdminManager"%>
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
        if( session.getAttribute("user") == null || session.getAttribute("user") == "c" || session.getAttribute("user") == "v" )
        {
            response.sendRedirect("index.jsp");
            return;
        }
         else
    {
            if(session.getAttribute("user").equals("v"))
            {
                                                                            // vendor profile facility
                 AdminManager row = (AdminManager) session.getAttribute("vendor");
                 String name = row.getAdminid();
                 request.setAttribute("name", name);
            }
    }
    %>
    
        <jsp:include flush="true"  page="header.jsp"/>
    
        <div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Administrative  Profile</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Add New Category</p>
                        
                        <div class="login-form-grids">
			
<!---728x90--->
				<h6 class="animated wow slideInUp" data-wow-delay=".5s">Category Information</h6>
                                <form class="animated wow slideInUp" data-wow-delay=".5s" action="registerCategory.jsp" method="post">
					<input id="icon1" name="cname" type="text" placeholder="Category Name..." required=" " >
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
                        
                        <br/>
                        
                        <h3 class="animated wow zoomIn" data-wow-delay=".5s">Categorys List</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">View All Category</p>
                        
                        <div class="login-form-grids">
			
<!---728x90--->
				<h6 class="animated wow slideInUp" data-wow-delay=".5s">Best Store Register Category</h6>
				<table class="animated wow slideInUp" align="center" width="90%" data-wow-delay=".5s" border="1" >
                                        <thead>
                                            <th>S.No</th>
                                            <th>Category ID</th>
                                            <th>Category Name</th>
                                        </thead>    
                                        <tbody>
                                            <%
                                                try{
                                                List<CategoryManager> list = CategoryManager.getRecords("SELECT * FROM CategoryMaster ORDER BY caid");
                                                if( list == null || list.size() == 0 )
                                                {
                                                   out.print("<td colspan='3' style='color:green'>NO Category Register Yet</td>"); 
                                                }
                                                else{
                                                for(int i=0;i<list.size();i++)    
                                                {
                                             %>   
                                                <tr>
                                                    <td><%= (i+1) %></td>
                                                    <td><%= list.get(i).getCaid() %></td>
                                                    <td><%= list.get(i).getCname() %></td>
                                                 </tr> 
                                               <%
                                                    }
                                                    }           
                                                    }
                                                    catch(Exception e){ out.print(e.toString());}
                                                %>   
                                        </tbody>    
                                </table>    
			</div>
			<div class="register-home animated wow slideInUp" data-wow-delay=".5s">
                            <a href="adminProfile.jsp">Home</a>
			</div>
                        
                </div>
        </div>    
                                        
                                        <jsp:include flush="true" page="footer.jsp" />	
</body>
</html>
