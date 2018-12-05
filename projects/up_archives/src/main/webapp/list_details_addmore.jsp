 <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
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
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<%@ include file = "header.jsp" %>

<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index.jsp"><b>Home</b></a>
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">List Detail</span></b></li>
      </ol>
      <div align="right"><a href=""><strong><mark>Show List Details</mark></strong></a></div>
  <div class="container1 py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="insertListDetails" method="post">
 <SCRIPT language=Javascript>    
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
         
         
        
      }
</script>     

<div class="form-group row">
<div class="col-sm-6">
<label for="">List ID<span style="color:red;">*</span></label>
<select name="list_id" size="1" id="list_id" required="" class="form-control" readonly>
<option value="Select" selected>Select</option> 

 
  


        </select>
        
</div>
<div class="col-sm-6">
 
<label for=""> Select Department<span style="color:red;">*</span></label>
<select name="list" size="1" id="list" required="" class="form-control" readonly>
<option value="Select" selected>Select</option>
      
       </select>
</div>

</div>

 <br>
 
 <div class="form-group row">
<div class="col-sm-6">
<label for="">Document Subject <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="doc_subject" autocomplete="off" placeholder="Enter Document Subject" required="" id="doc_subject" />
</div>
<div class="col-sm-6">
<label for="">Document Year From <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="doc_year_from" autocomplete="off" placeholder="Enter Document Year From" required="" id="doc_year_from" onkeypress="return isNumberKey(event)"/>

</div>
</div>
 
<div class="form-group row">

<div class="col-sm-6">
<label for="">Document Year To <span style="color:red;">*</span></label>
<input class="form-control" type="text" name="doc_year_to" autocomplete="off" placeholder="Enter Document Year To" required="" id="doc_year_to" onkeypress="return isNumberKey(event)"/><br>

</div>

<div class="col-sm-6">
<label for="">Room No. <span style="color:red;">*</span></label>
<select name="room_no" size="1" id="room_no" required="" class="form-control" readonly>
<option value="Select" selected>Select</option>

        </select>
  
</div>
</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="">Rack No.<span style="color:red;">*</span></label>
<select name="rack_no" size="1" id="rack_no" required="" class="form-control" readonly>
<option value="Select" selected>Select</option>

        </select>

</div>
<div class="col-sm-6">
<label for="">Rack Code <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="shelf_no" autocomplete="off" placeholder="Enter Rack Code" required="" id="shelf_no" readonly/>
</div>
</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="">Box No.<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="box_no" autocomplete="off" placeholder="Enter Box No." required="" id="box_no" onkeypress="return isNumberKey(event)"/><br>
</div>
<div class="col-sm-6">
<label for="">File No. <span style="color:red;">*</span></label>
<input class="form-control " type="text" name="file_no" autocomplete="off" placeholder="Enter File No." required="" id="file_no" onkeypress="return isNumberKey(event)"/>
</div>
</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="">Total Cover No.<span style="color:red;">*</span></label>
<input class="form-control" type="text" autocomplete="off" name="total_cover_no" placeholder="Enter Total Cover No." required="" id="total_cover_no" onkeypress="return isNumberKey(event)"/>
</div>
<div class="col-sm-6">
<label for="">Remark</label>
<input class="form-control" type="text" name="remark" autocomplete="off" placeholder="Enter Remark" id="remark" />

</div>
</div>
<p>All (<span style="color:red;">*</span>) fields are mandatory.


<div class="form-group row" >

<div class="col-sm-5"></div>
<input class="butclass button" type="submit"  value="Submit" />&nbsp;&nbsp;
<input class="butclass button" type="reset"  value="Reset" />&nbsp;&nbsp;
<input class="butclass button" type="button" value="Back" class="button_active" onclick="location.href='error.jsp';" />

</form>

</div>
</div>


 
      </div>
      </div>
      </div>
      </div>
      
     
   
   
   
    <%@ include file = "Footer.jsp" %>
    

