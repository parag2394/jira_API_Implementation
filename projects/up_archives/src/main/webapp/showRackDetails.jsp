<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      <%@ page import="java.sql.*" %>
<%@ page import="com.up_archives.db.*" %>
<%ResultSet resultset =null;%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>
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
<%@ page import=" com.up_archives.util.*" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<%@ include file = "table_header.jsp" %>
   <i class="fa fa-table"></i> Rack Details</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
                <thead>
                <tr class="warning" >
                    <td ><h6>R_ID</h6></td>
                    <td><h6>Rack Code</h6></td>
                    <td><h6>Shelf Code</h6></td>
                    <td><h6>Sub Shelf Code</h6></td>
                    <td><h6>Edit</h6></td>
                     <td><h6>Delete</h6></td>

                </tr>
            </thead>
            <%
               
                	Dept d=new Dept();

SessionFactory sf = HibernateUtil.getSessionFactory();
    				Session session1=sf.openSession();
    				SQLQuery query = (SQLQuery) session1.createSQLQuery("SELECT * FROM public.show_department1()");
    				//.addEntity(User.class)
    				//.setParameter("deptid",d1.getDept_id());
    		
    		         List<Object[]> l=query.list();
    		
    		for(Object[] obj : l)
    		{
    			int dept_id=(Integer) obj[0];
    			String dept_name_e=String.valueOf(obj[1]);	
    			String dept_name_h=String.valueOf(obj[2]);		
    	             %>      
                <td><%=dept_id%></td>
                <td><%=dept_name_e%></td>
                <td><%=dept_name_h%></td>
                 <td><a href="edit_dept.jsp?dept_id=<%=dept_id%>&dept_name_h=<%=dept_name_h%>&dept_name_e=<%=dept_name_e%>">Click Here</a></td>
               <td><a href="del_dept.jsp?dept_id=<%=dept_id%>&dept_name_h=<%=dept_name_h%>&dept_name_e=<%=dept_name_e%>">Click Here</a></td>
                 </tr>
                			   
                	
            
            <%}
          session1.close();  
            %>
    	        
            </table>
          
   <%@ include file = "table_footer.jsp" %>