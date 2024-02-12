package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Register3")
@MultipartConfig
public class Register3 extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html");
    PrintWriter writer = resp.getWriter();

    String name = req.getParameter("user_name");
    String password = req.getParameter("user_password");
    String email = req.getParameter("user_email");
    Part part = req.getPart("image");
    String filename = part.getSubmittedFileName();

    // writer.println(name);
    // writer.println(password);
    // writer.println(email);
    // writer.println(filename);

    // connection
    try {
      Thread.sleep(3000);

      Class.forName("org.postgresql.Driver");
      Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/testproj", "postgres",
          "dinakar1.");

      // query
      String query = "insert into userd (name,password,email,filename) values(?,?,?,?)";
      PreparedStatement ps = connection.prepareStatement(query);
      ps.setString(1, name);
      ps.setString(2, password);
      ps.setString(3, email);
      ps.setString(4, filename);

      ps.executeUpdate();

      writer.println("done");
    } catch (Exception e) {

      writer.println("error");
      writer.println(e);
    }
  }
}
