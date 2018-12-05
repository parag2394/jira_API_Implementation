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
        <li class="breadcrumb-item active"><b><span style="color:white;">Update Menu Master Details</span></b></li>
      </ol>
  <div class="container1 container-White py-10">
    <div class="row">
        <div class="col-md-10 mx-auto">
        
      <form action="updateMenuMstInfo" method="post">      
<div class="form-group row">
<div class="col-sm-6">


<input class="form-control" type="hidden" name="menuid" autocomplete="off" placeholder="Enter Text" required="" id="menuid" value="<%=request.getParameter("menu_id") %>"/>


<label for="">Text <span style="color: red;">*</span></label> 
<input class="form-control" type="text" name="text" autocomplete="off" placeholder="Enter Text" required="" id="text" value="<%=request.getParameter("text") %>"/>

<br>
</div>
<div class="col-sm-6">
<label for="">Description<span style="color: red;">*</span></label>
<input class="form-control" type="text" name="description" autocomplete="off" placeholder="Enter Description" value="<%=request.getParameter("description") %>" required="" id="description" />
<br>
</div>
</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="">Parent Id <span style="color: red;">*</span></label>
<!-- <input class="form-control" type="text" name="parentid" autocomplete="off" placeholder="Enter Parent Id"  required="" id="parentid" /> -->
<!-- The Value Comes from DB in DD-->
<select name="parentid" size="1" id="parentid" required="" value="<%=request.getParameter("parentid") %>" class="form-control">
<option value="Select" selected>Select</option>
	<option value=1>1</option>
	<option value=2>2</option>
</select>
<!-- The Value Comes from DB -->
<br>
</div>
<div class="col-sm-6">
<label for="">Nav URL <span style="color: red;">*</span></label>
<input class="form-control" type="text" name="navurl" autocomplete="off" value="<%=request.getParameter("navurl") %>" placeholder="Enter Nav URL" required="" id="navurl" /><br>
						</div>
					</div>
<div class="form-group row">
<div class="col-sm-6">
<label for="">Show To All <span style="color: red;">*</span></label>
<!-- <input class="form-control" type="text" name="showtoall" autocomplete="off" placeholder="Enter Show To All" required="" id="showtoall" /> -->
 &emsp;&emsp;
<input type="radio" name="showtoall" value="Y">Y
<input type="radio" name="showtoall" value="N">N
<br>
<br>
						</div>
						<div class="col-sm-6">
<label for="">Show In Menu <span style="color: red;">*</span></label>
<!-- <input class="form-control" type="text" name="showinmenu" autocomplete="off" placeholder="Enter Show in Menu" required="" id="showinmenu" /> -->
 &emsp;&emsp;
<input type="radio" name="showinmenu" value="Y">Y
<input type="radio" name="showinmenu" value="N">N <br>
            <br>
</div>
</div>
<div class="form-group row">
<div class="col-sm-6">
<label for="">Order By <span style="color: red;">*</span></label>

<input class="form-control" type="text" name="orderby" value="<%=request.getParameter("order_by") %>" autocomplete="off" placeholder="Enter Only Numeric Values" required="" id="orderby"/><br>

						</div>
						<div class="col-sm-6">
<label for="">Enable <span style="color: red;">*</span></label> &emsp;&emsp;
<!-- <input class="form-control" type="text" name="enable" autocomplete="off" placeholder="Enter Show in Enable" required="" id="enable" /> -->
<input type="radio" name="enable" value="Y">Y
<input type="radio" name="enable" value="N">N
<br>
	</div>
	</div>										
					<p>
All (<span style="color: red;">*</span>) fields are mandatory.
<div class="form-group row">

						<div class="col-sm-5"></div>
<input type="submit" value="Submit" />&nbsp;&nbsp; 
<form action="show_menu_mst">

<input type="reset" value="Reset" />
					</div>		
					</form>	

      </div>
      </div>
      </div>
      </div>
             
    <%@ include file = "Footer.jsp" %>    