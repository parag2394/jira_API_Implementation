package com.up_archives.menu.daoImpl;

import java.awt.Menu;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.up_archives.menu.dao.MenuMstDAO;
import com.up_archives.menu.model.MenuMst;
import com.up_archives.util.HibernateUtil;



public class MenuMstDAOImpl implements MenuMstDAO {

	public List fetchMenuMst() {
		MenuMst mm = new MenuMst();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.tbl_menumst");
		List<Object[]> l = query.list();
		tx.commit();
		session.close();
		return l;
	}

	public int getMenuMst() {
		try {

			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_menu_mst()");
			List<Object[]> l = query.list();
			for (Object[] obj : l) {
				MenuMst m = new MenuMst();
				m.setMenuId((Integer) obj[0]);
				m.setText(String.valueOf(obj[1]));
				m.setDescription(String.valueOf(obj[2]));
				m.setParentId((Integer) obj[3]);
				m.setNavurl(String.valueOf(obj[4]));
				m.setShowtoall((Character) obj[5]);
				m.setShowinmenu((Character) obj[6]);
				m.setOrderby((Integer) obj[7]);
				m.setEnable((Character) obj[8]);
			}
			
session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/*public void updateMenuMst(MenuMst m) {
		// MenuMst m = new MenuMst();
		m.setMenuId(m.getMenuId());
		m.setText(m.getText().toString());
		m.setDescription(m.getDescription().toString());
		m.setParentId(m.getParentId());
		m.setNavurl(m.getNavurl().toString());
		m.setShowinmenu(m.getShowinmenu());
		m.setShowtoall(m.getShowtoall());
		m.setOrderby(m.getOrderby());
		m.setEnable(m.getEnable());

		Configuration con = new Configuration().configure().addAnnotatedClass(Menu.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = (SQLQuery) session
				.createSQLQuery(
						"SELECT * FROM public.update_menumst(:p_menuid,:p_text,:p_description,:p_parentid,:p_navurl,"
								+ ":p_showtoall,:p_showinmenu,:p_orderby,:p_enable)")
				.setParameter("p_menuid", m.getMenuId()).setParameter("p_text", m.getText())
				.setParameter("p_description", m.getDescription()).setParameter("p_parentid", m.getParentId())
				.setParameter("p_navurl", m.getNavurl()).setParameter("p_showtoall", m.getShowtoall())
				.setParameter("p_showinmenu", m.getShowinmenu()).setParameter("p_orderby", m.getOrderby())
				.setParameter("p_enable", m.getEnable());

		List l = query.list();
		tx.commit();
		session.close();
	}*/

	public void setMenuMst(MenuMst m) {
		try {
		
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			SQLQuery query = (SQLQuery) session
					.createSQLQuery("SELECT * FROM public.set_menumst(:menuid,:text,:description,:parentid,:navurl,"
							+ ":showtoall,:showinmenu,:orderby,:enable)")
					.setParameter("menuid", m.getMenuId()).setParameter("text", m.getText())
					.setParameter("description", m.getDescription()).setParameter("parentid", m.getParentId())
					.setParameter("navurl", m.getNavurl()).setParameter("showtoall", m.getShowtoall())
					.setParameter("showinmenu", m.getShowinmenu()).setParameter("orderby", m.getOrderby())
					.setParameter("enable", m.getEnable());
			query.list();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void loadMenuMst(MenuMst m) {
		// MenuMst m = new MenuMst();
		m.setMenuId(m.getMenuId());
		m.setText(m.getText());
		m.setDescription(m.getDescription());
		m.setParentId(m.getParentId());
		m.setNavurl(m.getNavurl());
		m.setShowinmenu(m.getShowinmenu());
		m.setShowtoall(m.getShowtoall());
		m.setOrderby(m.getOrderby());
		m.setEnable(m.getEnable());
		;

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(m);
		tx.commit();
		session.close();
	}


	public void updateMenuMst(int menuid, String text, String description, int parentid, String navurl,
			char showinmenu, char showtoall, int orderby, char enable) {
		MenuMst m=new MenuMst();
		m.setMenuId(menuid);
		m.setText(text);
		m.setDescription(description);
		m.setParentId(parentid);
		m.setNavurl(navurl);m.setShowinmenu(showinmenu);m.setShowtoall(showtoall);m.setOrderby(orderby);
		m.setEnable(enable);

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_menumst(:p_menuid,:p_text,:p_description,:p_parentid,:p_navurl,:p_showtoall,"
				+ ":p_showinmenu,:p_orderby,:p_enable)")
				.setParameter("p_menuid", m.getMenuId())
				.setParameter("p_text", m.getText())
				.setParameter("p_description", m.getDescription())
				.setParameter("p_parentid", m.getParentId())
				.setParameter("p_navurl", m.getNavurl().toString())
				.setParameter("p_showtoall",m.getShowtoall())
				.setParameter("p_showinmenu",m.getShowinmenu())
				.setParameter("p_orderby", m.getOrderby())
				.setParameter("p_enable", m.getEnable());				

		List l = query.list();
		tx.commit();
		session.close();
		
	}
}