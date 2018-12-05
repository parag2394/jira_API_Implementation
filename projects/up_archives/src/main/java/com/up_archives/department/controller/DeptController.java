package com.up_archives.department.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.up_archives.db.ConnectionFactory;
import com.up_archives.department.daoImpl.AccessDeartmentDAO;
import com.up_archives.department.model.Dept;



@Controller
public class DeptController {
	Statement stmt = null;
	ResultSet rs=null;
	
	@RequestMapping("/updateDepartmentInfo")
	public void updateDepartment(@RequestParam("dept_id")int dept_id,@RequestParam("dept_name_H")String dept_name_H,@RequestParam("dept_name_E")String dept_name_E,HttpServletRequest request,HttpServletResponse response)
	{

	try
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		AccessDeartmentDAO accessDepartment=new AccessDeartmentDAO();
		accessDepartment.updateDept(dept_id, dept_name_H, dept_name_E);
		 Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(1);
			out.write(element.toString());
	}
    catch (Exception e)
	{
	e.printStackTrace();
    }	
	
	}
	
	
	@RequestMapping(value="/department_Insert",method=RequestMethod.POST)
	public void insertDept(@RequestParam("dept_name_H")String dept_name_H,@RequestParam("dept_name_E")String dept_name_E, HttpServletRequest request,HttpServletResponse response)
	{
		
		try
        {
			response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
		    AccessDeartmentDAO ad=new AccessDeartmentDAO();
		  
		    List<Object[]> l=ad.loadDept(dept_name_H.trim(),dept_name_E.trim());
		    
		    Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(l);
			out.write(element.toString());
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			
		}
		
		
	}

	
	
	@RequestMapping("/department")
	public ModelAndView fetchDept(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			PrintWriter out = response.getWriter(  );
		    response.setContentType("text/html");
		    
		    Dept d=new Dept();
		    d.setDept_name_H(request.getParameter("dept_name_H"));
		    d.setDept_name_E(request.getParameter("dept_name_E"));
		    System.out.println(d.getDept_name_H());
		    System.out.println(d.getDept_name_E());
		    
		    Connection connection = ConnectionFactory.getConnection();
		    stmt = connection.createStatement();
			String query = "select * from tbl_m_department_master where dept_name_h='"+request.getParameter("dept_name_H")+"' and dept_name_e='"+request.getParameter("dept_name_E")+"'";
			rs = stmt.executeQuery(query);
			if(rs.next())
			{
				mv.setViewName("subDept.jsp");
				
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
	
	@RequestMapping("deleteDepartment")
	public ModelAndView delDepartment(@RequestParam("dept_id")int dept_id)
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			AccessDeartmentDAO accessDepartment=new AccessDeartmentDAO();
			accessDepartment.deleteDept(dept_id);
			mv.setViewName("showDept.jsp");
		}
		catch (Exception e)
		{

        e.printStackTrace();
		}
		return mv;
	}





}