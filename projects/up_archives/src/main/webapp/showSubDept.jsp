
 <%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.up_archives.db.*" %>
<%@ page import="com.up_archives.subDepartment.model.*" %>
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
<%@ include file = "table_header.jsp" %>
   <i class="fa fa-table"></i> List Of Sub-Departments</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
                 <thead>
                <tr class="warning" >
                    <td><h6>S.No</h6></td>
                    <td><h6>Department</h6></td>
                    <td><h6>Sub_Dept_Name_English</h6></td>
                    <td><h6>Sub_Dept_Name_Hindi</h6></td>
                    <td><h6>Edit</h6></td>
                     <td><h6>Delete</h6></td>
                </tr>
            </thead>
            <%
               
                	SubDept d=new SubDept();

SessionFactory sf = HibernateUtil.getSessionFactory();
    				Session session1=sf.openSession();
    				SQLQuery query = (SQLQuery) session1.createSQLQuery("SELECT * FROM public.show_sub_department()");
    				
    		    List<Object[]> l=query.list();
    		int i=0;
    		for(Object[] obj : l)
    		{
    			++i;
    			String dept_id=String.valueOf(obj[0]);
    			int sub_dept_id=(Integer) obj[1];
    			String dept_name_e=String.valueOf(obj[2]);	
    			String dept_name_h=String.valueOf(obj[3]);		
    	             %>      
                <td><%=i%></td>
                
                <td><%=dept_id%></td>
                <td><%=dept_name_e%></td>
                <td><%=dept_name_h%></td>
                <td><a href="editSubDept.jsp?dept_id=<%=dept_id%>&sub_dept_id=<%=sub_dept_id%>&dept_name_h=<%=dept_name_h%>&dept_name_e=<%=dept_name_e%>">Click Here</a></td>
                <td><a href="del_SubDept.jsp?dept_id=<%=dept_id%>&sub_dept_id=<%=sub_dept_id%>&dept_name_h=<%=dept_name_h%>&dept_name_e=<%=dept_name_e%>">Click Here</a></td>
               
                </tr>
                			   
                	
            
            <%}
            session1.close();
            %>
            </table>
          
   <%@ include file = "table_footer.jsp" %>