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
<option value="Select" selected>Select</option>
<option value="1">Record Room 1 - Board of Revenue</option>
<option value="2">Record Room 2 - Secretriat</option>


        </select>
</div>


<div class="col-sm-6">
<label for="" class="thick">List No.<span style="color:red;">*</span></label>
<select name="list_id" size="1" id="list_id" required="" class="form-control">
<option value="0" selected>Select</option> 
<%
SessionFactory sf = HibernateUtil.getSessionFactory();
Session session1=sf.openSession();
Transaction tx=session1.beginTransaction();
//SQLQuery query = session1.createSQLQuery("SELECT * FROM public.show_listid_deptname()");
SQLQuery query = session1.createSQLQuery("SELECT * FROM public.show_listids()");
System.out.println("Functon called");
List<Object[]> l=query.list();
session1.close();


for(int i=1;i<=l.size();i++)
{
	Integer ion=i;
//  	ListOfList li=new ListOfList();
//  	li.setList_id((Integer) obj[0]);
	
//	System.out.println(li.getList_id());
	
	System.out.println();

%>
 <option value=<%=ion%>>List <%=ion%></option>  

 
<%} %>   


        </select>
   <%

        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>     
</div>

 




</div>
        

 
 
 <div class="form-group row">
 
 <div class="col-sm-6">
 
 <label for="" class="thick">Sub List</label>
<input class="form-control" type="text" name="sublist" autocomplete="off" maxlength="5" value=" " placeholder="Enter Sub List" required="" id="sublist" />
 
 </div>
 
 
<div class="col-sm-6">

<label for="" class="thick">Department<span style="color:red;">*</span></label>
<select name="list" size="1" id="list" required="" class="form-control">
<option value="Select" selected>Select</option>
      
</select>
</div>



</div>
 
<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">File No. <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="file_no" autocomplete="off" placeholder="Enter File No." required="" id="file_no"/>
</div>

<div class="col-sm-6">
<label for="" class="thick">File Subject <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="doc_subject" autocomplete="off" placeholder="Enter Document Subject" required="" id="doc_subject" />
</div>

</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Document Year From <span style="color:red;">*</span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., 1975">(!)</a></label>
<input class="form-control " type="text" name="doc_year_from" autocomplete="off" placeholder="Enter Document Year From" required="" id="doc_year_from" onkeypress="return isNumberKey(event)" maxlength="4"/>

</div>


<div class="col-sm-6">
<label for="" class="thick">Document Year To <span style="color:red;">*</span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., 1999">(!)</a></label>
<input class="form-control" type="text" name="doc_year_to" value="0000" autocomplete="off" placeholder="Enter Document Year To" required="" id="doc_year_to" onkeypress="return isNumberKey(event)" maxlength="4"/>
</div>



</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Cover No.<span style="color:red;">*</span></label>
<input class="form-control" type="text" autocomplete="off" name="total_cover_no" placeholder="Enter Total Cover No." required="" id="total_cover_no" onkeypress="return isNumberKey(event)"/>
</div>

<div class="col-sm-6">
<label for="" class="thick">Box No.<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="box_no" autocomplete="off" placeholder="Enter Box No." required="" id="box_no" onkeypress="return isNumberKey(event)"/>
</div>





</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Rack No.<span style="color:red;">*</span></label>
<select name="rack_no" size="1" id="rack_no" required="" class="form-control">
<option value="0" selected>Select</option>
        </select>
 
</div>

<div class="col-sm-6">
<label for="" class="thick">Shelf No.<span style="color:red;">*</span></label>
<select name="sf_no" size="1" id="sf_no" required="" class="form-control">
<option value=" " selected>Select</option>
<option value="A" >Shelf A</option>
<option value="B" >Shelf B</option>
<option value="C" >Shelf C</option>
<option value="D" >Shelf D</option>
<option value="E" >Shelf E</option>
<option value="F" >Shelf F</option>


        </select>
 
</div>



</div>

<div class="form-group row">

<div class="col-sm-6">
 <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
<label for="" class="thick">Location Code <span style="color:red;">* </span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., R1001B01 - Room 1,Rack 1,Shelf B,SubShelf 01">(?)</a></label>

<!-- <input class="form-control " type="text" name="shelf_no" autocomplete="off" placeholder="Enter Location Code" required="" id="shelf_no"/> -->
<select name="shelf_no" size="1" id="shelf_no" required="" class="form-control">
<option value="0" selected>Select</option>


        </select>

</div>

<div class="col-sm-6">
<label for="" class="thick">Remark</label>
<input class="form-control" type="text" name="remark" value="   " autocomplete="off" placeholder="Enter Remark" id="remark" />

</div>
</div>
<p>All (<span style="color:red;">*</span>) fields are mandatory.
<p>Press <span style="color:red;">Submit</span> to insert single record, Press <span style="color:red;">Add More</span> to insert multiple records.




