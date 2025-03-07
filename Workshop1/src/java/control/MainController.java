/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.UserDAO;
import dao.ProjectDAO;
import dto.UserDTO;
import dto.ProjectDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Scanner;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dangk
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private ProjectDAO pd = new ProjectDAO();
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String SEARCH_PAGE = "search.jsp";
    private static final String UPDATE_PAGE = "update.jsp";
    private static final String PROJECT_PAGE = "project.jsp";
    public static final Scanner sc = new Scanner(System.in);

    public UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readbyID(strUserID);
        return user;
    }

    public static boolean isLogined(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static boolean isFounder(HttpSession session) {
        UserDTO user = new UserDTO();
        user = (UserDTO) session.getAttribute("user");
        return isLogined(session) && user.getRole().equals("Founder");
    }

    public static boolean isTeamMember(HttpSession session) {
        UserDTO user = new UserDTO();
        user = (UserDTO) session.getAttribute("user");
        return isLogined(session) && user.getRole().equals("Team Member");
    }

    public boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        System.out.println(user);
//        System.out.println(user.getPassword());
        System.out.println(strPassword);
        return user != null && user.getPassword().equals(strPassword);
    }


    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        HttpSession session = request.getSession();
        if (searchTerm == null) {
            searchTerm = "";
        }
        if (isTeamMember(session)) {
            List<ProjectDTO> projects = pd.searchByTitle(searchTerm);
            request.setAttribute("projects", projects);
            request.setAttribute("searchTerm", searchTerm);
        } else if (isFounder(session)) {
            List<ProjectDTO> projects = pd.searchByTitleAD(searchTerm);
            request.setAttribute("projects", projects);
            request.setAttribute("searchTerm", searchTerm);
        }
    }

    private String ProcessLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUserID = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");
        if (isValidLogin(strUserID, strPassword)) {
            url = SEARCH_PAGE;
            UserDTO user = getUser(strUserID);
            request.getSession().setAttribute("user", user);

            // search
            search(request, response);
        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
            url = LOGIN_PAGE;
        }
        return url;
    }

    private String ProcessLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            request.getSession().invalidate(); // Hủy bỏ session
            return LOGIN_PAGE;
        }
        return LOGIN_PAGE;
    }

    private String ProcessSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (isFounder(session)) {
            // search
            search(request, response);
            return SEARCH_PAGE;
        }
        return LOGIN_PAGE;
    }

    private String ProcessUpDatePJ(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    String url = UPDATE_PAGE;
    boolean checkError = false;

    try {
        // Lấy dữ liệu từ request
        String projectIdStr = request.getParameter("projectId");
        String projectName = request.getParameter("projectName");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String estimatedLaunchStr = request.getParameter("estimatedLaunch");
        String activeStr = request.getParameter("active");

        Integer projectId = null;
        Date estimatedLaunch = null;
        Integer active = null;

        // Kiểm tra Project ID
        try {
            projectId = Integer.parseInt(projectIdStr);
            if (projectId <= 0) {
                checkError = true;
                request.setAttribute("projectId_error", "Project ID must be greater than 0.");
            }
        } catch (NumberFormatException e) {
            checkError = true;
            request.setAttribute("projectId_error", "Invalid Project ID format.");
        }

        // Kiểm tra Project Name
        if (projectName == null || projectName.trim().isEmpty()) {
            checkError = true;
            request.setAttribute("projectName_error", "Project Name is required.");
        }

        // Kiểm tra Estimated Launch Date
        if (estimatedLaunchStr != null && !estimatedLaunchStr.trim().isEmpty()) {
            try {
                estimatedLaunch = Date.valueOf(estimatedLaunchStr);
            } catch (IllegalArgumentException e) {
                checkError = true;
                request.setAttribute("estimatedLaunch_error", "Invalid date format. Use YYYY-MM-DD.");
            }
        } else {
            checkError = true;
            request.setAttribute("estimatedLaunch_error", "Estimated Launch Date is required.");
        }

        // Kiểm tra Active Status
        try {
            active = Integer.parseInt(activeStr);
            if (active < 0 || active > 1) {
                checkError = true;
                request.setAttribute("active_error", "Active status must be 0 or 1.");
            }
        } catch (NumberFormatException e) {
            checkError = true;
            request.setAttribute("active_error", "Invalid Active status.");
        }

        // Nếu không có lỗi, cập nhật dự án
        if (!checkError) {
            ProjectDAO dao = new ProjectDAO();
            ProjectDTO project = new ProjectDTO(projectId, projectName, description, status, estimatedLaunch, active);
            boolean success = dao.update(project);

            if (success) {
                session.setAttribute("message", "Update Successfully!!!");
                url = SEARCH_PAGE;
                search(request, response);
            } else {
                session.setAttribute("message", "Update Not Successfully!!!");
            }
        } else {
            // Lưu lại dữ liệu để hiển thị lại trên form khi có lỗi
            request.setAttribute("projectId", projectIdStr);
            request.setAttribute("projectName", projectName);
            request.setAttribute("description", description);
            request.setAttribute("status", status);
            request.setAttribute("estimatedLaunch", estimatedLaunchStr);
            request.setAttribute("active", activeStr);
        }
    } catch (Exception e) {
        log("Error at ProcessUpDatePJ: " + e.getMessage());
        e.printStackTrace();
        session.setAttribute("message", "Server Error! Please try again.");
    }

    return url;
}


    private String ProcessAdd(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String url = PROJECT_PAGE;
    HttpSession session = request.getSession();
    boolean checkError = false;

    try {
        // Lấy dữ liệu từ request
        String projectIdStr = request.getParameter("txtProjectID");
        String projectName = request.getParameter("txtProjectName");
        String description = request.getParameter("txtDescription");
        String status = request.getParameter("txtStatus");
        String dateString = request.getParameter("txtEstimatedLaunch");

        Integer projectId = null;
        Date estimatedLaunch = null;

        // Kiểm tra Project ID không được để trống
        if (projectIdStr == null || projectIdStr.trim().isEmpty()) {
            checkError = true;
            request.setAttribute("txtProjectID_error", "Project ID is required.");
        } else {
            try {
                projectId = Integer.parseInt(projectIdStr);
                if (projectId <= 0) {
                    checkError = true;
                    request.setAttribute("txtProjectID_error", "Project ID must be greater than 0.");
                } else {
                    // Kiểm tra ID có bị trùng không
                    if (pd.isProjectIdExists(projectId)) { // Gọi hàm kiểm tra ID tồn tại
                        checkError = true;
                        request.setAttribute("txtProjectID_error", "Project ID already exists.");
                    }
                }
            } catch (NumberFormatException e) {
                checkError = true;
                request.setAttribute("txtProjectID_error", "Project ID must be a valid number.");
            }
        }

        // Kiểm tra Project Name không được để trống
        if (projectName == null || projectName.trim().isEmpty()) {
            checkError = true;
            request.setAttribute("txtProjectName_error", "Project Name is required.");
        }

        // Kiểm tra Description không được để trống
        if (description == null || description.trim().isEmpty()) {
            checkError = true;
            request.setAttribute("txtDescription_error", "Description is required.");
        }

        // Kiểm tra Status không được để trống
        if (status == null || status.trim().isEmpty()) {
            checkError = true;
            request.setAttribute("txtStatus_error", "Status is required.");
        }

        // Kiểm tra Estimated Launch không được để trống
        if (dateString == null || dateString.trim().isEmpty()) {
            checkError = true;
            request.setAttribute("txtEstimatedLaunch_error", "Estimated Launch Date is required.");
        } else {
            try {
                estimatedLaunch = Date.valueOf(dateString); // Format: YYYY-MM-DD
            } catch (IllegalArgumentException e) {
                checkError = true;
                request.setAttribute("txtEstimatedLaunch_error", "Invalid date format. Use YYYY-MM-DD.");
            }
        }

        // Nếu không có lỗi, lưu vào database
        if (!checkError) {
            ProjectDTO project = new ProjectDTO(projectId, projectName, description, status, estimatedLaunch);
            pd.create(project);
            search(request, response);
            url = PROJECT_PAGE;
            session.setAttribute("message", "Add new project successfully.");
        } else {
            // Lưu lại dữ liệu đã nhập để hiển thị lại trên form
            request.setAttribute("txtProjectID", (projectIdStr != null) ? projectIdStr : "");
            request.setAttribute("txtProjectName", (projectName != null) ? projectName : "");
            request.setAttribute("txtDescription", (description != null) ? description : "");
            request.setAttribute("txtStatus", (status != null) ? status : "");
            request.setAttribute("txtEstimatedLaunch", (dateString != null) ? dateString : "");
            url = PROJECT_PAGE;
        }
    } catch (Exception e) {
        log("Error at ProcessAdd: " + e.toString());
        e.printStackTrace();
    }

    return url;
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
                    url = ProcessLogin(request, response);
                } else if (action.equals("logout")) {
                    url = ProcessLogout(request, response);
                } else if (action.equals("search")) {
                    url = ProcessSearch(request, response);
                } else if (action.equals("updateProject")) {
                    HttpSession session = request.getSession();
                    if (isFounder(session) == true) {
                        url = ProcessUpDatePJ(request, response);
                    }
                } else if (action.equals("add")) {
                    HttpSession session = request.getSession();
                    if (isFounder(session) == true) {
                        url = ProcessAdd(request, response);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
