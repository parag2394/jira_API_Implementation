 <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.up_archives.department.daoImpl.*"%>
<%@ page import="com.up_archives.lol.daoImpl.*"%>
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

<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index.html"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Delete From List Of List</span></b></li>
      </ol>
      
        <style>

.thick {
    font-weight: bold;
}
</style>
   
  <div class="container1 container-White py-10">
     <div align="right"><a href="show_list_of_list"><strong>>><u>Show List Of List</u></strong></a></div>
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="" method="">
      
 <SCRIPT language=Javascript>    
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
         
         
        
      }
</script>     

<%
    try{
    	AccessDeartmentDAO ad1=new AccessDeartmentDAO();
		Dept d=new Dept();
		List<Object[]> list=ad1.fetchDepartments();
%>

<div class="form-group row">


<div class="col-sm-6">
<label for="" class="thick">List No.<span style="color:red;">*</span></label>
<select name="list_id" size="1" id="list_id" required="" class="form-control" readonly>
 <option value=<%=request.getParameter("list_id") %>>List <%=request.getParameter("list_id") %></option>
<%
AccessListOfListDao ad=new AccessListOfListDao();
int list1=ad.get_List_id();
System.out.println("L "+list1);
%>

<% for(int i=1;i<list1;i++)
{
%>   
 <option value=<%=i%>>List <%=i%></option>
<%} %>
        </select>           
 </div>
 
 <div class="col-sm-6">
 
 <label for="" class="thick">Sub List</label>
<input class="form-control" type="text" name="sublist" autocomplete="off" value="<%=request.getParameter("sub_list") %>" maxlength="5" placeholder="Enter Sub List" required="" id="sublist" readonly/>

 </div>
 
     
 
    



</div>
        
       



 
 
<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick"> Select Department<span style="color:red;">*</span></label>
<select name="list" size="1" id="list" required="" class="form-control" readonly>
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


 <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>







<div class="col-sm-6">
<label for="" class="thick">Sub-Department<span style="color:red;">*</span></label>
<select name="subdept" size="1" id="subdept" required="" class="form-control" readonly>
<option value="<%=request.getParameter("dept_id") %>" selected><%=request.getParameter("dept_name") %></option>
        </select>
 
</div>


</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Document Year From <span style="color:red;">*</span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., 1975">(!)</a></label>
<input class="form-control " type="text" name="doc_year_from" autocomplete="off" value="<%=request.getParameter("doc_year_from")%>" placeholder="Enter Document Year From" required="" id="doc_year_from" onkeypress="return isNumberKey(event)" maxlength="4" readonly/>
</div>

<div class="col-sm-6">
<label for="" class="thick">Document Year To <span style="color:red;">*</span><a href="#" data-placement="right" data-toggle="tooltip" title="eg., 1999">(!)</a></label>
<input class="form-control" type="text" name="doc_year_to" autocomplete="off" value="<%=request.getParameter("doc_year_to")%>" placeholder="Enter Document Year To" required="" id="doc_year_to" onkeypress="return isNumberKey(event)" maxlength="4" readonly/>

</div>


</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Document Receive Date (DD/MM/YYYY)<span style="color:red;"></span></label>
<input class="form-control datepick" type="text" autocomplete="off" value="<%=request.getParameter("doc_receive_date")%>" name="doc_receive_date" placeholder="Enter Document Receive Date" required="" id="doc_receive_date" readonly/>
</div>

<div class="col-sm-6">
<label for="" class="thick">Remark</label>
<input class="form-control" type="text" name="remark" autocomplete="off" placeholder="Enter Remark" required="" id="remark" readonly/>

</div>
</div>
<p>All (<span style="color:red;">*</span>) fields are mandatory.


<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="button"  value="Delete" id="del_lol" />&nbsp;&nbsp;
<input class="butclass button" type="button" value="Back" class="button_active" onclick="location.href='show_list_of_list';" />
<input id="dept_id" name="dept_id" type="hidden" value="<%=request.getParameter("dept_id") %>">


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
    	
        $('#del_lol').click(function () {  	 
        	
        	
                
        	 $.ajax({
                 type: "POST",
                 url: "delList_Of_List",
                 data: {
                     list: document.getElementById('subdept').value,
                	 list_id:document.getElementById('list_id').value,
                	 doc_year_from:document.getElementById('doc_year_from').value,
                	 doc_year_to:document.getElementById('doc_year_to').value,
                	 sublist:document.getElementById('sublist').value
                	
                	     	 
                 },
                 success: function(data){

            
            
         	var list = "";
        	var list = jQuery.parseJSON(data);
        
if(list==1)
	{
alert('Data deleted');
	}
else
	{
	alert('Please try again');
	}

window.location.href = "show_ListOfList.jsp";
                    	
                 }
             });
        	  
          
        });
            
            
        });
   

	
	</script>
   
   
    <%@ include file = "Footer.jsp" %>
    

