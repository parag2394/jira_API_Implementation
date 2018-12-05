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
        <li class="breadcrumb-item active"><b><span style="color:white;">Remove Sub_Departments</span></b></li>
      </ol>
      
     
      
  <div class="container1 container-White py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="deleteSubDepartmentInformation" method="post">
      


<div class="form-group row" align="centre">

<div class="col-sm-6">
 
</div>

</div>

<div class="form-group row">

<div class="col-sm-6">
<label for="" class="thick">Sub-Department name in english <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="subdept_name_E" autocomplete="off" placeholder="Enter SubDept Name in English" required="" id="subdept_name_E" value="<%=request.getParameter("dept_name_e") %>" readonly/><br>

</div>

<div class="col-sm-6">
   <label for="" class="thick">Sub-Department name in hindi <span style="color:red;"></span></label>
<input class="form-control" type="text" name="subdept_name_H" autocomplete="off" placeholder="Enter SubDept Name in Hindi" required="" id="subdept_name_H" value="<%=request.getParameter("dept_name_h") %>" readonly/><br>
   
</div>

</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       
<input id="dept_id" name="dept_id" type="hidden" value="<%=request.getParameter("dept_id") %>">
<input id="sub_dept_id" name="sub_dept_id" type="hidden" value="<%=request.getParameter("sub_dept_id") %>">
<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="submit"  value="Delete" />&nbsp;&nbsp;
<form action="show_sub_department">
<input class="butclass button" type="button"  value="Back" onclick="document.location.href='showSubDept.jsp';"/>
</form>


</div>

</div>

</form>

      </div>
      </div>
      </div>
      </div>
      
     
   
   
   
    <%@ include file = "Footer.jsp" %>
    

