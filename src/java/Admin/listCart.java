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

@WebServlet(name = "listCart", urlPatterns = {"/listCart"})
public class listCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet listCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listCart at " + request.getContextPath() + "</h1>");
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
                List<Product> c = dao.LBill();
                request.setAttribute("listCart", c);
                request.getRequestDispatcher("listCartUser.jsp").forward(request, response);
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
        String cID = request.getParameter("cID");
        int status = Integer.parseInt(request.getParameter("status"));

        ProductDAO productDAO = new ProductDAO();

        // Update product quantity if status is 4 (done)
        if (status == 4) {
            List<Product> productsInCart = productDAO.getProductInCart(Integer.parseInt(cID));
            for (Product product : productsInCart) {
                productDAO.updateProductQuantity(product.getpID(), product.getQuality());
            }
        }

        // Update cart status
        productDAO.payCart(cID, status);

        // Redirect to listCart page
        response.sendRedirect("listCart");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
