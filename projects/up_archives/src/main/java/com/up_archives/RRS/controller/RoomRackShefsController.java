package com.up_archives.RRS.controller;

import java.io.PrintWriter;
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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.up_archives.RRS.daoImpl.AccessRoomRackShelfsDAO;
import com.up_archives.RRS.model.RoomRackShelfs;


@Controller
public class RoomRackShefsController
{

	@RequestMapping("/roomRackShelfs")
	public ModelAndView fetchRoomRackShelfs(HttpServletRequest request,HttpServletResponse response)
	{
		
        ModelAndView mv=new ModelAndView();
		
		try 
		{
			PrintWriter out = response.getWriter(  );
		    response.setContentType("text/html");
		    
		    RoomRackShelfs r=new RoomRackShelfs();
		    r.setRoomnum(Integer.parseInt(request.getParameter("roomnum")));
		    r.setRacknum(Integer.parseInt(request.getParameter("racknum")));
		    r.setTotalshelf(Integer.parseInt(request.getParameter("totalshelf")));
		    r.setTotalbook(Integer.parseInt(request.getParameter("totalbook")));
		    
		    mv.setViewName("inserted.jsp");
		} catch (Exception e) 
		{
			mv.setViewName("error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/roomRackShelfsUpdate")
	public ModelAndView roomRackShelfsUpdate(@RequestParam("r_id")int r_id,@RequestParam("roomnum")int room_no,@RequestParam("racknum")int rack_no,@RequestParam("totalshelf")int total_shelf,@RequestParam("totalbook")int total_box_in_single_shelf,HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			AccessRoomRackShelfsDAO ar=new AccessRoomRackShelfsDAO();
			ar.updateRoomRackShelfs(r_id, room_no, rack_no, total_shelf,total_box_in_single_shelf);
			mv.setViewName("showRoomRackShelfs.jsp");
		}
		catch (Exception e)
		{
		e.printStackTrace();	
		}
		return mv;
	}
	
	
	@RequestMapping("/roomRackShelfsInsert")
	public ModelAndView insertRoomRackShelfs(HttpServletRequest request,HttpServletResponse response)
	{
		
        ModelAndView mv=new ModelAndView();
		
		try 
		{
			PrintWriter out = response.getWriter(  );
		    response.setContentType("text/html");
		    
		    RoomRackShelfs r=new RoomRackShelfs();
		    r.setRoomnum(Integer.parseInt(request.getParameter("roomnum")));
		    r.setRacknum(Integer.parseInt(request.getParameter("racknum")));
		    r.setTotalshelf(Integer.parseInt(request.getParameter("totalshelf")));
		    r.setTotalbook(Integer.parseInt(request.getParameter("totalbook")));
		    r.setTotal_subselfInself(Integer.parseInt(request.getParameter("total_subselfInself")));
		    r.setTotal_boxinSubself(Integer.parseInt(request.getParameter("total_boxinSubself")));
		    r.setTotalSubselfinRack(Integer.parseInt(request.getParameter("totalSubselfinRack")));
		    r.setTotalBoxesinRack(Integer.parseInt(request.getParameter("totalBoxesinRack")));
		
		   
		    
           Configuration con=new Configuration().configure().addAnnotatedClass(RoomRackShelfs.class);
			
			ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
			
			SessionFactory sf=con.buildSessionFactory(reg);
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			session.persist(r);
			tx.commit();
		   session.close();
		   
		   
		   /// Generate Location Code ////////
		    
		    System.out.println("sub shelf "+request.getParameter("total_subselfInself"));
		    System.out.println("shelf "+request.getParameter("totalshelf"));
		    System.out.println("room "+request.getParameter("roomnum"));
		    System.out.println("rack "+request.getParameter("racknum"));
		    
		    AccessRoomRackShelfsDAO adao=new AccessRoomRackShelfsDAO();
		    adao.generateRackCode(Integer.parseInt(request.getParameter("total_subselfInself")),
		    		Integer.parseInt(request.getParameter("totalshelf")),
		    		Integer.parseInt(request.getParameter("roomnum")),
		    		Integer.parseInt(request.getParameter("racknum")));
		    
		    ///////////////
		    
		   
		   
		    mv.setViewName("rackSuccess.jsp");
		} catch (Exception e) 
		{
			e.printStackTrace();
			mv.setViewName("error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/deleteRoomRackShelfs")
	public ModelAndView deleteRoomRackShelfs(@RequestParam("r_id")int r_id,HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			AccessRoomRackShelfsDAO ar=new AccessRoomRackShelfsDAO();
			ar.deleteRoomRackShelfs(r_id);
			mv.setViewName("showRoomRackShelfs.jsp");
		}
		catch (Exception e) {
		e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/GetAvailableRack")
	public void get_Available_Rack(HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		System.out.println("category is"+request.getParameter("category"));
		AccessRoomRackShelfsDAO as=new AccessRoomRackShelfsDAO();
		int room=as.get_availableRacks(Integer.parseInt(request.getParameter("category")));
		
	
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(room);
		out.write(element.toString());
	}
}
