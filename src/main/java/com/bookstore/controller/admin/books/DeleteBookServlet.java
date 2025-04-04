package com.bookstore.controller.admin.books;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.backend.BookServices;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/admin/delete_book")
@MultipartConfig(
		fileSizeThreshold = 1024*10,
		maxFileSize = 1024*300,
		maxRequestSize = 1024*1024
	)
public class DeleteBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices=new BookServices(entityManager, request, response);
		bookServices.deleteBook();
	}

}
