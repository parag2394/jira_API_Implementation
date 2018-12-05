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
<%@ page import=" com.up_archives.RRS.model.*" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>
<%@ include file = "table_header.jsp" %>
   <i class="fa fa-table"></i> Room,Rack & Shelfs</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
               <thead>
                <tr class="warning" >
                   <td><h6>S.No</h6></td>
                   
                    <td ><h6>Room No.</h6></td>
                    <td><h6>Rack No.</h6></td>
                    <td><h6>Total Shelfs</h6></td>
                    <td><h6>Total Books in Shelf</h6></td>
                    <td><h6>Edit</h6></td>
                    <td><h6>Delete</h6></td>
                </tr>
            </thead>
            <%
               
                	RoomRackShelfs d=new RoomRackShelfs();

SessionFactory sf = HibernateUtil.getSessionFactory();
    				Session session1=sf.openSession();
    				//show_room_rack_shelfs
    				SQLQuery query = (SQLQuery) session1.createSQLQuery("SELECT * FROM public.show_room_rack_shelfs()");
    				 List<Object[]> l=query.list();
    		int i=0;
    		for(Object[] obj : l)
    		{
    			++i;
    			int r_id=(Integer) obj[0];
    			int room_no=(Integer) obj[1];
    			int rack_no=(Integer) obj[2];
    			int total_shelf=(Integer) obj[3];
    			int total_box_in_single_shelf=(Integer) obj[4];
    					
    	             %>
    	              <td><%=i%></td>      
              
                <td><%=room_no%></td>
                <td><%=rack_no%></td>
                <td><%=total_shelf%></td>
                <td><%=total_box_in_single_shelf%></td>
                <td><a href="editRoomRackShelfs.jsp?r_id=<%=r_id%>&room_no=<%=room_no%>&rack_no=<%=rack_no%>&total_shelf=<%=total_shelf%>&total_box_in_single_shelf=<%=total_box_in_single_shelf%>">Click Here</a></td>
                    <td><a href="delRoomRackShelfs.jsp?r_id=<%=r_id%>&room_no=<%=room_no%>&rack_no=<%=rack_no%>&total_shelf=<%=total_shelf%>&total_box_in_single_shelf=<%=total_box_in_single_shelf%>">Click Here</a></td>
                 </tr>
                			   
                	
            
            <%}
    				
            session1.close();
            %>
            </table>
          
   <%@ include file = "table_footer.jsp" %>