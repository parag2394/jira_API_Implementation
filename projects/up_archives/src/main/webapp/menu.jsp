<%@ page import="java.util.Iterator"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.up_archives.department.model.*" %>
<%@ page import="com.up_archives.subDepartment.model.*" %>
<%@ page import="com.up_archives.menu.model.*" %>
<%@ page import="com.up_archives.menu.daoImpl.*" %>
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




 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.jsp"><b>U.P. State Archives</b></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index.jsp">
            <i class="fa fa-fw fa-dashboard button2"></i>
            <span class="nav-link-text button1" style="color:white;"><b>Home</b></span>
            
            
            
          </a>
        </li>
        
        <%
        
        
        if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
       	 out.println("<script type=\"text/javascript\">");  
       		out.println("alert('Please login first to visit this page.');");  
       		out.println("location='logout.jsp';");
       		out.println("</script>"); 
       
        	

       } 
       
        else
        {
        Long userid=(Long)session.getAttribute("user_id");
        Integer user=Integer.valueOf(userid.intValue());
        session.setAttribute("user_id",userid);
        
      
try {

	
	AccessGetMenuDAO ad=new AccessGetMenuDAO();
	List<Object[]> l=ad.getMenuItem(user);
	for(Object[] obj : l)
	{

		GetMenuItem getMenu=new GetMenuItem();
		
		getMenu.setMenu_id((Integer) obj[0]);
		getMenu.setText_p(String.valueOf(obj[1]));
		getMenu.setDescription_d(String.valueOf(obj[2]));
		getMenu.setParent_id((Integer) obj[3]);
		getMenu.setNav_url(String.valueOf(obj[4]));
		getMenu.setOrder_by((Integer) obj[5]);
		%>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="<%=getMenu.getText_p()%>">
        <a class="nav-link" href="<%=getMenu.getNav_url()%>">
          <i class="fa fa-fw fa-clipboard button2"></i>
          <span class="nav-link-text button1" style="color:white;"><b><%=getMenu.getText_p()%></b></span>
        </a>
        
        <%
        if(getMenu.getText_p().equalsIgnoreCase("Reports"))
        { %>
        
        <ul class="nav-item list-unstyled" data-toggle="tooltip" data-placement="right">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="List of Lists">
        <a class="nav-link" href="show_combined_list.jsp">
          <i class="fa fa-fw"></i>
          <span class="nav-link-text button1" style="color:white;"><b>List of Lists</b></span>
        </a>
        </li>
        
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="List Details">
        <a class="nav-link" href="showListDetailsByDept.jsp">
          <i class="fa fa-fw"></i>
          <span class="nav-link-text button1" style="color:white;"><b>List Details</b></span>
        </a>
        </li>
        </ul>
        	
      <%   }
        %>
        
      </li>
		
	<% }
	
	}
	catch (Exception e) {
		e.printStackTrace();
	}
        }
%>
        
      
       
        
       
       
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class=""></i>
            <span class="d-lg-none">
              <span class="badge badge-pill badge-primary"></span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class=""></i>
            </span>
          </a>
          
        </li>
        <li class="nav-item dropdown">
          <a class=" mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class=""></i>
            <span class="d-lg-none">
              <span class="badge badge-pill badge-warning"></span>
            </span>
            <span class="indicator\ text-warning d-none d-lg-block">
              <i class=""></i>
            </span>
          </a>
          
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp" >
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>