<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="submit"  value="Submit" name="submit" id="submit"/>&nbsp;&nbsp;
<input class="butclass button" type="reset"  value="Reset" id="reset"/>&nbsp;&nbsp;
<!-- <input type="button" id="addmore" value="Add More" name="add"  onclick='funadd()'/> -->
<div class='ex1 hide table-responsive' id='div2'>
<br>

<table  id="table" class="table table-bordered">
                                        <thead>

                                            <tr role="row" class="heading">

                                                <th width="10%"> S.No.</th>
                                                <th width="15%"> List ID</th>
                                                <th width="15%"> Dept_ID</th>
                                                <th width="15%"> Doc_Subject</th>
                                                <th width="10%"> Doc_Year_From </th>
                                                <th width="10%">Doc_Year_To </th>
                                                <th width="10%">Room_No </th>
                                                <th width="10%">Shelf_No </th>
                                                <th width="10%">Box_No </th>
                                                <th width="10%">File_No </th>
                                                 <th width="10%">Total_Cover_No </th>
                                                  <th width="10%">Remark </th>
                                                   <th width="10%">Delete </th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <br>
                                     <input id="sendServer" name="sendServer" type="button" value="Submit" />
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
                                    <script>
                                    function funadd()
        {
                                    	$('#div1').removeClass('hide');

                                    	 if (document.getElementById('room_no').value=="") {
                                             document.getElementById('room_no').focus();
                                             alert("Please Select Room No.");
                                             return;
                                         }
                                    	
            if (document.getElementById('list_id').value=="Select") {
                document.getElementById('list_id').focus();
                alert("Please Select List");
                return;
            }
            if (document.getElementById('list').value=="Select") {
                document.getElementById('list').focus();
                alert("Please Select Department");
                return;
            }
            if (document.getElementById('doc_subject').value=="") {
                document.getElementById('doc_subject').focus();
                alert("Please Select Doc Subject");
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

//             var v1=$("#doc_year_from").val();
//             var v2=$("#doc_year_to").val();

//             if(v1>v2)
//                 {
//             	alert("Document Year From Must Be Smaller Than Document Year To");
//             	return;
//                 }
            
           
            
            if (document.getElementById('rack_no').value=="") {
                document.getElementById('rack_no').focus();
                alert("Please Select Rack No.");
                return;
            }
               
            $("#list_id").attr("disabled", "disabled"); 
            $("#list").attr("disabled", "disabled");
            $("#room_no").attr("disabled", "disabled");
            $("#rack_no").attr("disabled", "disabled");
            $("#shelf_no").attr("disabled", "disabled");
           
        }
        function del(id) 
        {
        	var table = document.getElementById("table");
        	
            document.getElementById("table").deleteRow(id);
            $('#div2').addClass('hide');
            if( table.rows.length - 1 <=0)
    		{
    		$('#div1').addClass('hide');
    		$("#list_id").removeAttr("disabled", "disabled"); 
            $("#list").removeAttr("disabled", "disabled");
            $("#room_no").removeAttr("disabled", "disabled");
            $("#rack_no").removeAttr("disabled", "disabled");
            $("#shelf_no").removeAttr("disabled", "disabled");
    		}
    		
        }
        
       /////
       
        $(function () {
        	
            $('#addmore').click(function () {  	 
         
            	 $.ajax({
                     type: "POST",
                     url: "GetListDetailsTable",
                     data: {list_id: document.getElementById('list_id').value,
                    	 list:document.getElementById('list').value,
                    	 doc_subject:document.getElementById('doc_subject').value,
                    	 doc_year_from:document.getElementById('doc_year_from').value,
                    	 doc_year_to:document.getElementById('doc_year_to').value,
                    	 room_no:document.getElementById('room_no').value,
                    	 rack_no:document.getElementById('rack_no').value,
                    	 shelf_no:document.getElementById('shelf_no').value,
                    	 box_no:document.getElementById('box_no').value,
                    	 file_no:document.getElementById('file_no').value,
                    	 total_cover_no:document.getElementById('total_cover_no').value,
                    	 remark:document.getElementById('remark').value
                     },
                     success: function(data){
                    	 document.getElementById("doc_subject").value = "";
                    	 document.getElementById("doc_year_from").value = "";
                    	 document.getElementById("doc_year_to").value = "";
                    	 document.getElementById("box_no").value = "";
                    	 document.getElementById("file_no").value = "";
                    	 document.getElementById("total_cover_no").value = "";
                    	 document.getElementById("remark").value = "";
                    	document.getElementById("reset").style.visibility='hidden';
                    	document.getElementById("submit").style.visibility='hidden';
                    	 
             	alert(data);
             	 
                     }
                 });
            	
                
            });
        });


</script>
</form>


</div>
</div>


 
      </div>
      </div>
      </div>
      </div>
      
     
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
                    		 //  $('#doc_year_from').val(list[i][2]);
                    		 //   $('#doc_year_to').val(list[i][3]);
                           }
		
                  
                   
                    	
                    }
                });
            	 
            }
        );

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
    

