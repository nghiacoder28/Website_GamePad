package Admin;

import dal.ProductDAO;
import model.Account;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "addproduct", urlPatterns = {"/addproduct"})
public class addproduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addproduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Account account = (Account) request.getSession().getAttribute("acc");
        if (account != null) {
            if (account.getRole().equals("0")) {
                ProductDAO dao = new ProductDAO();
                List<Product> brand = dao.getAllbrand();
                request.setAttribute("listB", brand);
                request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("pName");
        String img = request.getParameter("img");
        String n = request.getParameter("number");
        int number = Integer.parseInt(n);
        String p = request.getParameter("price");
        double price = Double.parseDouble(p);
        String brand = request.getParameter("brand");
        int b = Integer.parseInt(brand);
        
        // Check if the number is negative
        if (number < 0) {
            request.setAttribute("errorMessage", "Quality invalid!");
            ProductDAO dao = new ProductDAO();
            List<Product> brandList = dao.getAllbrand();
            request.setAttribute("listB", brandList);
            request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
        } else {
            ProductDAO dao = new ProductDAO();
            dao.Product(name, img, number, price, b);
            response.sendRedirect("seller");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
