package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/Register1")
public class Register1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        PrintWriter writer = resp.getWriter();

        String name = req.getParameter("user_name");
        String password = req.getParameter("user_password");
        String email = req.getParameter("user_email");
        Part part = req.getPart("image");
        String filename = part.getSubmittedFileName();

        try {
            Thread.sleep(5000);

            Class.forName("org.postgresql.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/testproj",
                    "postgres", "dinakar1.")) {
                String query = "INSERT INTO userd (name, password, email, filename) VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, name);
                    statement.setString(2, password);
                    statement.setString(3, email);
                    statement.setString(4, filename);

                    int rowsAffected = statement.executeUpdate();

                    if (rowsAffected > 0) {
                        writer.println("done");
                    } else {
                        writer.println("Error: No rows affected.");
                    }
                }
            }

            // Uploading
            InputStream inputStream = part.getInputStream();
            byte[] b1 = new byte[inputStream.available()];
            inputStream.read(b1);

            String path = getServletContext().getRealPath("/") + "images" + File.separator + filename;
            writer.println(path);

            try (FileOutputStream f1 = new FileOutputStream(path)) {
                f1.write(b1);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            writer.println("Error: Class not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            writer.println("Error: SQL Exception.");
        } catch (Exception e) {
            e.printStackTrace();
            writer.println("Error: Unknown Exception.");
        }
    }
}
