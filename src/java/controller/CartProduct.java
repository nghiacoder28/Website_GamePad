package controller;

import dal.ProductDAO;
import model.Account;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CartProduct", urlPatterns = {"/CartProduct"})
public class CartProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("acc");
        if (account != null) {
            if (account.getRole().equals("1")) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                ProductDAO pdao = new ProductDAO();
                Product product = pdao.checkProduct(pid, account.getAccountID());
                if (product == null) {
                    int quality = Integer.parseInt(request.getParameter("quality"));
                    pdao.insertCart(pid, account.getAccountID(), quality);
                    response.sendRedirect("ShowProductToCart?pID=" + pid);
                } else if (product != null) {
                    int quality = Integer.parseInt(request.getParameter("quality"));
                    int number = quality + product.getQuality();
                    pdao.UpdateCart(product.getcID(), number);
                    response.sendRedirect("ShowProductToCart?pID=" + pid);
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
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
