package com.up_archives.RRS.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.up_archives.RRS.dao.RoomRackShelfsDAO;
import com.up_archives.RRS.model.RoomRackShelfs;
import com.up_archives.util.HibernateUtil;


public class AccessRoomRackShelfsDAO implements RoomRackShelfsDAO  
{
	
	public void generateRackCode(int p_totalsubshelf,int p_totalshelf,int p_room,int p_racknumber)
	{
	

		SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.udf_generaterackdetails(:p_totalsubshelf,:p_totalshelf,"
						+ ":p_room,:p_racknumber)")
						.setParameter("p_totalsubshelf",p_totalsubshelf)
						.setParameter("p_totalshelf",p_totalshelf)
						.setParameter("p_room",p_room)
						.setParameter("p_racknumber",p_racknumber);
		
				List l=query.list();
				tx.commit();
		        session.close();
	}
	
	

	
	
	public List getRoomRackShelfs()
	{
		RoomRackShelfs r=new RoomRackShelfs();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session1=sf.openSession();
		Transaction tx=session1.beginTransaction();
		SQLQuery query = session1.createSQLQuery("SELECT * FROM public.show_room_rack_shelfs()");
		List<Object[]> l=query.list();
		tx.commit();
        session1.close();
		
		
		 return l;
		
	}
	
	public void updateRoomRackShelfs(int r_id,int room_no,int rack_no,int total_shelf,int total_box_in_single_shelfs)
	{
		RoomRackShelfs rs=new RoomRackShelfs();
		rs.setR_id(r_id);
		rs.setRoomnum(room_no);
		rs.setRacknum(rack_no);
		rs.setTotalshelf(total_shelf);
		rs.setTotalbook(total_box_in_single_shelfs);
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_roomrackshelfs(:p_r_id,:p_room_no,:p_rack_no,:p_total_shelf,:p_total_book_in_single_shelf)")
		.setParameter("p_r_id",rs.getR_id())
		.setParameter("p_room_no",rs.getRoomnum())
		.setParameter("p_rack_no",rs.getRacknum())
		.setParameter("p_total_shelf",rs.getTotalshelf())
		.setParameter("p_total_book_in_single_shelf",rs.getTotalbook());
		       		
	           List l=query.list();
		       tx.commit();
		       session.close();
	}
	
	public void deleteRoomRackShelfs(int r_id)
	{
		RoomRackShelfs rs=new RoomRackShelfs();
		rs.setR_id(r_id);
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.delete_roomrackshelfs(:p_r_id)")
		.setParameter("p_r_id",rs.getR_id());
		       		
	           List l=query.list();
		       tx.commit();
		       session.close();
	}

	public int get_availableRacks(int roomnum)
	{
		RoomRackShelfs rs=new RoomRackShelfs();
		rs.setRoomnum(roomnum);

		SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_available_racks(:room_num_p)")
						.setParameter("room_num_p",rs.getRoomnum());
		
				List l=query.list();
				int room_num=0;
				if(l==null || l.isEmpty())
				{
					room_num=1;
				}
				else
				{
			 room_num=(Integer) l.get(0);
				}
				tx.commit();
		        session.close();
				 return room_num+1;
	}
	
	public void generateLocationCode(int totalsubshelf,int totalshelf,int roomnum,int racknum)
	{
		RoomRackShelfs rs=new RoomRackShelfs();
		rs.setRoomnum(roomnum);
		rs.setRacknum(racknum);
		rs.setTotalshelf(totalshelf);
		rs.setTotalSubselfinRack(totalsubshelf);

		SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_available_racks(:room_num_p)")
						.setParameter("room_num_p",rs.getRoomnum());
		
				List l=query.list();
				tx.commit();
		        session.close();
	}
	
}
