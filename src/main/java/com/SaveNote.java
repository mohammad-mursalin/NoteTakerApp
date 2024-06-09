package com;

import com.entities.NoteTaker;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/NoteTakerApp/SaveNote")
public class SaveNote extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get parameters from the request
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Create a new NoteTaker object
        NoteTaker note = new NoteTaker(title, content, new Date());

        // For testing, print the note details to the console
        System.out.println("Note ID: " + note.getId() + ", Title: " + note.getTitle());

        // Set response content type
        response.setContentType("text/html");

        // Get PrintWriter object
        PrintWriter out = response.getWriter();

        // Print response
        out.println("<html><body>");
        out.println("<h2>Note Added Successfully!</h2>");
        out.println("<p>Title: " + title + "</p>");
        out.println("<p>Content: " + content + "</p>");
        out.println("</body></html>");
    }
}
