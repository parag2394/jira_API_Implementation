<%@ include file = "header.jsp" %>

<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Update Departments</span></b></li>
      </ol>
  <div class="container1 container-White py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="" method="post">
      


<div class="form-group row">

<div class="col-sm-6">
   <label for="" class="thick">Department name in english <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="dept_name_E" autocomplete="off" placeholder="Enter Dept Name in English" required="" id="dept_name_E" value="<%=request.getParameter("dept_name_e") %>"/><br>
</div>
<div class="col-sm-6">
<label for="" class="thick">Department name in hindi <span style="color:red;"></span></label>
<input class="form-control" type="text" name="dept_name_H" autocomplete="off" placeholder="Enter Dept Name in Hindi" required="" id="dept_name_H" value="<%=request.getParameter("dept_name_h") %>"/><br>
</div>

</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       
<input id="dept_id" name="dept_id" type="hidden" value="<%=request.getParameter("dept_id") %>">
<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="button"  value="Update" id="updateDept" />&nbsp;&nbsp;
<form action=""><input class="butclass button" type="button"  value="Back" id="backPage"/>&nbsp;&nbsp;</form>



</div>

</div>

</form>

      </div>
      </div>
      </div>
      </div>
      
     
   
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
	
	
	
	
	
	
	
	<script type="text/javascript">
	
	 /////
    
    $(function () {
    	
        $('#backPage').click(function () {  	 
        	
        	window.location.href="showDept.jsp";
        	  
          
        });
            
            
        });
   

	
	</script>
	
	
	
	<script type="text/javascript">
	
	 /////
    
    $(function () {
    	
        $('#updateDept').click(function () {  	 
        	
        	if(document.getElementById('dept_name_H').value.trim()=="")
            	{
        		document.getElementById("dept_name_H").value = "  ";
            	}

        	if(document.getElementById('dept_name_E').value.trim()=="")
        	{
      alert('Please Fill Valid Department');
       return;
        	}
                
        	 $.ajax({
                 type: "POST",
                 url: "updateDepartmentInfo",
                 data: {dept_name_H: document.getElementById('dept_name_H').value,
                	 dept_name_E:document.getElementById('dept_name_E').value,
                	 dept_id:document.getElementById('dept_id').value
                	 
                	 
                 },
                 success: function(data){

            
            
         	var list = "";
        	var list = jQuery.parseJSON(data);
        
if(list==1)
	{
alert('Department successfully updated');
	}
else
	{
	alert('Please try again');
	}

window.location.href="showDept.jsp";
                    	
                 }
             });
        	  
          
        });
            
            
        });
   

	
	</script>
	
	
	
   
    <%@ include file = "Footer.jsp" %>
    

