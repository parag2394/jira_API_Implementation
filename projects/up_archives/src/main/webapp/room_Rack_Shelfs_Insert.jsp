 <%@ include file = "header.jsp" %>
 <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index.jsp"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Rack Master</span></b></li>
      </ol>
            <style>

.thick {
    font-weight: bold;
}
</style>
  <div class="container1 container-White py-10">
  <div align="right"><a href="show_room_rack_shelfs"><strong>>><u>Show Room,Rack & Shelfs</u></strong></a></div>
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="roomRackShelfsInsert" method="post">
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
<label for="" class="thick">Record Room<span style="color:red;">*</span></label>
<!-- <input class="form-control" type="text" name="roomnum" autocomplete="off" placeholder="Enter Room No." required="" id="roomnum" onkeypress="return isNumberKey(event)" /><br> -->
<select name="roomnum" size="1" id="roomnum" required="" class="form-control">
<option value="0" selected>Select</option>
<option value="1">Record Room 1 - Board of Revenue</option>
<option value="2">Record Room 2 - Secretriat</option>
</select>
</div>

<div class="col-sm-6">


<label for="" class="thick">Rack No.<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="racknum" autocomplete="off" placeholder="Enter Rack No." required="" id="racknum" onkeypress="return isNumberKey(event)"/><br>

</div>

</div>

<div class="form-group row">

<div class="col-sm-6">
 <label for="" class="thick">Total Shelfs <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="totalshelf" value="6" autocomplete="off" placeholder="Enter Total Shelf" required="" id="totalshelf" onkeypress="return isNumberKey(event)" readonly/><br>
   
</div>
<div class="col-sm-6">
<label for="" class="thick">Total Box In Single Shelf<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="totalbook" autocomplete="off" value="8" placeholder="Enter Total Book In Shelf" required="" id="totalbook" onkeypress="return isNumberKey(event)" readonly/><br>

</div>
</div>

   
<div class="form-group row">

<div class="col-sm-6">
 <label for="" class="thick">Total SubSelf In Self <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="total_subselfInself" autocomplete="off" value="8" placeholder="Enter Total SubShelf" required="" id="total_subselfInself" onkeypress="return isNumberKey(event)" readonly/><br>
   
</div>
<div class="col-sm-6">
<label for="" class="thick">Total Box In SubShelf <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="total_boxinSubself" autocomplete="off" value="64" placeholder="Enter Total Box In SubShelfs" required="" id="total_boxinSubself" onkeypress="return isNumberKey(event)" readonly/><br>

</div>
</div>

<div class="form-group row">

<div class="col-sm-6">
 <label for="" class="thick">Total SubShelf In Rack<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="totalSubselfinRack" autocomplete="off" value="48" placeholder="Enter Total SubShelf In Rack" required="" id="TotalSubselfinRack" onkeypress="return isNumberKey(event)" readonly/><br>
   
</div>
<div class="col-sm-6">
<label for="" class="thick">Total Boxes In Rack<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="totalBoxesinRack" autocomplete="off" value="384" placeholder="Enter Total Boxes In Rack" required="" id="totalBoxesinRack" onkeypress="return isNumberKey(event)" readonly/><br>

</div>
</div>

 <p>All (<span style="color:red;">*</span>) fields are mandatory.       

<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="submit"  value="Submit" id="addroomracks"/>&nbsp;&nbsp;
<input class="butclass button" type="reset"  value="Reset" />


</div>

</div>

</form>

      </div>
      </div>
      </div>
      </div>
      
      	<script type="text/javascript">
	
	 /////
    
    $(function () {
    	
        $('#addroomracks').click(function () {  	 
        	
        	if (document.getElementById('roomnum').value=="0") {
                //document.getElementById('roomnum').focus();
                alert("Please select Room No.");
                return;
            }
        
           
         
        	  
          
        });
            
            
        });
   

	
	</script>
   
   <script type="text/javascript">
        $category = $('#roomnum');

        $category.change (
            function() {

            	
                
                $.ajax({
                    type: "POST",
                    url: "GetAvailableRack",
                    data: {category: document.getElementById('roomnum').value },
                    success: function(data){
                    	//alert(data);
                     	 $('#racknum').empty();
                     	//var list = "";
                    //	var list = jQuery.parseJSON(data);
                    	   
                    		   $('#racknum').val(data);
                    		   $('#racknum').attr('readonly', true);

		
                  
                   
                    	
                    }
                });
            	 
            }
        );

    </script>
   
   
    <%@ include file = "Footer.jsp" %>
    

