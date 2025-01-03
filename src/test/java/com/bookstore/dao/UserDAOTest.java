package com.bookstore.dao;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {

	@Test
	public void testCreateUsers() {
		Users user2 = new Users();
		user2.setEmail("user2@gmail.com");
		user2.setFullName("user2");
		user2.setPassword("123456");
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BooksStoreWebsite");
		EntityManager entityManager=entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		UserDAO userDAO=new UserDAO(entityManager);
		user2=userDAO.create(user2);
		entityManager.close();
		entityManagerFactory.close();
		System.out.println("A user object was persisted!");
		assertTrue(user2.getUserId()>0);
		
	}

}
