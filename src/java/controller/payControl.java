package controller;

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

@WebServlet(name = "payControl", urlPatterns = {"/payControl"})
public class payControl extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] cID = request.getParameterValues("cID");
        ProductDAO productDAO = new ProductDAO();
        Account account = (Account) request.getSession().getAttribute("acc");
        if (cID == null) {
            ProductDAO pdao = new ProductDAO();
            List<Product> products = pdao.getProductInCart(account.getAccountID());
            request.setAttribute("listC", products);
            request.setAttribute("cart", "Please choose product");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            for (int i = 0; i < cID.length; i++) {
                productDAO.payCart(cID[i], 1);
            }
            response.sendRedirect("listProduct");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
