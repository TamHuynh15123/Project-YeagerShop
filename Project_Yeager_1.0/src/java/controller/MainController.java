/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.productDAO;
import dao.userDAO;
import dto.CartItemDTO;
import dto.CategoryDTO;
import dto.productDTO;
import dto.userDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
    private static final String ADD_PAGE = "add.jsp";

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
            int productid = Integer.parseInt(request.getParameter("pid"));
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
                int id = Integer.parseInt(request.getParameter("pid")); // Lấy id trên URL
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
                int quantity = 0;
                float price = 0;
                int category_id = 0;
                String image = request.getParameter("txtimage");
                boolean status = Boolean.parseBoolean(request.getParameter("txtstatus"));

                // Kiểm tra số nguyên và float
                try {
                    quantity = Integer.parseInt(request.getParameter("txtquantity"));
                    if (quantity < 0) {
                        checkError = true;
                        request.setAttribute("txtQuantity_error", "Quantity must be >= 0.");
                    }
                } catch (NumberFormatException e) {
                    checkError = true;
                    request.setAttribute("txtQuantity_error", "Invalid quantity format.");
                }

                try {
                    price = Float.parseFloat(request.getParameter("txtprice"));
                    if (price < 0) {
                        checkError = true;
                        request.setAttribute("txtPrice_error", "Price must be >= 0.");
                    }
                } catch (NumberFormatException e) {
                    checkError = true;
                    request.setAttribute("txtPrice_error", "Invalid price format.");
                }

                try {
                    category_id = Integer.parseInt(request.getParameter("txtcategory"));
                } catch (NumberFormatException e) {
                    checkError = true;
                    request.setAttribute("txtCategory_error", "Invalid category ID.");
                }

                productDTO product = new productDTO(productname, description, category_id, quantity, price, status, image);

                if (!checkError) {
                    boolean inserted = productDAO.add(product);
                    if (inserted) {
                        url = HOME_PAGE;
                        processSearch(request, response); // Load lại danh sách sản phẩm
                    } else {
                        url = ADD_PAGE;
                        request.setAttribute("errorMessage", "Insert failed.");
                    }
                } else {
                    request.setAttribute("product", product);
                    url = ADD_PAGE;
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while adding the product.");
                url = ADD_PAGE;
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

    private String processAddToCart(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("pid"));

        // Lấy thông tin sản phẩm từ database
        productDAO dao = new productDAO();
        productDTO product = dao.readByID(productId);

        if (product == null) {
            request.setAttribute("message", "Sản phẩm không tồn tại.");
            return "error.jsp";
        }

        // Lấy giỏ hàng từ session (nếu chưa có thì tạo mới)
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Kiểm tra xem sản phẩm đã có trong giỏ chưa
        boolean found = false;
        for (CartItemDTO item : cart) {
            if (item.getId() == productId) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        // Nếu chưa có trong giỏ hàng, thêm mới
        if (!found) {
            CartItemDTO newItem = new CartItemDTO(
                    product.getId(),
                    product.getProductname(),
                    1, // Mặc định thêm 1 sản phẩm
                    product.getPrice(),
                    product.getSrcimg()
            );
            cart.add(newItem);
        }

        // Cập nhật giỏ hàng trong session
        session.setAttribute("cart", cart);

        // Chuyển hướng về trang giỏ hàng hoặc sản phẩm
        return "MainController?action=viewcart";
    }

    private String processRemoveFromCart(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("pid"));

        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(item -> item.getId() == productId);
            session.setAttribute("cart", cart);
        }

        return "MainController?action=viewcart";
    }

    private String processCheckout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("message", "Giỏ hàng trống, không thể thanh toán.");
            return "cart.jsp";
        }

        // Xử lý thanh toán (giả định)
        session.removeAttribute("cart"); // Xóa giỏ hàng sau khi thanh toán
        request.setAttribute("message", "Thanh toán thành công!");

        return "checkoutSuccess.jsp"; // Tạo trang này để hiển thị thông báo thành công
    }

    private String processViewCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");

            if (cart == null || cart.isEmpty()) {
                request.setAttribute("message", "Giỏ hàng của bạn đang trống.");
            }

            return "cart.jsp"; // Chuyển hướng đến trang giỏ hàng
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi hiển thị giỏ hàng.");
            return "home.jsp";
        }
    }

    private String processManageAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            userDTO user = (userDTO) session.getAttribute("user");

            if (user == null) {
                response.sendRedirect("login.jsp");
                return "redirect";
            }

            String fullName = request.getParameter("fullName");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String currentPassword = request.getParameter("currentPassword");

            userDAO dao = new userDAO();
            userDTO currentUser = dao.readByID(user.getUsername());

            if (currentUser == null || !PasswordUtils.checkPassword(currentPassword, currentUser.getPassword())) {
                request.setAttribute("error", "Mật khẩu hiện tại không đúng.");
                return "manageAccount.jsp";
            }

            if (!newPassword.isEmpty() && !newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu mới không khớp.");
                return "manageAccount.jsp";
            }

            if (!newPassword.isEmpty()) {
                currentUser.setPassword(PasswordUtils.hashPassword(newPassword));
            }

            currentUser.setFullname(fullName);

            if (dao.update(currentUser)) {
                request.setAttribute("message", "Cập nhật thành công!");
                session.setAttribute("user", currentUser);
            } else {
                request.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại.");
            }

            return "manageAccount.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại sau.");
            return "manageAccount.jsp";
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Đặt encoding cho response để hiển thị đúng
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

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
                } else if (action.equals("manage")) {
                    url = processManageAccount(request, response);
                } else if (action.equals("addcart")) {
                    url = processAddToCart(request, response);
                } else if (action.equals("remove")) {
                    url = processRemoveFromCart(request, response);
                } else if (action.equals("checkout")) {
                    url = processCheckout(request, response);
                } else if (action.equals("viewcart")) {
                    url = processViewCart(request, response);
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
        request.setCharacterEncoding("UTF-8");

        // Đặt encoding cho response để hiển thị đúng
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
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
        request.setCharacterEncoding("UTF-8");

        // Đặt encoding cho response để hiển thị đúng
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
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
