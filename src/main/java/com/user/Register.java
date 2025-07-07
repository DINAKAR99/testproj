package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.getWriter().append("Served at: ").append(request.getContextPath()+"remotee"); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// getting all the incoming details from the request...

		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		String email = request.getParameter("user_email");
		Part part = request.getPart("image");
		String filename = part.getSubmittedFileName();
		// out.println(filename);

		/*
		 * out.println(name); out.println(password); out.println(email);
		 */
		// connection...
		try {
			Thread.sleep(3000);
			Class.forName("org.postgresql.Driver");
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/testproj", "postgres",
					"dinakar1.");
			// query..
			String q = "insert into userd (name,password,email,filename) values(?,?,?,?)";
			PreparedStatement pstmt = connection.prepareStatement(q);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, filename);

			pstmt.executeUpdate();
			// upload...
			InputStream is = part.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);

			String path = "C:\\TRAINING\\testproj\\src\\main\\webapp\\images2\\" + filename;
			// out.println(path);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			response.setContentType("text/plain");
			out.println("done");

			// out.println("<h1>done......</h1>");
		} catch (Exception e) {
			e.printStackTrace();
			// out.println("<h1>error...</h1>");
			out.println("error");
		}

	}

}
