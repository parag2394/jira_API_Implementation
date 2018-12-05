<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.icreon.parag.JiraAPI.daoImpl.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Icreon Worklogs</title>
      
 
	<link rel="stylesheet" href="css/footer-distributed-with-search.css">

  
      
      <link rel="stylesheet" href="css/components.css">
      <link rel="stylesheet" href="css/icons.css">
      <link rel="stylesheet" href="css/responsee.css">
      
       <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
      
     
    
<!--     <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" /> -->
   <link rel="Stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />  
   </head>
   <body class="size-1140">
   
 



<header class="header-fixed">

	<div class="header-limiter">

		<h1 style="color:#9e10c1;"><a href="#">ICREON <span>Jira Portal</span></a></h1>
		
	</div>

</header>

<!-- <b>#6b1381</b> -->
<style>
.header-fixed {
	background-color:#6b1381 ;
	box-shadow:0 1px 1px #ccc;
	padding: 20px 40px;
	height: 80px;
	color: #ffffff;
	box-sizing: border-box;
	top:-100px;

	-webkit-transition:top 0.3s;
	transition:top 0.3s;
}

.header-fixed .header-limiter {
	max-width: 1200px;
	text-align: center;
	margin: 0 auto;
}

/*	The header placeholder. It is displayed when the header is fixed to the top of the
	browser window, in order to prevent the content of the page from jumping up. */

.header-fixed-placeholder{
	height: 80px;
	display: none;
}

/* Logo */

.header-fixed .header-limiter h1 {
	float: left;
	font: normal 28px Cookie, Arial, Helvetica, sans-serif;
	line-height: 40px;
	margin: 0;
}

.header-fixed .header-limiter h1 span {
	color: #5383d3;
}

/* The navigation links */

.header-fixed .header-limiter a {
	color: #ffffff;
	text-decoration: none;
}

.header-fixed .header-limiter nav {
	font:16px Arial, Helvetica, sans-serif;
	line-height: 40px;
	float: right;
}

.header-fixed .header-limiter nav a{
	display: inline-block;
	padding: 0 5px;
	text-decoration:none;
	color: #ffffff;
	opacity: 0.9;
}

.header-fixed .header-limiter nav a:hover{
	opacity: 1;
}

.header-fixed .header-limiter nav a.selected {
	color: #608bd2;
	pointer-events: none;
	opacity: 1;
}

/* Fixed version of the header */

body.fixed .header-fixed {
	padding: 10px 40px;
	height: 50px;
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 1;
}

body.fixed .header-fixed-placeholder {
	display: block;
}

body.fixed .header-fixed .header-limiter h1 {
	font-size: 24px;
	line-height: 30px;
}

body.fixed .header-fixed .header-limiter nav {
	line-height: 28px;
	font-size: 13px;
}


/* Making the header responsive */

@media all and (max-width: 600px) {

	.header-fixed {
		padding: 20px 0;
		height: 75px;
	}

	.header-fixed .header-limiter h1 {
		float: none;
		margin: -8px 0 10px;
		text-align: center;
		font-size: 24px;
		line-height: 1;
	}

	.header-fixed .header-limiter nav {
		line-height: 1;
		float:none;
	}

	.header-fixed .header-limiter nav a {
		font-size: 13px;
	}

	body.fixed .header-fixed {
		display: none;
	}

}

/*
	 We are clearing the body's margin and padding, so that the header fits properly.
	 We are also adding a height to demonstrate the scrolling behavior. You can remove
	 these styles.
 */

body {
	margin: 0;
	padding: 0;
	height: 1500px;
}
</style>

<!-- You need this element to prevent the content of the page from jumping up -->
<div class="header-fixed-placeholder"></div>
   
      <div id="all-content" class="with-sticky-footer">
         <!-- TOP NAV WITH LOGO -->
        
         <section>
            <!-- FIRST BLOCK -->
            <div id="first-block">
			
			      <!-- Example DataTables Card-->
      <div class="card mb-3">
      
        <div class="card-header">
        

  
            <table class="table table-bordered" id="ex1" width="100%" cellspacing="0" >
              
             <thead>
                <tr class="warning" >
                  <td ><h6>S.NO</h6></td>
                    <td ><h6>WorkLog ID</h6></td>
                     <td ><h6>Issue No.</h6></td>
                      <td ><h6>Start Date</h6></td>
                       <td ><h6>Description</h6></td>
                        <td ><h6>Author</h6></td>
                         <td ><h6>Time Spent</h6></td>
                      
                </tr>
            </thead>
			
			
			
			<%
			try{
			GetWorklogs gw=new GetWorklogs();
			JSONArray jsonResults=gw.showWorklogs();
			
			int j=0;
			 for(int i=0; i < jsonResults.length();i++){
		        ++j;
// 		        int worklogsCount =(Integer)obj[0];
// 		        int worklogId =(Integer)obj[1];
// 		        String issueNo =String.valueOf(obj[2]) ;
// 		        String startDate =String.valueOf(obj[3]) ;
// 		        String description = String.valueOf(obj[4]) ;
// 		        String author = String.valueOf(obj[5]) ;
// 		        int timeSpentSeconds=(Integer)obj[6];
		        
		        %>
		        
		     <td><%=j%></td>
		     <td><%=jsonResults.getJSONObject(i).getInt("tempoWorklogId")%></td>
		     <td><%=jsonResults.getJSONObject(i).getJSONObject("issue").getString("key").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getString("startDate").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getString("description").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getInt("timeSpentSeconds")/3600%> hrs</td>
		     </tr>
		     <%   
		        }
			}
			catch(Throwable e)
			{
		e.printStackTrace();
			}
	%>
		
           
    	        
            </table>
        
 

        
 </div>
        </div>
			
             
            </div>
         </section>
         
         <footer class="footer-distributed">

			<div class="footer-left">

				

				<p class="footer-company-name">© 2018 COPYRIGHT ICREON</p>

			</div>

			<div class="footer-right">

				<form method="get" action="#">
					<input placeholder="Search our website" name="search" />
					<i class="fa fa-search"></i>
				</form>

			</div>

		</footer>
        
      </div>

	
	
	
	 <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="resources/js/sb-admin-datatables.min.js"></script>
    
	  
 <script type="text/javascript" src="js/responsee.js"></script>

<!--    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> -->
<!--    <script  type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> -->
<!--     <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script> -->
   <script  type="text/javascript">
       $(document).ready(function () {
           $('#ex1').DataTable({
               "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],

               dom: 'Bfrtip',
               buttons: [
                   'excel', 'print'
               ]

           });
       });

   </script>
   
    <script type="text/javascript" src="resources/js/jquery-1.12.4.js"></script>
   <script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="resources/js/dataTables.buttons.min.js"></script>
   <script type="text/javascript" src="resources/js/buttons.flash.min.js"></script>
   <script type="text/javascript" src="resources/js/jszip.min.js"></script>
   <script type="text/javascript" src="resources/js/pdfmake.min.js"></script>
   <script  type="text/javascript" src="resources/js/vfs_fonts.js"></script>
    <script type="text/javascript" src="resources/js/buttons.html5.min.js"></script>
   <script type="text/javascript" src="resources/js/buttons.print.min.js"></script>
   

  
  

   
   </body>
</html>