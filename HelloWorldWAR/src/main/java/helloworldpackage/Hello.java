package helloworldpackage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public final class Hello extends HttpServlet {
    public Hello() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<head>");
        writer.println("<title>Hello World Application Servlet Page</title>");
        writer.println("</head>");
        writer.println("<body bgcolor=white>");
        writer.println("<table border=\"0\">");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("<h1>Hello World Application Servlet Page</h1>");
        writer.println("<p>This is the response of servlet execution that is part of the Hello World Web application.");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.print("<p>");
        writer.print(new java.lang.String(" Hello, World from Servlet!!"));
        writer.println("</p>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.print("<p>Today's Date :");
        writer.print(new java.util.Date());
        writer.println("</p>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.print("<p>You have logged from :");
        writer.print(request.getRemoteAddr());
        writer.println("</p>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("<a href=\"index.html\"> Back to Welcome Page</a>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("</table>");
        writer.println("</body>");
        writer.println("</html>");
    }
}
