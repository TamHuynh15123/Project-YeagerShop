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

    private String userid;
    private String name;
    private String email;
    private String password;
    private String roleID;

    public UserDTO() {
    }

    public UserDTO(String userid, String name, String email, String password) {
        this.userid = userid;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public UserDTO(String userid, String name, String email, String password, String roleID) {
        this.userid = userid;
        this.name = name;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        return "UserDTO{" + "userid=" + userid + ", name=" + name + ", email=" + email + ", password=" + password + ", roleID=" + roleID + '}';
    }

}
