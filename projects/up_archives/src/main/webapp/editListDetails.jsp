 <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.up_archives.lol.model.*" %>
<%@ page import="com.up_archives.lol.daoImpl.*" %>
<%@ page import="com.up_archives.RRS.daoImpl.*" %>
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

<%@ page import=" com.up_archives.util.*" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>

<%@ include file = "header.jsp" %>

<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index.jsp"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">List Detail</span></b></li>
      </ol>
      <style>

.thick {
    font-weight: bold;
}
</style>
  <div class="container1 container-White py-10">
    <div align="right"><a href="showListDetails.jsp"><strong>>><u>Show List Details</u></strong></a></div>
    
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="insertListDetails" method="post">
      
 <SCRIPT language=Javascript>    
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
         
         
        
      }
</script>     
<%int from=0;
int to=0;
%>
<%
    try{
    	
%>

<div class="form-group row">
<div class="col-sm-6">
 
<label for="" class="thick">Record Room<span style="color:red;">*</span></label>
<select name="room_no" size="1" id="room_no" required="" class="form-control">
<option value="0" selected>Select</option>
<option value="1">Record Room 1 - Board of Revenue</option>
<option value="2">Record Room 2 - Secretriat</option>


        </select>
</div>

<div class="col-sm-6">
<label for="" class="thick">List No.<span style="color:red;">*</span></label>
<select name="list_id" size="1" id="list_id" required="" class="form-control">
<option value="<%=request.getParameter("list_id") %>" selected>List <%=request.getParameter("list_id") %></option> 
<%
AccessListOfListDao ad=new AccessListOfListDao();
List<Object[]> l=ad.get_List_All_Ids();
for(Object[] obj:l)
{
	ListOfList li=new ListOfList();
	li.setList_id((Integer) obj[0]);
	li.setDept_id((Integer) obj[1]);
	li.setDoc_year_from((Integer) obj[2]);
	li.setDoc_year_to((Integer) obj[3]);
	from=li.getDoc_year_from();
	to=li.getDoc_year_to();
	Dept d1=new Dept();
	d1.setDept_name_E(String.valueOf(obj[4]));
	System.out.println(li.getList_id());
	System.out.println(li.getDept_id());
	System.out.println(d1.getDept_name_E());
	System.out.println();

%>
<option value=<%=li.getList_id()%>>List <%=li.getList_id()%></option> 
 
<%} %>   


        </select>
        
</div>

</div>
        
<%

        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
 <br>
 
 <div class="form-group row">
<div class="col-sm-6">

<label for="" class="thick">Department<span style="color:red;">*</span></label>
<select name="list" size="1" id="list" required="" class="form-control">
<option value="Select" selected>Select</option>
      
       </select>
</div>

<div class="col-sm-6">
<label for="" class="thick">File No. <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="file_no" value="<%=request.getParameter("file_no") %>" autocomplete="off" placeholder="Enter File No." required="" id="file_no" onkeypress="return isNumberKey(event)"/>
</div>
</div>
 
<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">File Subject <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="doc_subject" value="<%=request.getParameter("doc_subject") %>" autocomplete="off" placeholder="Enter Document Subject" required="" id="doc_subject" />
</div>
<div class="col-sm-6">
<label for="" class="thick">Document Year From <span style="color:red;">*</span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., 1975">(!)</a></label>
<input class="form-control " type="text" name="doc_year_from" value="<%=request.getParameter("doc_year_from") %>" autocomplete="off" placeholder="Enter Document Year From" required="" id="doc_year_from" onkeypress="return isNumberKey(event)" maxlength="4"/>

</div>
</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="" class="thick">Document Year To <span style="color:red;">*</span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., 1999">(!)</a></label>
<input class="form-control" type="text" name="doc_year_to" value="<%=request.getParameter("doc_year_to") %>" autocomplete="off" placeholder="Enter Document Year To" required="" id="doc_year_to" onkeypress="return isNumberKey(event)" maxlength="4"/>
</div>

<div class="col-sm-6">
<label for="" class="thick">No. of Covers<span style="color:red;">*</span></label>
<input class="form-control" type="text" autocomplete="off" name="total_cover_no" value="<%=request.getParameter("total_cover_no") %>" placeholder="Enter Total Cover No." required="" id="total_cover_no" onkeypress="return isNumberKey(event)"/>
</div>

 <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="" class="thick">Box No.<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="box_no" value="<%=request.getParameter("box_no") %>" autocomplete="off" placeholder="Enter Box No." required="" id="box_no" onkeypress="return isNumberKey(event)"/>
</div>

<div class="col-sm-6">
<label for="" class="thick">Rack No.<span style="color:red;">*</span></label>
<select name="rack_no" size="1" id="rack_no" required="" class="form-control">
<option value="<%=request.getParameter("rack_no") %>" selected>rack <%=request.getParameter("rack_no") %></option>
        </select>
 
</div>
</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Shelf No.<span style="color:red;">*</span></label>
<select name="sf_no" size="1" id="sf_no" required="" class="form-control">

<option value="<%=request.getParameter("shelf_no").trim()%>" selected>Shelf <%=request.getParameter("shelf_no").trim()%></option>
<option value="A" >Shelf A</option>
<option value="B" >Shelf B</option>
<option value="C" >Shelf C</option>
<option value="D" >Shelf D</option>
<option value="E" >Shelf E</option>
<option value="F" >Shelf F</option>


        </select>
 
</div>


<div class="col-sm-6">
<label for="" class="thick">Location Code <span style="color:red;">* </span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., R1001B01 - Room 1,Rack 1,Shelf B,SubShelf 01">(?)</a></label>

<!-- <input class="form-control " type="text" name="shelf_no" autocomplete="off" placeholder="Enter Location Code" required="" id="shelf_no"/> -->
<select name="shelf_no" size="1" id="shelf_no" required="" class="form-control">
<option value="<%=request.getParameter("location_code") %>" selected>Location Code <%=request.getParameter("location_code") %></option>


        </select>

</div>

</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="" class="thick">Remark</label>
<input class="form-control" type="text" name="remark" value="<%=request.getParameter("remark") %>" autocomplete="off" placeholder="Enter Remark" id="remark" />

</div>
</div>
<p>All (<span style="color:red;">*</span>) fields are mandatory.




<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="button"  value="update" name="submit" id="update_ld"/>&nbsp;&nbsp;
<input class="butclass button" type="reset"  value="Reset" id="reset"/>&nbsp;&nbsp;

<div class='ex1 hide table-responsive' id='div2'>
<br>


                                    <br>
                                
                                    </div>
                                    
                                 
                                    <style>
                                    div.ex1 {
    overflow: scroll;
}

div.ex2 {
    overflow: hidden;
}

div.ex3 {
    overflow: auto;
}

div.ex4 {
    overflow: visible;
}

.hide
{
display:none;
}
                                    </style>
                                  </form>


</div>
</div>

<input type="hidden" id="record_id" value="<%=request.getParameter("record_id") %>">
 
      </div>
      </div>
      </div>
      </div>
      
     
   <script type="text/javascript">
        $category = $('#list_id');

        $category.change (
            function() {
                $.ajax({
                    type: "POST",
                    url: "GetDepartmentName",
                    data: {category: document.getElementById('list_id').value },
                    success: function(data){
                     	 $('#list').empty();
                     	var list = "";
                    	var list = jQuery.parseJSON(data);
                    	   for (var i = 0; i < list.length; i++) {
                    		   $('#list').append('<option value="' + list[i][0] + '">' + list[i][1] + '</option>');

                           }
		
                  
                   
                    	
                    }
                });
            	 
            }
        );

    </script>
    
<script type="text/javascript">
        $category = $('#sf_no');

        $category.change (
            function() {
                $.ajax({
                    type: "POST",
                    url: "GetLocationCode",
                    data: {roomnum: document.getElementById('room_no').value ,
                    	racknum: document.getElementById('rack_no').value,
                    	sf_no:document.getElementById('sf_no').value
                        },
                    success: function(data){
                     	 $('#shelf_no').empty();
                     	var list = "";
                    	var list = jQuery.parseJSON(data);
                    	
                    	   for (var i = 0; i < list.length; i++) {
                    		   $('#shelf_no').append('<option value="' + list[i] + '">'+'Location Code ' + list[i]+ '</option>');

                           }
		
                  
                   
                    	
                    }
                });
            	 
            }
        );

    </script>   
    
    
    
     <script type="text/javascript">
	
	 /////
    
    $(function () {
    	
        $('#update_ld').click(function () {  	 

        	if (document.getElementById('room_no').value=="0") {
                document.getElementById('room_no').focus();
                alert("Please select room no.");
                return;
            }
        	
        	if (document.getElementById('list_id').value=="-1") {
                document.getElementById('list_id').focus();
                alert("Please select list");
                return;
            }

        	if (document.getElementById('list').value=="-1") {
                document.getElementById('list').focus();
                alert("Please select department");
                return;
            }

        	if (document.getElementById('doc_subject').value=="") {
                document.getElementById('doc_subject').focus();
                alert("Please fill document subject");
                return;
            }

        	if (document.getElementById('doc_year_from').value=="") {
                document.getElementById('doc_year_from').focus();
                alert("Please select Document Year From");
                return;
            }

        	if (document.getElementById('doc_year_to').value=="") {
                document.getElementById('doc_year_to').focus();
                alert("Please select Document Year to");
                return;
            }

        	

        	if (document.getElementById('remark').value=="") {
                document.getElementById('remark').focus();
                alert("Please select remark");
                return;
            }


            
       	 $.ajax({
                type: "POST",
                url: "update_list_details",
                data: {
                    record_id:document.getElementById('record_id').value,
                    dept_id: document.getElementById('list').value,
               	 list_id:document.getElementById('list_id').value,
               	doc_subject:document.getElementById('doc_subject').value,
               	 doc_year_from:document.getElementById('doc_year_from').value,
               	 doc_year_to:document.getElementById('doc_year_to').value,
               	room_no:document.getElementById('room_no').value,
               	rack_no:document.getElementById('rack_no').value,
               	location_code:document.getElementById('shelf_no').value,
               	box_no:document.getElementById('box_no').value,
               	file_no:document.getElementById('file_no').value,
               	total_cover_no:document.getElementById('total_cover_no').value,
               	 remark:document.getElementById('remark').value,
               	 shelf_no:document.getElementById('sf_no').value
               	     	 
                },
                success: function(data){

           
           
        	var list = "";
       	var list = jQuery.parseJSON(data);
       
if(list==1)
	{
alert('Data successfully Updated');
	}
else
	{
	alert('Please try again');
	}

window.location.href = "showListDetails.jsp";
                   	
                }
            });
       	  
          
        });
            
            
        });
   

	
	</script>   
   
   
   <script type="text/javascript">
        $category = $('#room_no');

        $category.change (
            function() {
                $.ajax({
                    type: "POST",
                    url: "GetRacksInsideRoom",
                    data: {roomnum: document.getElementById('room_no').value },
                    success: function(data){
                     	 $('#rack_no').empty();
                     	 
                     	var list = "";
                    	var list = jQuery.parseJSON(data);
                    	//alert(data);
                    //	 $('#rack_no').append('<option value="' + 0 + '">'Select'</option>');
                    	   for (var i = 0; i < list.length; i++) {
                    		   $('#rack_no').append('<option value="' + list[i] + '">'+"Rack " + list[i]+ '</option>');

                           }
		
                  
                   
                    	
                    }
                });
            	 
            }
        );

    </script>
   
    <%@ include file = "Footer.jsp" %>
    

