

      <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import=" com.up_archives.util.*" %>
<%@ page import =" org.hibernate.Query"%>
<%@ page import=" org.hibernate.Session" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import=" org.hibernate.Transaction" %>
<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.service.ServiceRegistry" %>
<%@ page import=" org.hibernate.service.ServiceRegistryBuilder" %>
<%@ page import=" org.springframework.stereotype.Controller" %>
<%@ page import="com.up_archives.metadata.daoImpl.*" %>
<%@ page import=" org.springframework.web.bind.annotation.RequestMapping" %>
<%@ page import=" org.springframework.web.servlet.ModelAndView" %>

<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<%@ include file = "table_header.jsp" %>
   <i class="fa fa-table"></i>List Of Meta Data</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
                <thead>
                <tr class="warning" >
                    <td ><h6>S.No</h6></td>
                    <td><h6>List ID</h6></td>
                    <td><h6>Department</h6></td>
                    <td><h6>Room No.</h6></td>
                    <td><h6>Rack No.</h6></td>
                    <td><h6>Shelf No.</h6></td>
                    <td><h6>Box No.</h6></td>
                    <td><h6>File No.</h6></td>
                    <td><h6>Cover No.</h6></td>
                    <td><h6>Year(From - To)</h6></td>
                    <td><h6>File Name</h6></td>
                    <td><h6>Subject</h6></td>
                    <td><h6>Remark</h6></td>
                    
                    <td><h6>Edit</h6></td>
                    <td><h6>Delete</h6></td>
                    <td><h6>View</h6></td>
                     </tr>
            </thead>

<%
String file_name="";
int i=0;
int record_id=0;
int list_id=0;
String sub_list_id="";
int room_no=0;
String sub_dept_name_e="";
int rack_no=0;
String shelf_no="";
String box_no="";
String file_no="";
int total_cover_no=0;
int doc_year_from=0;
int doc_year_to=0;
String doc_path="";
String doc_subject="";
String remark="";

try {
	AccessMetaDataDAO ad=new AccessMetaDataDAO();
	List<Object[]> l=ad.show_documnet_metadata();
	
	for(Object[] obj : l)
	{
		++i;
		 record_id=(Integer) obj[0];
		 list_id=(Integer) obj[1];
		 sub_list_id=String.valueOf(obj[2]);
		 room_no=(Integer) obj[3];
		 sub_dept_name_e=String.valueOf(obj[4]);
		 rack_no=(Integer) obj[5];
		 shelf_no=String.valueOf(obj[6]);
		 box_no=String.valueOf(obj[7]);
		 file_no=String.valueOf(obj[8]);
		 total_cover_no=(Integer) obj[9];
		 doc_year_from=(Integer) obj[10];
		 doc_year_to=(Integer) obj[11];
		 doc_path=String.valueOf(obj[12]);
		 doc_subject=String.valueOf(obj[13]);
		remark=String.valueOf(obj[14]);
		 file_name=String.valueOf(obj[15]);
		
		 %>  
		 <tr>    
         <td><%=i%></td>
         <td><%=list_id%><%=sub_list_id%></td>
         <td><%=sub_dept_name_e%></td>
         <td><%=room_no%></td>
         <td><%=rack_no%></td>
         <td><%=shelf_no%></td>
         <td><%=box_no%></td>
         <td><%=file_no%></td>
         <td><%=total_cover_no%></td>
         <td><%=doc_year_from%>-<%=doc_year_to%></td>
         <td><%=file_name%></td>
        <td><%=doc_subject%></td>
         <td><%=remark%></td>
         
         <input type="hidden" id="pdf_file_name" value="<%=file_name%>" >
         
         
           <td><%=remark%></td>
         <td><%=remark%></td>
          <td>
          
           <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="show_doc">View</button> 
<!--           <button type="button" class="btn btn-info btn-lg" onclick="javascript:window.open('BankStatement.pdf')">View</button> -->
          </td>
       
         
          </tr>
	<% }
	
	
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


               
            
               
    	        
            </table>
            
         
         
           <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                    
                   
                    
                    <h5><b>Department <span style="color:blue"><%=sub_dept_name_e%></span>
                    <span style="color:red">/</span> List No. <span style="color:blue"><%=list_id%><%=sub_list_id%></span>
                    <span style="color:red">/</span> File No. <span style="color:blue"><%=file_no%></span>
                    <span style="color:red">/</span> Cover No. <span style="color:blue"><%=total_cover_no%></span>
                    <span style="color:red">/</span> Subject <span style="color:blue"><%=doc_subject%></span>
                    <span style="color:red">/</span> Years <span style="color:blue"><%=doc_year_from%>-<%=doc_year_to%></span></b>
                        </h5><button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                       <div style="clear:both">
                       
                        
                        
         <iframe src="resources/temp_pdf_files/<%=file_name%>" id="viewer"  frameborder="0" scrolling="no" width="100%" height="600"></iframe> 
       
<!--        <object data="~/BankStatement.pdf" type="application/pdf" width="500px" height="300px" internalinstanceid="440">If you are unable to view file, you can download from <a href="uppscpre18h.pdf">here</a> or download <a target="_blank" href="http://get.adobe.com/reader/">Adobe PDF Reader</a> to view the file.</object> -->
        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                           
                            
               
                  
                    
               
                        </div>
                    </div>

                </div>
            </div>
        </div>
         
            
   <script src="resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	
	 /////
    
    $(function () {

    	

    	
        $('').click(function () {  	 

        	 var m3=document.getElementById('pdf_file_name').value;
        	alert(m3);
             
        	 $.ajax({
                 type: "POST",
                 url: "fetchMetaDataDocument",
                 data: {
                     file_name:document.getElementById('pdf_file_name').value
                	
                	 	 
                 },
                 success: function(data){

            
            
         	var list = "";
        	var list = jQuery.parseJSON(data);
        
if(list==document.getElementById('pdf_file_name').value)
	{
alert(list);
	}
else
	{
	alert('Please try again');
	}


                    	
                 }
             });
        	  
          
        });
            
            
        });
   

	
	</script>
	

	 
	
         
   <%@ include file = "table_footer.jsp"%>