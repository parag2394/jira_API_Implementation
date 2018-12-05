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
 <form action="savefile" method="post" enctype="multipart/form-data">     
      <div class="container1 container-White py-10">
       <div align="right"><a href="showMetaData.jsp"><strong>>><u>Show Meta Data</u></strong></a></div>
      <div class="form-group row">
    <div class="col-sm-6">
    
    
<%
try {
	AccessDeartmentDAO ad1=new AccessDeartmentDAO();
	Dept d=new Dept();
	List<Object[]> list=ad1.fetchDepartments();
		
			%>
			<label for="" class="thick"><b>Department</b><span style="color:red;">*</span></label>
<select name="dept" size="1" id="dept" required="" class="form-control">
<option value="Select" selected>Select</option>
	   <%  for(Object[] obj:list)
		{
			d.setDept_id((Integer) obj[0]);
			d.setDept_name_E(String.valueOf(obj[1]));
		////	System.out.println(d.getDept_id());
		//	System.out.println(d.getDept_name_E());
			 %>
            <option value=<%=d.getDept_id()%>><%=d.getDept_name_E()%></option>
        <% } %>
       </select>
		<% 	}
			catch (Exception e) {
				e.printStackTrace();
			}
%>
    
    
    </div>
    
    <div class="col-sm-6">
<label for="" class="thick"><b>Sub-Department</b><span style="color:red;">*</span></label>
<select name="subdept" size="1" id="subdept" required="" class="form-control">
<option value="0" selected>Select</option>
        </select>
 
</div>
    
        <input type="hidden" id="hffilecount" name="hffilecount"  value="-1"  />
      
    </div>     
    

     
      </div>
      
      <br>
      <style>
.vl {
    border-left: 1px solid green;
    height: 1000px;
}
</style>
       <div class="container1 container-White py-10">
      <div class="form-group row">
    <div class="col-sm-6">
    
   
   
   <!-- Example DataTables Card-->
      <div class="card mb-3" id="hideTable">
        <div class="card-header">
          <i class="fa fa-table"></i>List Details</div>
        <div class="card-body">
          <div class="table-responsive">
          
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
                <thead>
                <tr class="warning" >
                <td><h6>S.No</h6></td>
                    <td><h6>Select</h6></td>
                    <td ><h6>Doc Subject</h6></td>
                    <td><h6>File no.</h6></td>
                    <td><h6>Cover no.</h6></td>
                    <td><h6>Room no.</h6></td>
                    
                    <td><h6>Rack no.</h6></td>
                    
                    <td><h6>Box no.</h6></td>
                    
                   

                </tr>
            </thead>
        
    	        
            </table>
          
          </div>
          </div>
          </div>
   
  
    
    </div>
    
    
    
     <div class="col-sm-6 vl hide" id="btncls" >
     <label class="thick">Please select document</label>
        <br>
        <div class="input-group">
        <br>
        <br>
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
	window.onload = function() {
		document.getElementById("hideTable").style.visibility='hidden'; 
	//	document.getElementById("btncls").style.visibility='hidden'; 
		};
	</script>
      
    
      <script type="text/javascript">
        $category = $('#subdept');

        $category.change (
            function() {
                $.ajax({
                    type: "POST",
                    url: "getMetaDataListDetailsInfo",
                    data: {deptid: document.getElementById('subdept').value },
                    success: function(data){
                     	
                     	var list = "";
                    	var list = jQuery.parseJSON(data);
                    	var datalength = list.length;
                    	//alert(list);
                    
                    if(list=='')
                    	{

//$('#myTableRow').html('');
                    	
                    	document.getElementById("hideTable").style.visibility='hidden'; 
                    	alert('Records Not Available');
                    	
                    	}
var j=0;
                    if(list!=''){
                 	   for (var i = 0; i < list.length; i++) 

                     	   {
                     	   ++j;
                 		  var row = $("<tr id='myTableRow'>")
                		  $("#dataTable").append(row);
                 //		 row.append($("<td>" + list[i][9] + "</td>"));
                  row.append($("<td>" + j + "</td>"));
                  
                		 row.append($('<td><input type="radio" name="btn" id="btn"   onclick="showdiv('+list[i][9]+')"/></td>'));
                		  row.append($("<td>" + list[i][2] + "</td>"));
                		  row.append($("<td>" + list[i][7] + "</td>"));
                		  row.append($("<td>" + list[i][8] + "</td>"));
                		  row.append($("<td>" + list[i][3] + "</td>"));
                		  row.append($("<td>" + list[i][4] + "</td>"));
                		  row.append($("<td>" + list[i][6] + "</td>"));
                		  var row = $("</tr>")
                     	   }
                 	  document.getElementById("hideTable").style.visibility='visible';

                    }
                    	
                  
                   
                    	
                    }
                });
            	 
            }
        );

    </script>
    
    
 
      
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
        
        
        
    <script type="text/javascript">
           
//                    $radioclick = $('#btn');
                 
//         $("input[name$='btn']").click (
        	
//             function() {
            		
//             	 document.getElementById("btncls").attr
//             }
            
            
           
//         );

function showdiv(k)
{

	$('#btncls').removeClass('hide');

	//alert(k);
	
	document.getElementById("hffilecount").value=k.toString().trim();

	alert(document.getElementById("hffilecount").value);
	
}


    </script>       
        
        
        
         <script type="text/javascript">
        $category = $('#dept');

        $category.change (
            function() {
                $.ajax({
                    type: "POST",
                    url: "listSubDeptInfo",
                    data: {list: document.getElementById('dept').value },
                    success: function(data){
                     	 $('#subdept').empty();
                     	 
                     	var list = "";
                    	var list = jQuery.parseJSON(data);
                    	//alert(data);
               //     $('#subdept').append('<option value="' + "0" + '">'Select'</option>');
                    	   for (var i = 0; i < list.length; i++) {
                    		   $('#subdept').append('<option value="' + list[i][0] + '">' + list[i][1]+ '</option>');

                           }
		
                  
                   
                    	
                    }
                });
            	 
            }
        );

    </script>
   
    <%@ include file = "Footer.jsp" %>
    

