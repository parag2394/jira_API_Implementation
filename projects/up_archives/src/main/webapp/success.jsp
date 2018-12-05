 <%@ include file = "header.jsp" %>


<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>

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
<%@ page import="com.up_archives.department.model.*" %>
<%@ page import="com.up_archives.menu.daoImpl.*" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
         <li class="breadcrumb-item">
          <a href="index.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active"><mark>Enter Sub_Departments</mark></li>
      </ol>
           <div align="right"><a href="show_sub_department"><strong><mark>Show SubDeparments</mark></strong></a></div>
  <div class="container py-4">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="subDepartmentInsert" method="post">
      


<div class="form-group row" align="centre">

<div class="col-sm-6">
<label for=""> Select Department<span style="color:red;">*</span></label>
<select name="list" size="1" id="list" required="" class="form-control">
<option value="Select" selected>Select</option>
  <%
try {

	AccessGetMenuDAO ad=new AccessGetMenuDAO();
	List<Object[]> l=ad.getMenuItem(1);
	for(Object[] obj : l)
	{

		Dept d=new Dept();
		d.setDept_id((Integer) obj[0]);
		d.setDept_name_E(String.valueOf(obj[1]));
	
		
		%>
		 <option value=<%=d.setDept_id((Integer) obj[0])%>><%=d.setDept_name_E(String.valueOf(obj[1]))%></option>
      
        </select>
		
	<% }
	
	}
	catch (Exception e) {
		e.printStackTrace();
	}

%>

</div>

</div>

<div class="form-group row">

<div class="col-sm-6">
   <label for="">Sub-Department name in hindi <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="subdept_name_H" autocomplete="off" placeholder="Enter SubDept Name in Hindi" required="" id="subdept_name_H" /><br>
   
</div>
<div class="col-sm-6">
<label for="">Sub-Department name in english <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="subdept_name_E" autocomplete="off" placeholder="Enter SubDept Name in English" required="" id="subdept_name_E" /><br>

</div>
</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       

<div class="form-group row" >

<div class="col-sm-5"></div>
<input type="submit"  value="Submit" />&nbsp;&nbsp;
<input type="reset"  value="Reset" />


</div>

</div>

</form>

      </div>
      </div>
      </div>
      </div>
      
     
   
   
   
    <%@ include file = "Footer.jsp" %>
    

