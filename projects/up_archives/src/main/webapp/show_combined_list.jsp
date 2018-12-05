<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>
<%@ page import=" com.up_archives.lol.model.*" %>
<%@ page import=" com.up_archives.util.*" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.up_archives.department.model.*" %>
<%@ page import="com.up_archives.subDepartment.model.*" %>
<%@ page import =" org.hibernate.Query"%>
<%@ page import=" org.hibernate.Session" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import=" org.hibernate.Transaction" %>
<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.service.ServiceRegistry" %>
<%@ page import=" org.hibernate.service.ServiceRegistryBuilder" %>
<%@ page import=" org.springframework.stereotype.Controller" %>
<%@ page import=" org.springframework.web.bind.annotation.RequestMapping" %>
<%@ page import=" org.springframework.web.servlet.ModelAndView" %>
<%@ page import="com.up_archives.menu.model.*" %>
<%@ page import="com.up_archives.menu.daoImpl.*" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
  <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>List of Lists</title>
  <!-- Bootstrap core CSS-->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval};url=user_login">
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
  
  
  
  
  
  <style>
   .bg-dark {
/*     background-color: #1b67b1!important; */
background-color: #600F1B!important;
}

.button1 {
  padding: 0px 5px;
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4d4d4d;
  border: none;
  border-radius: 10px;
  box-shadow: 0 2px #999;
}

.button2 {
  padding: 0px 5px;
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #ffff;
  background-color: #4d4d4d;
  border: none;
  border-radius: 15px;
  box-shadow: 0 5px #999;
}

.button3 {
  padding: 5px 15px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #ffff;
  background-color: #4d4d4d;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

  </style>
  
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.jsp"><b>U.P State Archives</b></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index.jsp">
            <i class="fa fa-fw fa-dashboard button2"></i>
            <span class="nav-link-text button1" style="color:white;"><b>Home</b></span>
          </a>
        </li>
        
       <%
       if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
         	 out.println("<script type=\"text/javascript\">");  
         		out.println("alert('Please login first to visit this page.');");  
         		out.println("location='logout.jsp';");
         		out.println("</script>"); 
         
          	

         } 
         
          else
          {
          Long userid=(Long)session.getAttribute("user_id");
          Integer user=Integer.valueOf(userid.intValue());
          session.setAttribute("user_id",userid);
          
try {
	AccessGetMenuDAO ad=new AccessGetMenuDAO();
	List<Object[]> l=ad.getMenuItem(1);
	for(Object[] obj : l)
	{

		GetMenuItem getMenu=new GetMenuItem();
		
		getMenu.setMenu_id((Integer) obj[0]);
		getMenu.setText_p(String.valueOf(obj[1]));
		getMenu.setDescription_d(String.valueOf(obj[2]));
		getMenu.setParent_id((Integer) obj[3]);
		getMenu.setNav_url(String.valueOf(obj[4]));
		getMenu.setOrder_by((Integer) obj[5]);
		%>
		
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="<%=getMenu.getText_p()%>">
        <a class="nav-link" href="<%=getMenu.getNav_url()%>">
          <i class="fa fa-fw fa-clipboard button2"></i>
          <span class="nav-link-text button1" style="color:white;"><b><%=getMenu.getText_p()%></b></span>
        </a>
         <%
        if(getMenu.getText_p().equalsIgnoreCase("Reports"))
        { %>
        
        <ul class="nav-item list-unstyled" data-toggle="tooltip" data-placement="right">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="List of Lists">
        <a class="nav-link" href="show_combined_list.jsp">
          <i class="fa fa-fw"></i>
          <span class="nav-link-text button1" style="color:white;"><b>List of Lists</b></span>
        </a>
        </li>
        
           <li class="nav-item" data-toggle="tooltip" data-placement="right" title="List Details">
        <a class="nav-link" href="showListDetailsByDept.jsp">
          <i class="fa fa-fw"></i>
          <span class="nav-link-text button1" style="color:white;"><b>List Details</b></span>
        </a>
        </li>
        
        </ul>
        	
      <%   }
         %>
      </li>
		
	<% }
	
	}
	catch (Exception e) {
		e.printStackTrace();
	}
          }
%>
        
        
        
        
       
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class=""></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class=" mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class=""></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class=""></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class=" mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class=""></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class=""></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class=""></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class=""></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class=""></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="user_login">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
        <li class="breadcrumb-item">
          <a href="index.jsp"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Reports</span></b></li>
      </ol>
      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
        

  
            <table class="table table-bordered" id="ex1" width="100%" cellspacing="0">
              
             <thead>
                <tr class="warning" >
                   <td width="2px"><h6>S.No</h6></td>
                    <td width="2px"><h6>List ID</h6></td>
                    <td><h6>Departments</h6></td>
                   
                    
    
                </tr>
            </thead>
            <%
               
                	ListOfList d=new ListOfList();

SessionFactory sf = HibernateUtil.getSessionFactory();
    				Session session1=sf.openSession();
    				Transaction tx=session1.beginTransaction();
    				SQLQuery query = (SQLQuery) session1.createSQLQuery("SELECT * FROM public.show_list_detail_complete()");
   				    List<Object[]> l=query.list();
   		int i=0;
   		        for(Object[] obj : l)
   		        { ++i;
   			      int list_id=(Integer) obj[0];
   			   
   			     String dept_name=String.valueOf(obj[1]);
   			   String sublist=String.valueOf(obj[2]);
   			   if(sublist==null ||sublist==""||sublist.isEmpty())
   			   {
   				   sublist="";
   			   }
    	             %>      
                <td><%=i %></td>
                <td><%=list_id%><%=sublist.trim()%></td>
                
                <td><%=dept_name%></td>
                 </tr>
                			     
            <%}
            session1.close();
            %>
    	        
            </table>
        
 

        
 </div>
        </div>
        <div class="card-footer small text-muted"></div>
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Department Of State Archives Uttar Pradesh, Design and hosted by National Informatics Centre State Unit Lucknow</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
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
    
           
        
<script>

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}

</script>

   <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
   <link rel="Stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />

<!--    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> -->
<!--    <script  type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> -->
<!--     <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script> -->
   
   
    <script type="text/javascript" src="resources/js/jquery-1.12.4.js"></script>
   <script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="resources/js/dataTables.buttons.min.js"></script>
   <script type="text/javascript" src="resources/js/buttons.flash.min.js"></script>
   <script type="text/javascript" src="resources/js/jszip.min.js"></script>
   <script type="text/javascript" src="resources/js/pdfmake.min.js"></script>
   <script  type="text/javascript" src="resources/js/vfs_fonts.js"></script>
    <script type="text/javascript" src="resources/js/buttons.html5.min.js"></script>
   <script type="text/javascript" src="resources/js/buttons.print.min.js"></script>
   

  

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
  </div>
</body>

</html>
 