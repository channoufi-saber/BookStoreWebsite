package com.bookstore.controller.admin.categories;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.backend.CategoryServices;

/**
 * Servlet implementation class CreateCategoryServlet
 */
@WebServlet("/admin/create_category")
public class CreateCategoryServlet extends com.bookstore.controller.BaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCategoryServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices categoryServices=new CategoryServices(entityManager, request, response);
		categoryServices.createCategory();
	}

}
