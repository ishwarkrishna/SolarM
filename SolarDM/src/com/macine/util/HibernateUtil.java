package com.macine.util;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	public static Session session = null;
	public static SessionFactory sessionFactory = null;
	static {
		try {
			sessionFactory = new AnnotationConfiguration().configure(
					"/hibernate.cfg.xml").buildSessionFactory();
		} catch (Throwable e) {
			throw new ExceptionInInitializerError(e);

		}
	}

	public static Session getSession() throws HibernateException {
		return sessionFactory.openSession();
	}
}
