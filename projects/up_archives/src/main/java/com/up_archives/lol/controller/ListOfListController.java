package com.up_archives.lol.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.up_archives.lol.daoImpl.AccessListOfListDao;
import com.up_archives.lol.model.ListOfList;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class ListOfListController 
{

	@RequestMapping("/insertListOfList")
	public ModelAndView insertList(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			String doc_receive_date=request.getParameter("doc_receive_date");
			Date date_doc_recieve=new SimpleDateFormat("MM/DD/yyyy").parse(doc_receive_date); 
			
		/*	String created_on_date=request.getParameter("created_on");
			Date created_on=new SimpleDateFormat("dd/MM/yyyy").parse(created_on_date); 
			
			String updated_on_date=request.getParameter("updated_on");
			Date updated_on=new SimpleDateFormat("dd/MM/yyyy").parse(updated_on_date);
		*/	
			
			PrintWriter out = response.getWriter(  );
		    response.setContentType("text/html");
		    ListOfList lol=new ListOfList();
		    lol.setDept_id(Integer.parseInt(request.getParameter("list")));
		    System.out.println(request.getParameter("list_id"));
		    lol.setList_id(Integer.parseInt(request.getParameter("list_id")));
		    lol.setDoc_year_from(Integer.parseInt(request.getParameter("doc_year_from")));
		    System.out.println(request.getParameter("doc_year_from"));
		    lol.setDoc_year_to(Integer.parseInt(request.getParameter("doc_year_to")));
		    lol.setDoc_receive_date(date_doc_recieve);
		    lol.setRemark(request.getParameter("remark"));
		  //  lol.setCreated_by(request.getParameter("created_by"));
		  //  lol.setCreated_on(created_on);
		  //  lol.setUpdated_by(request.getParameter("updated_by"));
		  //  lol.setUpdated_on(updated_on);
		  //  lol.setCreated_ip(request.getParameter("created_ip"));
		  //  lol.setUpdated_ip(request.getParameter("updated_ip"));
		  //  lol.setMac_address(request.getParameter("mac_address"));
		    
            Configuration con=new Configuration().configure().addAnnotatedClass(ListOfList.class);
			
			ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
			
			SessionFactory sf=con.buildSessionFactory(reg);
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			session.persist(lol);
			tx.commit();
		    
		    mv.setViewName("list_of_list.jsp");
		}
		catch (Exception e) {
			
		e.printStackTrace();
		//	mv.setViewName("error.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/update_list")
	public void updateList(@RequestParam("list")int dept_id,@RequestParam("list_id")int list_id,
			@RequestParam("doc_year_from")int doc_year_from,@RequestParam("doc_year_to")int doc_year_to,
			@RequestParam("remark")String remark,
			@RequestParam("sublist")String sublist,
			HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		try
		{
			AccessListOfListDao lol=new AccessListOfListDao();
			List<Object[]> l=lol.update_list(list_id,dept_id,doc_year_from,doc_year_to,remark,sublist);
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(l);
			out.write(element.toString());
			
		}
		catch (Exception e)
		{
		e.printStackTrace();
		}
	
	}
	
	
	@RequestMapping("/insertList_Of_List")
	public void insertListOfList(
			@RequestParam("list")int list,
			@RequestParam("list_id")int list_id,
			@RequestParam("doc_year_from")int doc_year_from,
			@RequestParam("doc_year_to")int doc_year_to,
			@RequestParam("date_doc_recieve")String date_doc_recieve,
			@RequestParam("remark")String remark,
			@RequestParam("sublist")String sublist,
			HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		try
		{
			AccessListOfListDao ad=new AccessListOfListDao();
			List<Object[]> l=ad.set_list_of_list(list, list_id, doc_year_from, doc_year_to, date_doc_recieve, remark,sublist);
			 Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(l);
				out.write(element.toString());	
	        
		}
		catch (Exception e) {
			
		e.printStackTrace();
	
		}
	
	}
	
	
	@RequestMapping("/delList_Of_List")
	public void DeleteListOfList(
			@RequestParam("list")int list,
			@RequestParam("list_id")int list_id,
			@RequestParam("doc_year_from")int doc_year_from,
			@RequestParam("doc_year_to")int doc_year_to,
			@RequestParam("sublist")String sublist,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		try
		{
			AccessListOfListDao ad=new AccessListOfListDao();
			List<Object[]> l=ad.del_list_of_list(list, list_id, doc_year_from, doc_year_to,sublist);
			 Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(l);
				out.write(element.toString());	
	        
		}
		catch (Exception e) {
			
		e.printStackTrace();
	
		}
	
	}
	
	@RequestMapping("/listSubDeptInfo")
	public void getListSubDepartments(@RequestParam("list")int dept_id,HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try
		{
			AccessListOfListDao ad=new AccessListOfListDao();
			List<Object[]> l=ad.getListSubSept(dept_id);
			 Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(l);
				out.write(element.toString());	
	        
		}
		catch (Exception e) {
			
		e.printStackTrace();
	
		}
        
	}
	
	
	
}
