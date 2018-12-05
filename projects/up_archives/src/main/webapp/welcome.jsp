<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>

	<title>Admin Login </title>
	
<style type="text/css">
.large-header {
   position: relative;
   width: 100%;
   background: #111;
   overflow: hidden;
   background-size: cover;
   background-position: center center;
   z-index: 1;
}

.demo .large-header {
   background-image: url("resources/demo-bg.jpg");
}

.main-title {
   position: absolute;
   margin: 0;
   padding: 0;
   color: #F9F1E9;
   text-align: center;
   top: 50%;
   left: 50%;
   -webkit-transform: translate3d(-50%, -50%, 0);
   transform: translate3d(-50%, -50%, 0);
}

.demo .main-title {
   text-transform: uppercase;
   font-size: 4.2em;
   letter-spacing: 0.1em;
}

.main-title .thin {
   font-weight: 200;
}

@media only screen and (max-width: 768px) {
   .demo .main-title {
      font-size: 3em;
   }
}
</style>
</head>
<body>

<div class="container demo">
   <div class="content">
  
      <div id="large-header" class="large-header">
       
         <canvas id="demo-canvas"></canvas>
         
         <h1 class="main-title"><a href="login.jsp" style="color:white"><span class="thin" style="color:#ff6600">उत्तर प्रदेश राजकीय अभिलेखागार</span></a>
         </h1>
        
      
      </div>
      
   </div>
</div>

</body>
<!--  <script> -->
<!-- //          var timer = setTimeout(function() { -->
<!-- //             window.location='login.jsp' -->
<!-- //         }, 10000); -->
<!--      </script>  -->
 <script src="resources/js/TweenLite.min.js"></script>
 <script src="resources/js/EasePack.min.js"></script>
  <script src="resources/js/demo.js"></script>
   
</html>