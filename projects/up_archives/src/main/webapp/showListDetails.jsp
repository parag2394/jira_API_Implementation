
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
<%@ page import=" org.springframework.web.bind.annotation.RequestMapping" %>
<%@ page import=" org.springframework.web.servlet.ModelAndView" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<%@ page import=" com.up_archives.listDetails.daoImpl.*" %>
<%@ page import=" com.up_archives.listDetails.model.*" %>
<%@ include file = "table_header.jsp" %>
    <i class="fa fa-table"></i> List Details</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
             <thead>
                <tr class="warning" >
                   <td ><h6>S.NO</h6></td>
                    <td ><h6>List ID</h6></td>
                    <td><h6>Dept Name</h6></td>
                    <td><h6>Doc Subject</h6></td>
                    <td><h6>DOC YEAR (From - To)</h6></td>                 
                    <td><h6>Room no.</h6></td>
                    <td><h6>Rack no.</h6></td>
                    <td><h6>Shelf no.</h6></td>
                    <td><h6>Location Code</h6></td>
                    <td><h6>Box no.</h6></td>
                    <td><h6>File no.</h6></td>
                    <td><h6>Total Cover</h6></td>
                    <td><h6>Remark</h6></td>
                    <td><h6>Edit</h6></td>
                     <td><h6>Delete</h6></td>
                    
    
                </tr>
            </thead>
            <%
               
                	
           AccesslistDetailsDAO adao=new AccesslistDetailsDAO();
            List<Object[]> l=adao.getAllListDetails();
   		int i=0;
   		        for(Object[] obj : l)
   		        {
   		        ++i;	 
   		          int record_id=(Integer)obj[0];
   		     	  int list_id=(Integer)obj[1] ;
   		          String dept_name=String.valueOf(obj[2]) ;
   		          String doc_subject=String.valueOf(obj[3]);
   		          int doc_year_from=(Integer)obj[4];
   		          int doc_year_to=(Integer)obj[5];
   		          int room_no=(Integer)obj[6];
   		          int rack_no=(Integer)obj[7];
   		          String location_code=String.valueOf(obj[8]);
   		          String box_no=String.valueOf(obj[9]);
   		          String file_no=String.valueOf(obj[10]);
   		          int total_cover_no=(Integer)obj[11];
   		          String remark=String.valueOf(obj[12]);
                  String shelf_no=String.valueOf(obj[13]);
    				String sublist=String.valueOf(obj[14]);
    	             %>      
                 <td><%=i%></td>
                <td><%=list_id%><%=sublist%></td>
                <td><%=dept_name%></td>
                <td><%=doc_subject%></td>
                <td><%=doc_year_from%> - <%=doc_year_to%></td>
                  <td><%=room_no%></td>
                  <td><%=rack_no%></td>
                  <td><%=shelf_no%></td>
                  <td><%=location_code%></td>
                  <td><%=box_no%></td>
                  <td><%=file_no%></td>
                  <td><%=total_cover_no%></td>
                   <td><%=remark%></td>
                    
                   <td><a href="ld.jsp?record_id=<%=record_id%>&list_id=<%=list_id%>&dept_name=<%=dept_name%>&doc_subject=<%=doc_subject%>&doc_year_from=<%=doc_year_from%>&doc_year_to=<%=doc_year_to%>&room_no=<%=room_no%>&rack_no=<%=rack_no%>&location_code=<%=location_code%>&file_no=<%=file_no%>&box_no=<%=box_no%>&total_cover_no=<%=total_cover_no%>&remark=<%=remark%>&shelf_no=<%=shelf_no%>&sublist=<%=sublist%>">Click Here</a></td>
                   <td><a href="del_list_details.jsp?record_id=<%=record_id%>&list_id=<%=list_id%>&dept_name=<%=dept_name%>&doc_subject=<%=doc_subject%>&doc_year_from=<%=doc_year_from%>&doc_year_to=<%=doc_year_to%>&room_no=<%=room_no%>&rack_no=<%=rack_no%>&location_code=<%=location_code%>&file_no=<%=file_no%>&box_no=<%=box_no%>&total_cover_no=<%=total_cover_no%>&remark=<%=remark%>&shelf_no=<%=shelf_no%>&sublist=<%=sublist%>">Click Here</a></td>
                   

</tr>
                			     
            <%}
            
            %>
    	        
            </table>
        
   <%@ include file = "table_footer.jsp" %>