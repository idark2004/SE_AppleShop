/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author ADMIN
 */
public class UserDTO {
    private String userID;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String status;
    private String roleID;

    public UserDTO() {
    }

    public UserDTO(String userID, String name, String email, String password, String phone, String address, String roleID) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
    }

    public UserDTO(String userID, String name, String email, String password, String phone, String address, String status, String roleID) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.roleID = roleID;
    }
    
    
    public UserDTO(String email, String name, String password, String address, String phone, String roleID) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
    }

    public UserDTO(String userID, String name, String email, String status, String roleID) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.status = status;
        this.roleID = roleID;
    }
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    
    
    
}
