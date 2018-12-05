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
   <i class="fa fa-table"></i>Tables</div>
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
                	MenuMst M=new MenuMst();

            
SessionFactory sf = HibernateUtil.getSessionFactory();
    				Session session1=sf.openSession();
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
					&show_to_all=<%=showtoall%>&show_in_menu=<%=showinmenu%>&order_by=<%=orderby%>&enable=<%=enable%>">Click Here </a>
					
                 </td>
                 </tr>
            
            <%}            
            %>    	        
            </table>          
   
   <%@ include file = "table_footer.jsp" %>