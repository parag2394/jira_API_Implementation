
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
<%@ page import=" com.up_archives.lol.model.*" %>
<%@ include file = "table_header.jsp" %>
    <i class="fa fa-table"></i> List Of Lists</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
             <thead>
                <tr class="warning" >
                   <td ><h6>S.No</h6></td>
                    <td ><h6>List ID</h6></td>
                    <td><h6>Dept Name</h6></td>
                    <td><h6>DOC YEAR (From - To)</h6></td>                 
                    <td><h6>DOC Receive Date</h6></td>
                    <td><h6>Remark</h6></td>
                    <td><h6>Edit</h6></td>
                     <td><h6>Delete</h6></td>
                    
    
                </tr>
            </thead>
            <%
               
                	
            ListOfList d=new ListOfList();

SessionFactory sf = HibernateUtil.getSessionFactory();
    				Session session1=sf.openSession();
    				Transaction tx=session1.beginTransaction();
    				SQLQuery query = (SQLQuery) session1.createSQLQuery("SELECT * FROM public.show_list_of_list_new()");
   				    List<Object[]> l=query.list();
   		int i=0;
   		        for(Object[] obj : l)
   		        {
   			     ++i;
   			     int list_id=(Integer) obj[0];
   			     int dept_id=(Integer) obj[1];
   			     String dept_name=(String)obj[2];
   
   			     
   			     int doc_year_from=(Integer) obj[3];
   			     int doc_year_to=(Integer) obj[4];
   			  java.sql.Timestamp doc_receive_date=(java.sql.Timestamp) obj[5];
   			     String remark=(String)obj[6];
   			     String sub_list=(String)obj[7];
   			     if(sub_list==null || sub_list=="")
   			     {
   			    	 sub_list="";
   			     }
  
  	
    				
    	             %>      
                <td><%=i%></td>
                <td><%=list_id%><%=sub_list%></td>
                <td><%=dept_name%></td>
                <td><%=doc_year_from%> - <%=doc_year_to%></td>
                  <td><%=doc_receive_date%></td>
                   <td><%=remark%></td>
                   <td><a href="edit_list.jsp?list_id=<%=list_id%>&dept_id=<%=dept_id%>&dept_name=<%=dept_name%>&doc_year_from=<%=doc_year_from%>&doc_year_to=<%=doc_year_to%>&doc_receive_date=<%=doc_receive_date%>&remark=<%=remark%>&sub_list=<%=sub_list%>">Click Here</a></td>
                     <td><a href="del_list_of_list.jsp?list_id=<%=list_id%>&dept_id=<%=dept_id%>&dept_name=<%=dept_name%>&doc_year_from=<%=doc_year_from%>&doc_year_to=<%=doc_year_to%>&doc_receive_date=<%=doc_receive_date%>&remark=<%=remark%>&sub_list=<%=sub_list%>">Click Here</a></td>
                 </tr>
                			     
            <%}
          session1.close();  
            %>
    	        
            </table>
        
   <%@ include file = "table_footer.jsp" %>