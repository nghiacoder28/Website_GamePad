package Admin;

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

@WebServlet(name = "editProduct", urlPatterns = {"/editProduct"})
public class editProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pid = Integer.parseInt(request.getParameter("pid"));
        ProductDAO dao = new ProductDAO();
        Product p = dao.getAProduct(pid);
        List<Product> b = dao.getAllbrand();
        request.setAttribute("listB", b);
        request.setAttribute("p", p);
        request.getRequestDispatcher("editproduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    // Lấy thông tin từ request
    int id = Integer.parseInt(request.getParameter("pid"));
    String number = request.getParameter("number");
    String name = request.getParameter("name");
    String p = request.getParameter("price");
    String b = request.getParameter("brand");

    try {
        // Kiểm tra số có phải là số không âm và xử lý ngoại lệ nếu không phải
        int so = Integer.parseInt(number);
        if (so < 0) {
            request.setAttribute("error", "Quality invalid!");
            request.setAttribute("pid", id);
            request.setAttribute("name", name);
            request.setAttribute("price", p);
            request.setAttribute("brand", b);
            request.getRequestDispatcher("editproduct.jsp").forward(request, response);
            return;
        }

        // Kiểm tra giá có phải là số dương và xử lý ngoại lệ nếu không phải
        float price = Float.parseFloat(p);
        if (price <= 0) {
            request.setAttribute("error", "Price invalid!");
            request.setAttribute("pid", id);
            request.setAttribute("name", name);
            request.setAttribute("number", number);
            request.setAttribute("brand", b);
            request.getRequestDispatcher("editproduct.jsp").forward(request, response);
            return;
        }

        // Kiểm tra brand có phải là số nguyên dương và xử lý ngoại lệ nếu không phải
        int brand = Integer.parseInt(b);
        if (brand <= 0) {
            request.setAttribute("error", "Brand invalid!");
            request.setAttribute("pid", id);
            request.setAttribute("name", name);
            request.setAttribute("number", number);
            request.setAttribute("price", p);
            request.getRequestDispatcher("editproduct.jsp").forward(request, response);
            return;
        }

        // Nếu không có lỗi, tiến hành cập nhật sản phẩm
        ProductDAO dao = new ProductDAO();
        dao.updateProduct(id, so, price, name, brand);

        // Chuyển hướng về trang seller sau khi cập nhật thành công
        response.sendRedirect("seller");
    } catch (NumberFormatException e) {
        // Xử lý ngoại lệ khi có lỗi định dạng số
        request.setAttribute("error", "Number format invalid!");
        request.setAttribute("pid", id);
        request.setAttribute("name", name);
        request.setAttribute("number", number);
        request.setAttribute("price", p);
        request.setAttribute("brand", b);
        request.getRequestDispatcher("editproduct.jsp").forward(request, response);
    }
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
