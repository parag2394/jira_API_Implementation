<%@ include file = "header.jsp" %>

<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Remove Department</span>s</b></li>
      </ol>
      
      
        <style>

.thick {
    font-weight: bold;
}
</style>
      
  <div class="container1 container-White py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="deleteDepartment" method="post">
      


<div class="form-group row">

<div class="col-sm-6">
   <label for="" class="thick">Department name in english <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="dept_name_E" autocomplete="off" placeholder="Enter Dept Name in English" required="" id="dept_name_E" value="<%=request.getParameter("dept_name_e") %>" readonly/><br>
</div>

<div class="col-sm-6">
<label for="" class="thick">Department name in hindi <span style="color:red;"></span></label>
<input class="form-control" type="text" name="dept_name_H" autocomplete="off" placeholder="Enter Dept Name in Hindi" required="" id="dept_name_H" value="<%=request.getParameter("dept_name_h") %>" readonly/><br>
</div>

</div>
 <p>All (<span style="color:red;">*</span>) fields are mandatory.       
<input id="dept_id" name="dept_id" type="hidden" value="<%=request.getParameter("dept_id") %>">
<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="submit"  value="Delete" />&nbsp;&nbsp;
<form action="">
<input class="butclass button" type="button"  value="Back" onclick="document.location.href='showDept.jsp';"/>
&nbsp;&nbsp;
</form>



</div>

</div>

</form>

      </div>
      </div>
      </div>
      </div>
      
     
   
   
   
    <%@ include file = "Footer.jsp" %>
    

