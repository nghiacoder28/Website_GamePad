/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "SearchPrice", urlPatterns = {"/SearchPrice"})
public class SearchPrice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int txtSearch = Integer.parseInt(request.getParameter("price"));
        ProductDAO dao = new ProductDAO();
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        if (txtSearch == 1) {
            List<Product> list = dao.getSearchPriceDesc(index);
            List<Product> l = dao.getAllbrand();
            List<Product> last = dao.getNewProduc();
            int endPage = dao.getNumberEndPage();
            request.setAttribute("endPage", endPage);
            request.setAttribute("listN", last);
            request.setAttribute("listC", l);
            request.setAttribute("listP", list);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } else if (txtSearch == 2) {
            List<Product> list = dao.getSearchPriceAsc(index);
            List<Product> l = dao.getAllbrand();
            List<Product> last = dao.getNewProduc();
            int endPage = dao.getNumberEndPage();
            request.setAttribute("endPage", endPage);
            request.setAttribute("listN", last);
            request.setAttribute("listC", l);
            request.setAttribute("listP", list);
            request.getRequestDispatcher("product.jsp").forward(request, response);
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
