
<%@ include file = "header.jsp" %>

 <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import=" com.up_archives.department.daoImpl.*" %>
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

<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active"><span style="color:white;">Sub Department Master</span></li>
      </ol>
          
          <style>

.thick {
    font-weight: bold;
}
</style>

  <div class="container1 container-White py-10">
   <div align="right"><a href="showSubDept.jsp"><strong>>><u>Show SubDeparments</u></mark></strong></a></div>
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form>
      


<div class="form-group row" align="centre">

<div class="col-sm-6">

<%
try {
			AccessDeartmentDAO ad=new AccessDeartmentDAO();
			Dept d=new Dept();
			List<Object[]> list=ad.fetchDepartments();
			%>
			<label for="" class="thick"> Select Department<span style="color:red;">*</span></label>
<select name="dept" size="1" id="dept" required="" class="form-control">
<option value="0" >Select</option>
		<% 	for(Object[] obj:list)
			{
				d.setDept_id((Integer) obj[0]);
				d.setDept_name_E(String.valueOf(obj[1]));
				System.out.println(d.getDept_id());
				System.out.println(d.getDept_name_E());
				System.out.println();
				
			%>	

			 <option value=<%=d.getDept_id()%>><%=d.getDept_name_E()%></option>
		<%	}%>
		</select>
		<% 	}
			catch (Exception e) {
				e.printStackTrace();
			}
%>

</div>
</div>


<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Sub-Department Name In English <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="subdept_name_E" autocomplete="off" placeholder="Enter SubDept Name in English" required="" id="subdept_name_E" /><br>

</div>
<div class="col-sm-6">
   <label for="" class="thick">Sub-Department Name In Hindi <span style="color:red;"></span></label>
<input class="form-control" type="text" name="subdept_name_H" autocomplete="off" placeholder="Enter SubDept Name in Hindi" required="" id="subdept_name_H" /><br>
   
</div>

</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       

<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="button"  value="Submit" id="add_sub_dept"/>&nbsp;&nbsp;
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

    	

    	
        $('#add_sub_dept').click(function () {  	 

        	if (document.getElementById('dept').value=="0") {
                document.getElementById('dept').focus();
                alert("Please select department");
                return;
            }
        	
        	if(document.getElementById('subdept_name_H').value.trim()=="")
        	{
        		document.getElementById("subdept_name_H").value = "   ";
        	}

    	if(document.getElementById('subdept_name_E').value.trim()=="")
    	{
    alert('Please Fill Valid Sub Deparment');
    return;
    	}
        	
              
        	 $.ajax({
                 type: "POST",
                 url: "subDepartmentInsert",
                 data: {
                     dept: document.getElementById('dept').value,
                	 sub_dept_name_H:document.getElementById('subdept_name_H').value,
                	 sub_dept_name_E:document.getElementById('subdept_name_E').value
                	    	 
                 },
                 success: function(data){

            
            
         	var list = "";
        	var list = jQuery.parseJSON(data);
        
if(list==1)
	{
alert('Sub Department successfully registered');
	}
else
	{
	alert('Please try again');
	}

document.getElementById("subdept_name_H").value = "";
document.getElementById("subdept_name_E").value = "";
                    	
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

	           
	           control.makeTransliteratable(['subdept_name_H']);
	          
	         
	       }
	       google.setOnLoadCallback(onLoad);
	       function EndRequest(sender, args) {
	           debugger;
	           onLoad();
	           google.setOnLoadCallback(onLoad);
	       }
	
	</script>
   
    <%@ include file = "Footer.jsp" %>
    

