package com.bookstore.service.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CustomerDAO customerDAO;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}

	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();
		if (message != null) {
			request.setAttribute("message", message);
		}
		request.setAttribute("listCustomer", listCustomer);
		String listPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		if (existCustomer != null) {
			String message = "Could not create new customer: the email " + email
					+ " is already registered by another customer";
			listCustomers(message);
		} else {
			Customer newCustomer = new Customer();

			updateCustomerFieldsFromForm(newCustomer);

			customerDAO.create(newCustomer);
			String message = "New customer has been created successfully";
			listCustomers(message);
		}
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message = "";
		if (existCustomer != null) {
			message = "Could not register: the email " + email + " is already registered by another customer";
		} else {
			Customer newCustomer = new Customer();

			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);
			message = "You have registered successfully! Thank you.<br/><a href='login'>Click here</a> to login  ";
		}
		request.setAttribute("message", message);

		String messagePage = "frontend/message.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		requestDispatcher.forward(request, response);
	}

	private void updateCustomerFieldsFromForm(Customer newCustomer) {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");

		newCustomer.setEmail(email);
		newCustomer.setFullname(fullname);
		newCustomer.setPassword(password);
		newCustomer.setPhone(phone);
		newCustomer.setAddress(address);
		newCustomer.setCity(city);
		newCustomer.setZipcode(zipcode);
		newCustomer.setCountry(country);
	}

	public void editCustomer() throws ServletException, IOException {

		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		request.setAttribute("customer", customer);
		String editPage = "customer_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message = null;
		if (existCustomer != null && existCustomer.getCustomerId() != customerId) {
			message = "Could not update the customer ID " + customerId
					+ " because there's existing customer having the same email.";
		} else {

			Customer newCustomer = customerDAO.get(customerId);
			newCustomer.setCustomerId(customerId);

			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.update(newCustomer);

			message = "The customer has been updated successfully.";
		}
		listCustomers(message);

	}

	public void deleteCustomer() throws ServletException, IOException {

		Integer customerId = Integer.parseInt(request.getParameter("id"));
		customerDAO.delete(customerId);
		String message = "The customer has been deleted successfully.";
		listCustomers(message);
	}

	public void showLogin() throws ServletException, IOException {

		String loginPage="frontend/login.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Customer customer=customerDAO.checkLogin(email, password);
		if (customer == null) {
			String message="Login failed. Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();
		} else {
			request.getSession().setAttribute("loggedCustomer", customer);
			showCustomerProfile();
			
		}
	}
	
	public void showCustomerProfile() throws ServletException, IOException {
		String profilePage="frontend/customer_profile.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

}













