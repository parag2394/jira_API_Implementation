package com.up_archives.subDepartment.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.up_archives.subDepartment.daoImpl.AccessSubDeptDAO;
import com.up_archives.subDepartment.model.SubDept;


@Controller
public class SubDepartmentController
{
	
	@RequestMapping("/updateSubDepartmentInformation")
	public void updateSubDepartmentInfo(@RequestParam("sub_dept_id")int sub_dept_id,
			@RequestParam("subdept_name_H")String subdept_name_H,
			@RequestParam("subdept_name_E")String subdept_name_E,HttpServletResponse response)
	{
		
		try {
			response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
			AccessSubDeptDAO accessSubDepartment=new AccessSubDeptDAO();
			accessSubDepartment.updateSubDepartment(sub_dept_id, subdept_name_H, subdept_name_E);
			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(1);
			out.write(element.toString());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	
	@RequestMapping("/subDepartment")
	public ModelAndView fetchSubDept(HttpServletRequest request,HttpServletResponse response)
	{
          ModelAndView mv=new ModelAndView();
		
		try 
		{
			PrintWriter out = response.getWriter(  );
		    response.setContentType("text/html");
		    
		    SubDept d=new SubDept();
		    d.setSub_dept_name_H(request.getParameter("subdept_name_H"));
		    d.setSub_dept_name_E(request.getParameter("subdept_name_H"));
		  System.out.println(d.getSub_dept_name_H());
		   System.out.println(d.getSub_dept_name_E());
		    mv.setViewName("roomAndShelfs.jsp");
		} catch (Exception e) 
		{
			mv.setViewName("error.jsp");
		}
		return mv;
		
	}
	
	@RequestMapping("/deleteSubDepartmentInformation")
	public ModelAndView deleteSubDepartmentInfo(@RequestParam("dept_id")String dept_id,@RequestParam("sub_dept_id")int sub_dept_id,@RequestParam("subdept_name_H")String subdept_name_H,@RequestParam("subdept_name_E")String subdept_name_E)
	{
		ModelAndView mv=new ModelAndView();
		try {
			AccessSubDeptDAO accessSubDepartment=new AccessSubDeptDAO();
			accessSubDepartment.deleteSubDepartment(sub_dept_id);
			mv.setViewName("showSubDept.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//@RequestMapping("/subDepartmentInsert")
	@RequestMapping(value="/subDepartmentInsert",method=RequestMethod.POST)
	public void subDeptInsert(
			@RequestParam("dept")int dept,
			@RequestParam("sub_dept_name_E")String sub_dept_name_E,
			@RequestParam("sub_dept_name_H")String sub_dept_name_H,
			HttpServletRequest request,HttpServletResponse response)
	{
		try {
			System.out.println("called");
			response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
			AccessSubDeptDAO adao=new AccessSubDeptDAO();
			List<Object[]> l=adao.loadSubDept(dept,sub_dept_name_H, sub_dept_name_E);
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(l);
			out.write(element.toString());
			}
		catch (Exception e) 
			{
				e.printStackTrace();
				//mv.setViewName("error.jsp");
			}
		
	}
}
