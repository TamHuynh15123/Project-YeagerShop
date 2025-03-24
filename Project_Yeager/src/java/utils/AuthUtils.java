/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.userDAO;
import dto.userDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tungi
 */
public class AuthUtils {

    private static final String ADMIN_ROLE = "AD";
    private static final String USER_ROLE = "US";

    public static userDTO getUser(String strUserID) {
        userDAO udao = new userDAO();
        userDTO user = udao.readByID(strUserID);
        return user;
    }

    public static boolean isValidLogin(String strUserID, String strPassword) {
        userDTO user = getUser(strUserID);
        System.out.println(user);
        return user != null && utils.PasswordUtils.checkPassword(strPassword, user.getPassword());
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static userDTO getUser(HttpSession session) {
        if (!isLoggedIn(session)) {
            return null;
        }
        return (userDTO) session.getAttribute("user");
    }

    public static boolean isAdmin(HttpSession session) {
        if (!isLoggedIn(session)) {
            return false;
        }
        userDTO user = getUser(session);
        return user.getRole().equals(ADMIN_ROLE);
    }
}