/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author HP
 */
public class UserDTO {

    private String id;
    private String username;
    private String email;
    private String password;
    private String roleID;

    public UserDTO() {
    }

    public UserDTO(String id, String username, String email, String password, String roleID) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "id=" + id + ", username=" + username + ", email=" + email + ", password=" + password + ", roleID=" + roleID + '}';
    }

}
