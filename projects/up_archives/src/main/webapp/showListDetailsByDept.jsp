<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>
<%@ page import=" com.up_archives.department.daoImpl.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import=" com.up_archives.util.*" %>
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
<%@ page import=" com.up_archives.listDetails.daoImpl.*" %>
<%@ page import=" com.up_archives.listDetails.model.*" %>
<%@ include file = "table_header.jsp" %>


  <div class="form-group row" align="centre">
<%
    try{
    	AccessDeartmentDAO ad1=new AccessDeartmentDAO();
		Dept d=new Dept();
		List<Object[]> list=ad1.fetchDepartments();
%>

<div class="col-sm-6">
<label for="" class="thick"> <b>Select Department</b><span style="color:red;">*</span></label>
<select name="list" size="1" id="list" required="" class="form-control">
<option value="-1" selected>Select</option>
        <%  for(Object[] obj:list)
		{
			d.setDept_id((Integer) obj[0]);
			d.setDept_name_E(String.valueOf(obj[1]));
			System.out.println(d.getDept_id());
			System.out.println(d.getDept_name_E());
			 %>
            <option value=<%=d.getDept_id()%>><%=d.getDept_name_E()%></option>
        <% } %>
       </select>
       
</div>


<%

        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>


<div class="col-sm-6">
<label for="" class="thick"><b>Sub-Department</b><span style="color:red;">*</span></label>
<select name="subdept" size="1" id="subdept" required="" class="form-control">
<option value="0" selected>Select</option>
        </select>
 
</div>


</div>
<br>
<br>
    <i class="fa fa-table"></i> <b>List Details</b></div>
    

    
        <div class="card-body" id="dataTable1">
        <br>

          



          <div class="table-responsive" >
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
             <thead>
                <tr class="warning" >
                   <th ><h6>S.NO</h6></td>
                    <th ><h6>Box.no</h6></td>
                    <th><h6>File no</h6></td>
                    <th><h6>No. of Covers</h6></td>
                    <th><h6>Subject</h6></td>
                    <th><h6>DOC YEAR FROM</h6></td>                
                      <th><h6>DOC YEAR TO</h6></td>                  
                    <th><h6>Remark</h6></td>
                    
                    
    
                </tr>
            </thead>
            	        
            </table>

            <script type="text/javascript">
            window.onload = function() {
            	document.getElementById("dataTable").style.visibility='hidden'; 
            	  
            	};

            </script>
             <script src="resources/js/jquery-latest.min.js"
        type="text/javascript"></script>  
          <script type="text/javascript">
           
                  $ListDetailsReport = $('#subdept');

        $ListDetailsReport.change (
        		
            function() {
                $.ajax({
                    type: "POST",
                    url: "listDetailsBySubDept",
                    data: {dept_id: document.getElementById('subdept').value },
                    success: function(data){

                        
                     	var list = "";
                    	var list = jQuery.parseJSON(data);
                    	
                    	var datalength = list.length;
                    	//alert(list);
                    
                    if(list=='')
                    	{
                    	
                    	$('#dataTable tr').not(function(){ return !!$(this).has('th').length; }).remove();
                    	//$("#myTableRow").empty();
                      
                    	
                    //	document.getElementById("hideTable").style.visibility='hidden'; 
                    	alert('Records Not Available');
                    	// $("myTableRow").html('');
                      	
                    	document.getElementById("dataTable").style.visibility='hidden'; 
                    	
                    	}
                    if(list!=''){
                    	//$("myTableRow").html('');
                    	var j=0;
                    	   for (var i = 0; i < list.length; i++) {
                    	++j;
                    	var row = $("<tr id='myTableRow'>")
              		  $("#dataTable").append(row);
                    		  row.append($("<td>" + j + "</td>"));
                    		  row.append($("<td>" + list[i][9] + "</td>"));
                    		  row.append($("<td>" + list[i][10] + "</td>"));
                    		  row.append($("<td>" + list[i][11] + "</td>"));
                    		  row.append($("<td>" + list[i][3] + "</td>"));
                    		  row.append($("<td>" + list[i][4] + "</td>"));
                    		  row.append($("<td>" + list[i][5] + "</td>"));
                    		  row.append($("<td>" + list[i][12] + "</td>"));
                    		  var row = $("</tr>")
                           }
                    	   document.getElementById("dataTable").style.visibility='visible';
                    		
                    }                 	
                  
                   
                    	
                    }
                });
            	 
            }
            
            
           
        );

    </script>
    
    
    
     <script type="text/javascript">
        $category = $('#list');

        $category.change (
            function() {
                $.ajax({
                    type: "POST",
                    url: "listSubDeptInfo",
                    data: {list: document.getElementById('list').value },
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
    
 
        
   <%@ include file = "table_footer.jsp" %>