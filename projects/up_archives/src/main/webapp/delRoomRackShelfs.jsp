<%@ include file = "header.jsp" %>
 <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.*" %>
<%ResultSet resultset =null;%>
<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index.jsp"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Remove Rack Details</span></b></li>
      </ol>
  <div class="container1 container-White py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
       
      <form action="deleteRoomRackShelfs" method="post">
  <SCRIPT language=Javascript>    
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
         
         
        
      }
</script>
<div class="form-group row" align="centre">

<div class="col-sm-6">
<label for="" class="thick">Room no. <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="roomnum" autocomplete="off" placeholder="Enter Room No." required="" id="roomnum" value="<%=request.getParameter("room_no")%>" onkeypress="return isNumberKey(event)" readonly/><br>
</div>

<div class="col-sm-6">
<label for="" class="thick">Rack no.<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="racknum" autocomplete="off" placeholder="Enter Rack No." required="" id="racknum" value="<%=request.getParameter("rack_no") %>" onkeypress="return isNumberKey(event)" readonly/><br>

</div>

</div>

<div class="form-group row">

<div class="col-sm-6">
 <label for="" class="thick">Total shelfs <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="totalshelf" autocomplete="off" placeholder="Enter Total Shelf" required="" id="totalshelf" value="<%=request.getParameter("total_shelf") %>" onkeypress="return isNumberKey(event)" readonly/><br>
   
</div>
<div class="col-sm-6">
<label for="" class="thick">Book in shelf <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="totalbook" autocomplete="off" placeholder="Enter Total Book In Shelf" required="" id="totalbook" value="<%=request.getParameter("total_box_in_single_shelf") %>" onkeypress="return isNumberKey(event)" readonly/><br>

</div>
</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       
<input id="r_id" name="r_id" type="hidden" value="<%=request.getParameter("r_id") %>">
<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="submit"  value="Delete" />&nbsp;&nbsp;
<form action="show_room_rack_shelfs">
<input class="butclass button" type="button"  value="Back" onclick="document.location.href='showRoomRackShelfs.jsp';"/>
</form>


</div>

</div>

</form>

      </div>
      </div>
      </div>
      </div>
      
     
   
   
   
    <%@ include file = "Footer.jsp" %>
    

