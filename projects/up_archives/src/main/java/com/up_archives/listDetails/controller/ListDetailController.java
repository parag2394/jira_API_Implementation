package com.up_archives.listDetails.controller;

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
import com.up_archives.listDetails.daoImpl.AccesslistDetailsDAO;
import com.up_archives.listDetails.model.ListDetail;


@Controller
public class ListDetailController 
{

	@RequestMapping("/insertListDetails")
	public ModelAndView insertListDetail(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			
		
			PrintWriter out = response.getWriter();
		    response.setContentType("text/html");
		   ListDetail l=new ListDetail();
		   l.setDept_id(Integer.parseInt(request.getParameter("list")));
		   l.setList_id(Integer.parseInt(request.getParameter("list_id")));
		   l.setDoc_subject(request.getParameter("doc_subject"));
		   l.setDoc_year_from(Integer.parseInt(request.getParameter("doc_year_from")));
		   l.setDoc_year_to(Integer.parseInt(request.getParameter("doc_year_to")));
		   l.setRoom_no(Integer.parseInt(request.getParameter("room_no")));
		   l.setRack_no(Integer.parseInt(request.getParameter("rack_no")));
		   l.setLocation_code(request.getParameter("shelf_no").trim());
		   l.setBox_no(Integer.parseInt(request.getParameter("box_no")));
		   l.setFile_no(request.getParameter("file_no").trim());
		   l.setTotal_cover_no(Integer.parseInt(request.getParameter("total_cover_no")));
		   l.setRemark(request.getParameter("remark").trim());
		   l.setShelf_no(request.getParameter("sf_no").trim());
		  l.setSub_list_id(request.getParameter("sublist"));
		   l.setStatus(0);
		    Configuration con=new Configuration().configure().addAnnotatedClass(ListDetail.class);
			
		    ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
			
			SessionFactory sf=con.buildSessionFactory(reg);
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			session.persist(l);
			tx.commit();
			mv.setViewName("listDetailsSuccess.jsp");
		
		
			session.close();
		}
		catch (Exception e)
		{
		e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/GetRacksInsideRoom")
	public void get_Available_Racks_InRoom(HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		System.out.println("category is"+request.getParameter("roomnum"));
		AccesslistDetailsDAO ad=new AccesslistDetailsDAO();
		List<Object[]> l=ad.getAllRacksInRoom(Integer.parseInt(request.getParameter("roomnum")));
		
	
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());
	}
	
	
	@RequestMapping("/listDetailsBySubDept")
	public void get_List_Details_By_SubDept(HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		System.out.println("sub dept id is"+request.getParameter("dept_id"));
		AccesslistDetailsDAO ad=new AccesslistDetailsDAO();
		List l=ad.getAllListDetailsBySubDept(Integer.parseInt(request.getParameter("dept_id")));
		
	
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());
	}
	
	@RequestMapping("/GetDepartmentName")
	public void GetDeptName(HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		System.out.println("category is"+request.getParameter("category"));
		AccesslistDetailsDAO ad=new AccesslistDetailsDAO();
		List<Object[]> l=ad.getListDeptName(Integer.parseInt(request.getParameter("category")));
	
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());
	}

	
	
	@RequestMapping("/update_list_details")
	public void updateListDetailss(
			@RequestParam("record_id")int record_id,
			@RequestParam("list_id")int list_id,
			@RequestParam("dept_id")int dept_id,
			@RequestParam("doc_subject")String doc_subject,
			@RequestParam("doc_year_from")int doc_year_from,
			@RequestParam("doc_year_to")int doc_year_to,
			@RequestParam("room_no")int room_no,
			@RequestParam("rack_no")int rack_no,
			@RequestParam("location_code")String location_code,
			@RequestParam("box_no")String box_no,
			@RequestParam("file_no")String file_no,
			@RequestParam("total_cover_no")int total_cover_no,
			@RequestParam("remark")String remark,
			@RequestParam("shelf_no")String shelf_no,
           HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		System.out.println("category is"+request.getParameter("category"));
		AccesslistDetailsDAO ad=new AccesslistDetailsDAO();
		List<Object[]> l=ad.updateListDetails(record_id, dept_id, list_id, doc_subject, doc_year_from, doc_year_to, room_no, rack_no, location_code, box_no, file_no, total_cover_no, remark,shelf_no);
	
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());
	}
	
	@RequestMapping("/delete_list_details")
	public void updateListDetailss(
			@RequestParam("record_id")int record_id,
			HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();	
        AccesslistDetailsDAO ad=new AccesslistDetailsDAO();
        List<Object[]> l=ad.removeListDetailsEntry(record_id);
        Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());
        
	}

}
