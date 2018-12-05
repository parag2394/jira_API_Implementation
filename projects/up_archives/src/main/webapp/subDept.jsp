<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>UP STATE ARCHIVE</title>
      <link rel="stylesheet" href="resources/css/components.css">
      <link rel="stylesheet" href="resources/css/icons.css">
      <link rel="stylesheet" href="resources/css/responsee.css">
      <link rel="stylesheet" href="resources/owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="resources/owl-carousel/owl.theme.css">
      <!-- CUSTOM STYLE --> 
      <link rel="stylesheet" href="resources/css/template-style.css"> 
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
      <script type="text/javascript" src="resources/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="resources/js/jquery-ui.min.js"></script> 
      <link rel="stylesheet" href="resources/css/style.css">   
   </head>
   <body class="size-1140 align-content-left">
      <div class="line">
         <div id="content-wrapper">
            <!-- LEFT COLUMN -->
            <div class="s-12 m-4 l-3">
               <div class="logo-box">
                  <h1>UP State Archive</h1>
               </div>
               <div class="aside-nav">
                  <ul class="chevron">
                     <li><a href="dept.jsp"><i class=""></i>Enter Records</a></li>
                     <li><a href="login.jsp"><i class=""></i>Log Out</a></li>
                   <!--  <li><a href="gallery.html"><i class="icon-camera"></i>Gallery</a></li>
                     <li>
                        <a href="about.html"><i class="icon-heart"></i>About</a>
                        <ul>
                           <li><a href="about.html">About 1</a></li>
                           <li><a href="about.html">About 2</a></li>
                        </ul>
                     </li>
                     <li><a href="contact.html"><i class="icon-mail"></i>Contact</a></li>
                  </ul>
                  <div id="search" class="line" >
                     <input class="s-11" name="" placeholder="Search" title="Search" type="text" /><a class="s-1" ><i class="icon-magnifying"></i></a>
                  </div>
                  <div id="social">
                     <a target="_blank" href="https://www.facebook.com/myresponsee"><i class="icon-facebook_circle"></i></a> <a target="_blank" href="https://twitter.com/MyResponsee"><i class="icon-twitter_circle"></i></a>
                  </div>
                  -->
               </div>
               
            </div>
            
            <!-- RIGHT COLUMN -->   
            <div class="s-12 m-8 l-9">
            <div><img src="resources/img/logo_banner.jpg" alt=""></div>
               <div class="box">
                  <!-- HEADER -->     
                  <!-- CAROUSEL --> 
                  <div class="line">
                    <div id="header-carousel" class="owl-carousel owl-theme margin-bottom">
                      <div class="item"><img src="resources/img/header.jpg" alt=""></div>
                      <div class="item"><img src="resources/img/header1.jpg" alt=""></div>
                      <div class="item"><img src="resources/img/header2.jpg" alt=""></div>
                    </div>
                  </div>
                 
         <section id="content">       
<div align="center">                        
<form action="subDepartment" method="post">
<!--<input type="text" name="subdept_name_H" placeholder="Enter SubDept Name in Hindi" required="" id="subdept_name_H" /><br><br>
<input type="text" name="subdept_name_E" placeholder="Enter SubDept Name in English" required="" id="subdept_name_H" /><br><br>
 -->
<%
    try{
    	Statement stmt = null;
    	ResultSet rs=null;
    	PreparedStatement pst=null;
		Connection conn = ConnectionFactory.getConnection();
		 stmt = conn.createStatement();
		  
		  String query = "select * from tbl_m_subdepartment_master";

		   rs = stmt.executeQuery(query);

%>
<br>
<br>
<br>
<center>
    <h3> Please Select Sub-Department</h3>
        <br>
        
        <h5>Sub-Department :<select name="Subdept" size="1" id="Subdept">
			   
        <%  while(rs.next()){ %>
            <option><%= rs.getString(4)%></option>
        <% } %>
        </select></h5>
</center>

<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<input type="submit"  value="Submit" />
</form>
  <br>                           
 </div>                           
         </section>                
         <br>
         <br>
         <br>
         <br>               
               <!-- FOOTER --> 
               <div class="box footer">
                  <footer class="line">
                     <div class="s-12 l-6">
                        <p>Copyright 2018, Uttar Pradesh State Archive<br /></p>
                     </div>
                     <div class="s-12 l-6">
                        <a class="right" href="http://www.myresponsee.com" title="Responsee - lightweight responsive framework">Design by National Informatics Centre, U.P.</a>
                     </div>
                  </footer>
               </div>
            </div>
         </div>
      </div>
      <img id="background" class="hide-s" src="" alt="">
      <script type="text/javascript" src="resources/js/responsee.js"></script>   
      <script type="text/javascript" src="resources/owl-carousel/owl.carousel.js"></script>  
      <script type="text/javascript">
         jQuery(document).ready(function($) {		  
            var owl = $('#header-carousel');
            owl.owlCarousel({
              nav: true,
              dots: false,
              items: 1,
              loop: true,
              navText: ["&#xf007","&#xf006"],
              autoplay: true,
              autoplayTimeout: 4000
            });  
         });	          
      </script>
        <script  src="resources/js/index.js"></script>
   </body>
</html>