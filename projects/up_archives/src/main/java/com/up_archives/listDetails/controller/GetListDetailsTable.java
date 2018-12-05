package com.up_archives.listDetails.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.ArrayUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.up_archives.listDetails.model.ListDetail;

/**
 * Servlet implementation class GetListDetailsTable
 */
public class GetListDetailsTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
    try {
        System.out.println("List is"+request.getParameter("list_id"));
        System.out.println("List is"+request.getParameter("list"));
        System.out.println("List is"+request.getParameter("doc_subject"));
        System.out.println("List is"+request.getParameter("doc_year_from"));
        System.out.println("List is"+request.getParameter("doc_year_to"));
        System.out.println("List is"+request.getParameter("room_no"));
        System.out.println("List is"+request.getParameter("rack_no"));
        System.out.println("List is"+request.getParameter("shelf_no"));
        
        ListDetail l=new ListDetail();
		   l.setDept_id(Integer.parseInt(request.getParameter("list")));
		   l.setList_id(Integer.parseInt(request.getParameter("list_id")));
		   l.setDoc_subject(request.getParameter("doc_subject"));
		   l.setDoc_year_from(Integer.parseInt(request.getParameter("doc_year_from")));
		   l.setDoc_year_to(Integer.parseInt(request.getParameter("doc_year_to")));
		   l.setRoom_no(Integer.parseInt(request.getParameter("room_no")));
		   l.setRack_no(Integer.parseInt(request.getParameter("rack_no")));
		   l.setLocation_code(request.getParameter("shelf_no"));
		   l.setBox_no(Integer.parseInt(request.getParameter("box_no")));
		   l.setFile_no(request.getParameter("file_no").trim());
		   l.setTotal_cover_no(Integer.parseInt(request.getParameter("total_cover_no")));
		   l.setRemark(request.getParameter("remark"));
		   
		    Configuration con=new Configuration().configure().addAnnotatedClass(ListDetail.class);
			
		    ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
			
			SessionFactory sf=con.buildSessionFactory(reg);
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			session.persist(l);
			tx.commit();
			out.write("Records Inserted");
    }
    catch (Exception e) {
    	e.printStackTrace();
    	out.write("Records Not Inserted");
	}
      

	}


}
