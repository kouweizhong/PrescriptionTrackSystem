package com.silence.prescription;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.silence.prescription.entities.Medicine;


public class Test {

	@org.junit.Test 	
	public void testMedicine(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory factory = context.getBean(SessionFactory.class);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		Medicine m = new Medicine("123","no");
		Medicine m1 = new Medicine("a1","no");
		Medicine m2 = new Medicine("a2","no");
		Set<Medicine> sets = new HashSet<Medicine>();
		sets.add(m1);
		sets.add(m2);
		m.setSubstitutes(sets);
		session.save(m);
		transaction.commit();
		session.flush();
		session.close();
	}
}
