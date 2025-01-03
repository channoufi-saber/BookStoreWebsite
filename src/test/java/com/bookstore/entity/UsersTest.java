package com.bookstore.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookstore.entity.Users;

public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("user12@gmail.com");
		user1.setFullName("user1");
		user1.setPassword("123456");
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BooksStoreWebsite");
		EntityManager entityManager=entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(user1);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		System.out.println("A user object was persisted!");
	}

}
