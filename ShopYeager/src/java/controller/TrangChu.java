package controller;

import dao.ProductsDAO;
import dao.UserDAO;
import dto.ProductsDTO;
import dto.UserDTO;
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
        String userid = request.getParameter("txtUserID");
        String password = request.getParameter("txtPassword");

        if (AuthUtils.isValidLogin(userid, password)) {
            url = HOME_PAGE;
            HttpSession session = request.getSession();
            session.setAttribute("user", AuthUtils.getUser(userid));

        } else {
            request.setAttribute("message", "UserID or password incorrect!!");
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

    private String processSignup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Lấy thông tin từ form
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra password có khớp không
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            return "signup.jsp";  // Trang hiển thị lỗi đăng ký
        }

        // Tạo UserDTO để lưu thông tin
        UserDTO newUser = new UserDTO(username, name, email, password);

        // Gọi DAO để lưu vào database
        UserDAO dao = new UserDAO();
        boolean created = dao.create(newUser);

        if (created) {
            // Đăng ký thành công, chuyển về trang login
            request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
            return "login.jsp";
        } else {
            // Đăng ký thất bại
            request.setAttribute("error", "Đăng ký thất bại. Tên người dùng có thể đã tồn tại.");
            return "signup.jsp";
        }
    }

    private String processShowProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            List<ProductsDTO> products = productsDAO.readAll();
            int page, numberpage=10;
            int size = products.size();
            int num = (size%10 == 0 ?(size/10):((size/10))+1);
            String xpage = request.getParameter("page");
            if(xpage == null){
                page = 1;
            }else{
                page = Integer.parseInt(xpage);
            }
            int start,end;
            start = (page-1)*numberpage;
            end = Math.min(page*numberpage, size);
            List<ProductsDTO> products1 = productsDAO.getProductsByPage(products, start, end);
            request.setAttribute("products", products1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.getRequestDispatcher("menuhome.jsp").forward(request, response);
        }
        
        return null;
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
                } else if (action.equals("signup")) {
                    url = processSignup(request, response);
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
