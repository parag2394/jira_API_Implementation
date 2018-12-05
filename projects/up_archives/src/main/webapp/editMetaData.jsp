<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import=" com.up_archives.util.*" %>
<%@ page import="com.up_archives.department.daoImpl.*" %>
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
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
 <%@ include file = "header.jsp" %>
<style>
.hide
{
display:none;
}
</style>

  <style>

.thick {
    font-weight: bold;
}
</style>
<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Meta Data Entry</span></b></li>
      </ol>
 <form action="updatefile" method="post" enctype="multipart/form-data">     
     
    
       <div class="container1 container-White py-10">
        <div align="right"><a href="showMetaData.jsp"><strong>>><u>Show Meta Data</u></strong></a></div>
        <br>
      <div class="form-group row">
     
     <div class="col-sm-12" >
     <label class="thick">Please select document</label>
        <br>
        <div class="input-group">
        <br>
        <br>
        
        <input type="hidden" name="record_id" value="<%=request.getParameter("record_id")%>">
        <input type="hidden" name="list_id" value="<%=request.getParameter("list_id")%>">
        <input type="hidden" name="sub_list_id" value="<%= request.getParameter("sub_list_id")%>">
        <input type="hidden" name="cover_no" value="<%=request.getParameter("cover_no")%>">
        <input type="hidden" name="file_no" value="<%=request.getParameter("file_no")%>">
        
           <span class="input-group-btn">
            
                <span class="btn btn-default btn-file" style="color:blue">
                
                    <b>Browse…</b> <input type="file" id="imgInp" name="file" onchange="PreviewImage()" required="true">
                    
                </span>
                
               
            </span>
            
            <input type="text" class="form-control" readonly>  <input type="submit" value="Submit" class="btn btn-info btn-lg">
        </div>
        <br>
        <br>
    <div style="clear:both">
           <iframe id="viewer" frameborder="0" scrolling="no" width="100%" height="600"></iframe>
        </div>
    </div>
      
    </div>      
      </div> 
      </form>
        </div>
     
      
    
    
    
      
    <script type="text/javascript">
            function PreviewImage() {
                pdffile=document.getElementById("imgInp").files[0];
                pdffile_url=URL.createObjectURL(pdffile);
                $('#viewer').attr('src',pdffile_url);
            }
        </script>
        
        
          <script>
    $(document).ready( function() {
    	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [label]);
		});

		$('.btn-file :file').on('fileselect', function(event, label) {
		    
		    var input = $(this).parents('.input-group').find(':text'),
		        log = label;
		    
		    if( input.length ) {
		        input.val(log);
		    } else {
		        if( log ) alert(log);
		    }
	    
		});
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        
		        reader.onload = function (e) {
		          $('#img-upload').attr('src', e.target.result);
		        
		        }
		        
		        reader.readAsDataURL(input.files[0]);
		    }
		}

		$("#imgInp").change(function(){
		    readURL(this);
		}); 	
	});

    </script>       
   
   <style>

.container1 {
    max-width: 2000px;
}


.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

#img-upload{
    width: 100%;
}

</style>
        
        

   
    <%@ include file = "Footer.jsp" %>
    

