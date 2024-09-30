package Admin;

import dal.AccountDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "editUser", urlPatterns = {"/editUser"})
public class editUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int uID = Integer.parseInt(request.getParameter("uID"));
        AccountDAO dao = new AccountDAO();
        Account id = dao.getUserID(uID);
        request.setAttribute("u", id);
        request.getRequestDispatcher("updateUser.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String aID = request.getParameter("aID");
    String role = request.getParameter("role");
    String pass = request.getParameter("pass");
    AccountDAO dao = new AccountDAO();
    dao.UpdateUser(role, pass, aID);
    response.sendRedirect("listUser");
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
