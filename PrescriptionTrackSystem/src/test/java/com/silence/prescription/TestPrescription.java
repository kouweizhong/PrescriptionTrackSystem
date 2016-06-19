package com.silence.prescription;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class TestPrescription {

	private Session session = null;
	private Transaction transaction = null;
	private SessionFactory factory = null;
	private ApplicationContext context = null;
	private Query query = null;
	@Before
	public void init(){
		context = new ClassPathXmlApplicationContext("applicationContext-text.xml");
		factory = context.getBean(SessionFactory.class);
		session = factory.openSession();
		System.out.println(session.isOpen());
		transaction = session.beginTransaction();
	}
	
	@Test 	
	@SuppressWarnings("unchecked")
	public void testQuery(){		
		System.out.println(session);
		query = session.createQuery("from Department");
		/*List<Department> list = query.list();
		for (Department d : list){
			System.out.println(d);
		}*/
	}
	
	@After
	public void destory(){
		transaction.commit();
		session.close();
		factory.close();
	}
}
