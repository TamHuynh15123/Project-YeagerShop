/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.productDAO;
import dao.userDAO;
import dto.CategoryDTO;
import dto.productDTO;
import dto.userDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;
import utils.PasswordUtils;

/**
 *
 * @author dangk
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public productDAO productDAO = new productDAO();
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String HOME_PAGE = "home.jsp";
    private static final String DETAIL_PAGE = "detail.jsp";
    private static final String FORM_PAGE = "productform.jsp";

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUsername = request.getParameter("txtusername");
        String strPassword = request.getParameter("txtpassword");
        if (AuthUtils.isValidLogin(strUsername, strPassword)) {
            url = processHome(request, response);
            userDTO user = AuthUtils.getUser(strUsername);
            request.getSession().setAttribute("user", user);
            // search
            url = processHome(request, response);

        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
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
        return processHome(request, response);
    }

    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        productDAO dao = new productDAO();

        List<CategoryDTO> listC = dao.getAllCategory();
        List<productDTO> product = dao.searchByName(searchTerm);
        request.setAttribute("listP", product);
        request.setAttribute("listC", listC);
        request.setAttribute("searchTerm", searchTerm);

        return HOME_PAGE;
    }

    private String processView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = DETAIL_PAGE;

        try {
            int productid = Integer.parseInt(request.getParameter("id"));
            if (productid > 0) {
                productDTO product = productDAO.readByID(productid);
                if (product != null) {
                    request.setAttribute("product", product);
                } else {
                    request.setAttribute("message", "product not found.");
                    request.setAttribute("messageType", "error");
                }
            } else {
                request.setAttribute("message", "Invalid product ID.");
                request.setAttribute("messageType", "error");
            }
        } catch (Exception e) {
            request.setAttribute("message", "Error loading book details: " + e.getMessage());
            request.setAttribute("messageType", "error");
            System.out.println("Error in processViewDetail: " + e.toString());
        }

        return url;
    }

    private String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;

                int id = Integer.parseInt(request.getParameter("txtid")); // thêm dòng này
                String productname = request.getParameter("txtproductname");
                String description = request.getParameter("txtdescription");
                String type = request.getParameter("txttype");
                int quantity = Integer.parseInt(request.getParameter("txtquantity"));
                float price = Float.parseFloat(request.getParameter("txtprice"));
                String image = request.getParameter("txtimage");
                boolean status = Boolean.parseBoolean(request.getParameter("txtstatus"));

                if (quantity < 0) {
                    checkError = true;
                    request.setAttribute("txtQuantity_error", "Quantity >=0.");
                }

                productDTO product = new productDTO(productname, description, quantity, price, status, image);
                product.setId(id); // quan trọng!!!

                if (!checkError) {
                    boolean updated = productDAO.update(product);
                    System.out.println("Update status: " + updated);
                    url = HOME_PAGE;
                    processSearch(request, response);
                } else {
                    request.setAttribute("product", product);
                    url = FORM_PAGE;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return url;
    }

    private String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = HOME_PAGE; // Hoặc một trang mặc định khác
        HttpSession session = request.getSession();

        if (AuthUtils.isAdmin(session)) { // Kiểm tra có phải admin hay không
            try {
                int id = Integer.parseInt(request.getParameter("id")); // Lấy id trên URL
                productDTO product = productDAO.readByID(id);   // Lấy sản phẩm từ DB (nhớ viết hàm này trong DAO)

                if (product != null) {
                    request.setAttribute("product", product);
                    url = FORM_PAGE; // FORM_PAGE chính là "productform.jsp" hoặc tên bạn đặt
                } else {
                    request.setAttribute("errorMessage", "Product not found!");
                    url = HOME_PAGE; // Có thể là home.jsp hoặc trang báo lỗi
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error while loading product data!");
                url = HOME_PAGE;
            }
        }

        return url; // Cuối cùng controller của bạn sẽ forward theo url này
    }

    private String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();

        if (AuthUtils.isAdmin(session)) { // Kiểm tra quyền admin
            try {
                boolean checkError = false;

                String productname = request.getParameter("txtproductname");
                String description = request.getParameter("txtdescription");
                String type = request.getParameter("txttype");
                int quantity = Integer.parseInt(request.getParameter("txtquantity"));
                float price = Float.parseFloat(request.getParameter("txtprice"));
                String image = request.getParameter("txtimage");
                boolean status = Boolean.parseBoolean(request.getParameter("txtstatus"));

                if (quantity < 0) {
                    checkError = true;
                    request.setAttribute("txtQuantity_error", "Quantity >= 0.");
                }

                productDTO product = new productDTO(productname, description, quantity, price, status, image);

                if (!checkError) {
                    boolean inserted = productDAO.add(product);
                    System.out.println("Insert status: " + inserted);

                    if (inserted) {
                        url = HOME_PAGE;
                        processSearch(request, response); // Load lại danh sách sản phẩm
                    } else {
                        url = FORM_PAGE; // Có thể là addForm.jsp
                        request.setAttribute("errorMessage", "Insert failed.");
                    }
                } else {
                    request.setAttribute("product", product);
                    url = FORM_PAGE;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return url;
    }

    private String processSignUp(HttpServletRequest request, HttpServletResponse response) {
        String url = "signup.jsp"; // Mặc định quay lại signup.jsp nếu có lỗi

        try {
            // Lấy dữ liệu từ form signup.jsp
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");

            boolean hasError = false;

            // Kiểm tra dữ liệu cơ bản
            if (username == null || username.trim().isEmpty()) {
                request.setAttribute("usernameError", "Username is required");
                hasError = true;
            }
            if (password == null || password.trim().isEmpty()) {
                request.setAttribute("passwordError", "Password is required");
                hasError = true;
            }
            if (!password.equals(confirm)) {
                request.setAttribute("confirmError", "Passwords do not match");
                hasError = true;
            }
            if (fullname == null || fullname.trim().isEmpty()) {
                request.setAttribute("fullnameError", "Fullname is required");
                hasError = true;
            }
            if (email == null || email.trim().isEmpty()) {
                request.setAttribute("emailError", "Email is required");
                hasError = true;
            }

            userDAO dao = new userDAO();

            // Kiểm tra username đã tồn tại chưa
            if (dao.readByID(username) != null) {
                request.setAttribute("usernameError", "Username already exists");
                hasError = true;
            }

            if (!hasError) {
                // Mã hóa mật khẩu trước khi lưu
                String hashedPassword = PasswordUtils.hashPassword(password);

                // Tạo userDTO với role mặc định là 'US'
                userDTO newUser = new userDTO(username, hashedPassword, fullname, email, "US");

                boolean created = dao.create(newUser);

                if (created) {
                    request.setAttribute("signupSuccess", "Sign up successful! Please log in.");
                    url = "login.jsp"; // Đưa user về trang login.jsp
                } else {
                    request.setAttribute("signupError", "Sign up failed. Please try again.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("signupError", "Error: " + e.getMessage());
        }

        return url;
    }

    private String processHome(HttpServletRequest request, HttpServletResponse response) {
        try {

            List<CategoryDTO> listC = productDAO.getAllCategory();
            List<productDTO> listP = productDAO.readAll();

            request.setAttribute("listC", listC);
            request.setAttribute("listP", listP);

            return "home.jsp"; // Chuyển đến trang chủ
        } catch (Exception e) {
            log("Error at processHome: " + e.toString());
            return "error.jsp"; // Chuyển hướng nếu lỗi
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;

        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = processHome(request, response);
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } else if (action.equals("view")) {
                    url = processView(request, response);
                } else if (action.equals("update")) {
                    url = processUpdate(request, response);
                } else if (action.equals("edit")) {
                    url = processEdit(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                } else if (action.equals("signup")) {
                    url = processSignUp(request, response);
                } else if (action.equals("home")) {
                    url = processHome(request, response);
                }
            }
//            your code here

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
