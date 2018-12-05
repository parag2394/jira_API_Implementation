<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>
<%@ include file="header.jsp"%>
<%@ page import=" com.up_archives.util.*" %>
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index">Home</a></li>
		<li class="breadcrumb-item active">Menu Master</li>
	</ol>
	<div align="right">
<!-- 		<a href="show_MenuMaster"><strong><mark>Show Menu Master </mark></strong></a> -->
	</div>
	<div class="container container-White py-4">
		<div class="row">
		
			<div class="col-md-10 mx-auto">

<form action="menuMasterInsert" method="post">				
<div class="form-group row" align="centre">

<div class="col-sm-6">
<label for="">Text <span style="color: red;">*</span></label> 
<input class="form-control" type="text" name="text" autocomplete="off" placeholder="Enter Text" required="" id="text" />

<br>
</div>
<div class="col-sm-6">
<label for="">Description<span style="color: red;">*</span></label>
<input class="form-control" type="text" name="description" autocomplete="off" placeholder="Enter Description" required="" id="description" />
<br>
</div>
					</div>

<div class="form-group row">
<div class="col-sm-6">
<label for="">Parent Id <span style="color: red;">*</span></label>
<!-- <input class="form-control" type="text" name="parentid" autocomplete="off" placeholder="Enter Parent Id" required="" id="parentid" /> -->
<!-- The Value Comes from DB in DD-->
<select name="parentid" size="1" id="parentid" required="" class="form-control">
<option value="Select" selected>Select</option>
	<option value=1>1</option>
	<option value=2>2</option>
</select>
<!-- The Value Comes from DB -->
<br>

						</div>
						<div class="col-sm-6">
<label for="">Nav URL <span style="color: red;">*</span></label>
<input class="form-control" type="text" name="navurl" autocomplete="off" placeholder="Enter Nav URL" required="" id="navurl" /><br>
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


<input class="form-control" type="text" name="orderby" autocomplete="off" placeholder="Enter Only Numeric Values" required="" id="orderby" /><br>

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
<input type="reset" value="Reset" />
</div>
</div>
</form>		
<div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>List Of List</div>
        <div class="card-body">
        <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr class="warning">
							<td><h6>Menu ID</h6></td>
							<td><h6>Text</h6></td>
							<td><h6>Description</h6></td>
							<td><h6>Parent ID</h6></td>
							<td><h6>Nav URL</h6></td>
							<td><h6>Show To All</h6></td>
							<td><h6>Show in Menu</h6></td>
							<td><h6>Order By</h6></td>
							<td><h6>Enable</h6></td>
							
							<td><h6>Edit</h6></td>
						</tr>
					</thead>
<%
MenuMst d = new MenuMst();

SessionFactory sf = HibernateUtil.getSessionFactory();
Session session1 = sf.openSession();
//show_menu_mst
SQLQuery query = (SQLQuery) session1.createSQLQuery("SELECT * FROM public.show_menu_mst()");
List<Object[]> l = query.list();

for (Object[] obj : l) {
int menuid = (Integer) obj[0];
String text = (String) obj[1];
String description = (String) obj[2];
int parentid = (Integer) obj[3];
String navurl = (String) obj[4];

String showtoall = (String) obj[5].toString();
String showinmenu = (String) obj[6].toString();
int orderby = (Integer) obj[7];
String enable = (String) obj[8].toString();
					%>
					
					<td><%=menuid%></td>
					<td><%=text%></td>
					<td><%=description%></td>
					<td><%=parentid%></td>
					<td><%=navurl%></td>
					<td><%=showtoall%></td>
					<td><%=showinmenu%></td>
					<td><%=orderby%></td>
					<td><%=enable%></td>
					
					<td>
					<a href="editMenuMst.jsp?menu_id=<%=menuid%>&text=<%=text%>&description=<%=description%>&parentid=<%=parentid%>&navurl=<%=navurl%>
					&show_to_all=<%=showtoall%>&show_in_menu=<%=showinmenu%>&order_by=<%=orderby%>&enable=<%=enable%>">
							Click Here </a>
							</td>
					</tr>
					<%
						}
					%>
				</table>
					</div>
			
			</div>		
		</div>
	</div>
	
          </div>
        </div>
        <div class="card-footer small text-muted"></div>
      </div>
    </div>
    
			<!-- EDIT -->

</div>

<%@ include file="Footer.jsp"%>