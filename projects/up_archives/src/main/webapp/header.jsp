<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval};url=user_login">
  <title>Uttar Pradesh State Archives</title>
  <!-- Bootstrap core CSS-->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
  
  <script src="resources/vendor/jquery/jquery.min.js"></script>
   <link rel="stylesheet" href="resources/css/jquery-ui.css">  

  <script src="resources/js/jquery-ui.js"></script>
  <script>
  $( function() {
	  $( ".datepick" ).datepicker({
	       dateFormat: 'dd-mm-yy'
	    });
  } );
  
  </script>
  <style type="text/css">
  .bg-dark {
/*     background-color: #1b67b1!important; */
background-color: #600F1B!important;
}

.butclass {
background-color:#dfc7c7;
}

.button {
  padding: 5px 15px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #5f4646;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
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

.button:hover {background-color: #4d4d4d}

.button:active {
  background-color: #dfc7c7;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
  </style>
  
  
          <style>

.thick {
    font-weight: bold;
}
</style>
  
 <style type="text/css">
 
.push_button {
    position: relative;
    width:220px;
    height:40px;
    text-align:center;
    color:#FFF;
    text-decoration:none;
    line-height:43px;
    font-family:'Oswald', Helvetica;
    display: block;
    margin: 30px;
}
.push_button:before {
    background:#f0f0f0;
    background-image:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#D0D0D0), to(#f0f0f0));
    
    -webkit-border-radius:5px;
    -moz-border-radius:5px;
    border-radius:5px;
    
    -webkit-box-shadow:0 1px 2px rgba(0, 0, 0, .5) inset, 0 1px 0 #FFF; 
    -moz-box-shadow:0 1px 2px rgba(0, 0, 0, .5) inset, 0 1px 0 #FFF; 
    box-shadow:0 1px 2px rgba(0, 0, 0, .5) inset, 0 1px 0 #FFF;
    
    position: absolute;
    content: "";
    left: -6px; right: -6px;
    top: -6px; bottom: -10px;
    z-index: -1;
}

.push_button:active {
    -webkit-box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset;
    top:5px;
}
.push_button:active:before{
    top: -11px;
    bottom: -5px;
    content: "";
}

.red {
    text-shadow:-1px -1px 0 #A84155;
    background: #D25068;
    border:1px solid #D25068;
    
    background-image:-webkit-linear-gradient(top, #F66C7B, #D25068);
    background-image:-moz-linear-gradient(top, #F66C7B, #D25068);
    background-image:-ms-linear-gradient(top, #F66C7B, #D25068);
    background-image:-o-linear-gradient(top, #F66C7B, #D25068);
    background-image:linear-gradient(to bottom, #F66C7B, #D25068);
    
    -webkit-border-radius:5px;
    -moz-border-radius:5px;
    border-radius:5px;
    
    -webkit-box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset, 0 4px 0 #AD4257, 0 4px 2px rgba(0, 0, 0, .5);
    -moz-box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset, 0 4px 0 #AD4257, 0 4px 2px rgba(0, 0, 0, .5);
    box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset, 0 4px 0 #AD4257, 0 4px 2px rgba(0, 0, 0, .5);
}

.red:hover {
    background: #F66C7B;
    background-image:-webkit-linear-gradient(top, #D25068, #F66C7B);
    background-image:-moz-linear-gradient(top, #D25068, #F66C7B);
    background-image:-ms-linear-gradient(top, #D25068, #F66C7B);
    background-image:-o-linear-gradient(top, #D25068, #F66C7B);
    background-image:linear-gradient(top, #D25068, #F66C7B);
}

.blue {
    text-shadow:-1px -1px 0 #2C7982;
    background: #3EACBA;
    border:1px solid #379AA4;
    background-image:-webkit-linear-gradient(top, #48C6D4, #3EACBA);
    background-image:-moz-linear-gradient(top, #48C6D4, #3EACBA);
    background-image:-ms-linear-gradient(top, #48C6D4, #3EACBA);
    background-image:-o-linear-gradient(top, #48C6D4, #3EACBA);
    background-image:linear-gradient(top, #48C6D4, #3EACBA);
    
    -webkit-border-radius:5px;
    -moz-border-radius:5px;
    border-radius:5px;
    
    -webkit-box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset, 0 4px 0 #338A94, 0 4px 2px rgba(0, 0, 0, .5);
    -moz-box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset, 0 4px 0 #338A94, 0 4px 2px rgba(0, 0, 0, .5);
    box-shadow:0 1px 0 rgba(255, 255, 255, .5) inset, 0 -1px 0 rgba(255, 255, 255, .1) inset, 0 4px 0 #338A94, 0 4px 2px rgba(0, 0, 0, .5);
}

.blue:hover {
    background: #48C6D4;
    background-image:-webkit-linear-gradient(top, #3EACBA, #48C6D4);
    background-image:-moz-linear-gradient(top, #3EACBA, #48C6D4);
    background-image:-ms-linear-gradient(top, #3EACBA, #48C6D4);
    background-image:-o-linear-gradient(top, #3EACBA, #48C6D4);
    background-image:linear-gradient(top, #3EACBA, #48C6D4);
}
 </style>
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
 
  <%@ include file = "menu.jsp" %>
 
<div class="content-wrapper">
