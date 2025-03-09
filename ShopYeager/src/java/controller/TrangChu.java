package controller;

import dao.ProductsDAO;
import dto.ProductsDTO;
import utils.AuthUtils;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TrangChu", urlPatterns = {"/TrangChu"})
public class TrangChu extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String HOME_PAGE = "Menuhome.jsp";
    private static final String SEARCH_PAGE = "search.jsp";

    private ProductsDAO productsDAO = new ProductsDAO();

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");

        if (AuthUtils.isValidLogin(email, password)) {
            url = HOME_PAGE;
            HttpSession session = request.getSession();
            session.setAttribute("user", AuthUtils.getUser(email));
            request.getRequestDispatcher(HOME_PAGE).forward(request, response);
        } else {
            request.setAttribute("message", "Email or password incorrect!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            session.invalidate();
        }
        return LOGIN_PAGE;
    }

    private String processShowProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            List<ProductsDTO> products = productsDAO.readAll();
            request.setAttribute("products", products);
            return HOME_PAGE;
        }
        return LOGIN_PAGE;
    }

    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("searchName");
        List<ProductsDTO> products = productsDAO.searchByName(name);
        request.setAttribute("products", products);
        return SEARCH_PAGE;
    }

    private String processUpdateQuantity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        productsDAO.updateQuantityToZero(productId);
        return processShowProducts(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;

        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("showProducts")) {
                    url = processShowProducts(request, response);
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } else if (action.equals("updateQuantity")) {
                    url = processUpdateQuantity(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at TrangChu: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
        return "Servlet TrangChu";
    }
}
