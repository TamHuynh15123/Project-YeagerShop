/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dangk
 */
@WebServlet(name = "main", urlPatterns = {"/main"})
public class main extends HttpServlet {

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
        else if (action.equals("createProjects")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user"); // nhớ dùng key "user"
                    if (user == null || !user.getRole().equalsIgnoreCase("Founder")) {
                        session.setAttribute("message", "Only Founder can create projects!");
                        url = "home.jsp";
                    } else {
                        // Chuyển hướng đến form create.jsp
                        url = "create.jsp";
                    }
                } else if (action.equals("create")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user"); 
                    if (user != null && user.getRole().equalsIgnoreCase("Founder")) {
                        // Lấy dữ liệu từ form
                        String projectName = request.getParameter("project_name");
                        String description = request.getParameter("description");
                        String status = request.getParameter("status");
                        java.sql.Date estimatedLaunch = java.sql.Date.valueOf(request.getParameter("estimated_launch"));

                        ProjectsDTO newProject = new ProjectsDTO(0, projectName, description, status, estimatedLaunch);
                        ProjectsDAO pdao = new ProjectsDAO();
                        boolean created = pdao.create(newProject);
                        if (created) {
                            session.setAttribute("message", "Project created successfully!");
                        } else {
                            session.setAttribute("message", "Project creation failed!");
                        }
                    } else {
                        session.setAttribute("message", "Permission denied!");
                    }
                    url = "home.jsp";
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
