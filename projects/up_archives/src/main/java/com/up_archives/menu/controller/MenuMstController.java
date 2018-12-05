package com.up_archives.menu.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.up_archives.db.ConnectionFactory;
import com.up_archives.menu.daoImpl.MenuMstDAOImpl;
import com.up_archives.menu.model.MenuMst;



@Controller
public class MenuMstController {
	
	Statement stmt = null;
	ResultSet rs=null;
	@RequestMapping("/menuMasterInsert")
	public ModelAndView insertMenuMst(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			MenuMst m = new MenuMst();
			m.setText(request.getParameter("text"));
			m.setDescription(request.getParameter("description"));
			
			/*List<Integer> parentid=new ArrayList<Integer>();
			parentid.add(1);
			parentid.add(2);
			m.setParentId(Integer.parseInt(request.getParameter("parentid")));
			*/
			m.setParentId(Integer.parseInt(request.getParameter("parentid")));
			m.setNavurl(request.getParameter("navurl"));
			
			List<String> showtoall=new ArrayList<String>();
			showtoall.add("Yes");
			showtoall.add("No");	
//			String s=request.getParameter("showtoall");
//			m.setShowtoall(s.charAt(0));
			m.setShowtoall(request.getParameter("showtoall").charAt(0));
//			m.setShowtoall((Character)request.getParameter("showtoall"));
			
			List<String> showinmenu=new ArrayList<String>();
			showtoall.add("Yes");
			showtoall.add("No");
			m.setShowinmenu(request.getParameter("showinmenu").charAt(0));
			
			
			m.setOrderby(Integer.parseInt(request.getParameter("orderby")));
			
			List<String> enable=new ArrayList<String>();
			showtoall.add("Yes");
			showtoall.add("No");
			m.setEnable(request.getParameter("enable").charAt(0));					
			
			// int c = r.getRoomnum() + r.getRacknum();
			// System.out.println(c);
			System.out.println(m.getText());
			System.out.println(m.getDescription());
			System.out.println(m.getParentId());
			System.out.println(m.getNavurl());
			System.out.println(m.getShowtoall());
			System.out.println(m.getShowinmenu());
			System.out.println(m.getOrderby());
			System.out.println(m.getEnable());
		
			Configuration con = new Configuration().configure().addAnnotatedClass(MenuMst.class);
			ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
			SessionFactory sf = con.buildSessionFactory(reg);
			Session session = sf.openSession();
			Transaction tx = session.beginTransaction();
			session.persist(m);
			tx.commit();

			mv.setViewName("menuMasterInsert.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error.jsp");
		}
		return mv;
	}	
	
	@RequestMapping("/updateMenuMstInfo")
	public ModelAndView updateMenuMst(
			@RequestParam("menuid")int menuid,
			@RequestParam("text")String text,
			@RequestParam("description")String description,
			@RequestParam("parentid")int parentid,
			@RequestParam("navurl")String navurl,
			@RequestParam("showtoall")Character showtoall,
			@RequestParam("showinmenu")Character showinmenu,
			@RequestParam("orderby")int orderby,
			@RequestParam("enable")Character enable,
			HttpServletRequest request,HttpServletResponse response)
	{
	ModelAndView mv=new ModelAndView();
	try
	{
		MenuMstDAOImpl menuMstImpl=new MenuMstDAOImpl();
		MenuMst m=new MenuMst();
		menuMstImpl.updateMenuMst(menuid, text, description, parentid, navurl, showinmenu, showtoall, orderby, enable);

		mv.setViewName("showMenuMst.jsp");
	}
    catch (Exception e)
	{
	e.printStackTrace();
    }	
	return mv;
	}
	
	@RequestMapping("/menuMst")
	public ModelAndView fetchDept(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			PrintWriter out = response.getWriter(  );
		    response.setContentType("text/html");
		    
		    MenuMst m = new MenuMst();
		    m.setText(request.getParameter("text"));
			m.setDescription(request.getParameter("description"));
			
			/*List<Integer> parentid=new ArrayList<Integer>();
			parentid.add(1);
			parentid.add(2);
			m.setParentId(Integer.parseInt(request.getParameter("parentid")));
			*/
			m.setParentId(Integer.parseInt(request.getParameter("parentid")));
	
			m.setNavurl(request.getParameter("navurl"));
			
			List<String> showtoall=new ArrayList<String>();
			showtoall.add("Yes");
			showtoall.add("No");
			m.setShowtoall(request.getParameter("showtoall").charAt(0));
			
			List<String> showinmenu=new ArrayList<String>();
			showtoall.add("Yes");
			showtoall.add("No");
			m.setShowinmenu(request.getParameter("showinmenu").charAt(0));
			m.setOrderby(Integer.parseInt(request.getParameter("orderby")));
			
			List<String> enable=new ArrayList<String>();
			showtoall.add("Yes");
			showtoall.add("No");
			m.setEnable(request.getParameter("enable").charAt(0));
		    
		    Connection connection = ConnectionFactory.getConnection();
		    stmt = connection.createStatement();
			String query = "select * from tbl_menumst where text='"+request.getParameter("text")+"' "
					+ "description='"+request.getParameter("description")+"'"
					+
					"parentid='"+request.getParameter("parentid")+"'"
					+"navurl='"+request.getParameter("navurl")+"'"
					+"showtoall='"+request.getParameter("showtoall")+"'"
					+"showinmenu'"+request.getParameter("showinmenu")+"'"
					+"orderby='"+request.getParameter("orderby")+"'";
			rs = stmt.executeQuery(query);
			if(rs.next())
			{
				mv.setViewName("####.jsp");				
			}
			else
			{
				mv.setViewName("notFound.jsp");				
			}		    
		} catch (Exception e) 
		{
			mv.setViewName("error.jsp");
		}
		return mv;
	}
}