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
        <li class="breadcrumb-item active"><b><span style="color:white;">Update Sub_Departments</span></b></li>
      </ol>
  <div class="container1 container-White py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="" method="post">
      


<div class="form-group row" align="centre">

<div class="col-sm-6">
<label for="" class="thick"><b>  Department Name - <span style="color:blue;"><%=request.getParameter("dept_id") %></span></b></label>
<br>
</div>
<div class="col-sm-6">
 
</div>

</div>

<div class="form-group row">


<div class="col-sm-6">
<label for="" class="thick">Sub-Department name in english <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="subdept_name_E" autocomplete="off" placeholder="Enter SubDept Name in English" required="" id="subdept_name_E" value="<%=request.getParameter("dept_name_e") %>"/><br>

</div>

<div class="col-sm-6">
   <label for="" class="thick">Sub-Department name in hindi <span style="color:red;"></span></label>
<input class="form-control" type="text" name="subdept_name_H" autocomplete="off" placeholder="Enter SubDept Name in Hindi" required="" id="subdept_name_H" value="<%=request.getParameter("dept_name_h") %>"/><br>
   
</div>

</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       
<input id="dept_id" name="dept_id" type="hidden" value="<%=request.getParameter("dept_id") %>">
<input id="sub_dept_id" name="sub_dept_id" type="hidden" value="<%=request.getParameter("sub_dept_id") %>">
<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="button"  value="Submit" id="updateSubDept" />&nbsp;&nbsp;
<form action=""><input class="butclass button" type="button"  value="Back" id="backPage" /></form>


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

	           
	           control.makeTransliteratable(['subdept_name_H']);
	          
	         
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
        	
        	window.location.href="showSubDept.jsp";
        	  
          
        });
            
            
        });
   

	
	</script>
   
   
   <script type="text/javascript">
	
	 /////
    
    $(function () {

    	

    	
        $('#updateSubDept').click(function () {  	 

        	
        	
        	

    	if(document.getElementById('subdept_name_E').value.trim()=="")
    	{
    alert('Please Fill Valid Sub Deparment');
    return;
    	}

    	if(document.getElementById('subdept_name_H').value.trim()=="" || document.getElementById('subdept_name_H').value==null)
    	{
    		document.getElementById("subdept_name_H").value =" ";
    	}
        	
              
        	 $.ajax({
                 type: "POST",
                 url: "updateSubDepartmentInformation",
                 data: {
                     sub_dept_id:document.getElementById('sub_dept_id').value,
                	 subdept_name_H:document.getElementById('subdept_name_H').value,
                	 subdept_name_E:document.getElementById('subdept_name_E').value
                	    	 
                 },
                 success: function(data){

            
            
         	var list = "";
        	var list = jQuery.parseJSON(data);
        
if(list==1)
	{
alert('Sub Department successfully updated');
	}
else
	{
	alert('Please try again');
	}

window.location.href="showSubDept.jsp";
                    	
                 }
             });
        	  
          
        });
            
            
        });
   

	
	</script>
	
   
   
    <%@ include file = "Footer.jsp" %>
    

