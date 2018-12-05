<%@ include file = "header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid">

  <style type="text/css">
 


  </style>

      <!-- Breadcrumbs-->
     <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Department Master</span></b></li>
      </ol>
    
    <form action="" method="">
 
  <div class="container1 container-White py-10">
    <div align="right"><a href="show_department"><strong>>><u>Show Departments</u></strong></a></div>
    <div class="row">
        <div class="col-md-10 mx-auto">
        
       
<style>

.thick {
    font-weight: bold;
}
</style>

<div class="form-group row">

<div class="col-sm-6">
   <label for="" class="thick">Department Name In English <span style="color:red;">*</span></label>
<input class="form-control" type="text" ng-model="firstname" name="dept_name_E" autocomplete="off" placeholder="Enter Dept Name in English" required="" id="dept_name_E" /><br>
</div>

<div class="col-sm-6">
<label for="" class="thick">Department Name In Hindi <span style="color:red;"></span></label>
<input class="form-control" type="text" name="dept_name_H" autocomplete="off" placeholder="Enter Dept Name in Hindi" required="" id="dept_name_H"/><br>
</div>

</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       

<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="button"  value="Submit" id="add_dept"/>&nbsp;&nbsp;
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
    	
        $('#add_dept').click(function () {  	 
        	
        	if(document.getElementById('dept_name_H').value.trim()=="")
            	{
        		document.getElementById("dept_name_H").value = "  ";
            	}

        	if(document.getElementById('dept_name_E').value.trim()=="")
        	{
      alert('Please Fill Valid Deparment');
       return;
        	}
                
        	 $.ajax({
                 type: "POST",
                 url: "department_Insert",
                 data: {dept_name_H: document.getElementById('dept_name_H').value,
                	 dept_name_E:document.getElementById('dept_name_E').value
                	 
                	 
                 },
                 success: function(data){

            
            
         	var list = "";
        	var list = jQuery.parseJSON(data);
        
if(list==1)
	{
alert('Department successfully registered');
	}
else
	{
	alert('Please try again');
	}

document.getElementById("dept_name_H").value = "";
document.getElementById("dept_name_E").value = "";
                    	
                 }
             });
        	  
          
        });
            
            
        });
   

	
	</script>
	

	
	 <script src="resources/js/jsapi.js"></script>
	
	
	   <script type="text/javascript">

	       google.load("elements", "1", {
	           packages: "transliteration"
	       });
	       function onLoad() {
	           var options = {
	               sourceLanguage:
	               google.elements.transliteration.LanguageCode.ENGLISH,
	               destinationLanguage:
	               [google.elements.transliteration.LanguageCode.HINDI],
	               transliterationEnabled: true
	           };

	           // Create an instance on TransliterationControl with the required
	           // options.
	           var control =
	           new google.elements.transliteration.TransliterationControl(options);

	           
	           control.makeTransliteratable(['dept_name_H']);
	          
	         
	       }
	       google.setOnLoadCallback(onLoad);
	       function EndRequest(sender, args) {
	           debugger;
	           onLoad();
	           google.setOnLoadCallback(onLoad);
	       }
	
	</script>
   
   
   
    <%@ include file = "Footer.jsp" %>
    

